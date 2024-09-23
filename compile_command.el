(defun run-individual-pytest ()
  "Compile using 'docker compose run --rm test <FULL_PATH>::'
   followed by the text from after 'def' up to but not including the first '(' on the current line."
  (interactive)
  (save-some-buffers 1)
  (let (
        (my_line (thing-at-point 'line))
        (function-name (current-test-at-point))
        (fullpath (buffer-file-name))
        (root (projectile-project-root))
        (final_path (replace-regexp-in-string root "" fullpath))
        )
    (compile (concat "docker compose run --rm test "
                     final_path
                     "::"
                     function-name
                     " --no-cov --reuse-db --no-migrations"
                     ))
    )
  )


(define-key evil-normal-state-map (kbd "SPC c t") 'run-individual-pytest)

(defun run-pytest-full-file ()
  "Compile using 'docker compose run --rm test <FULL_PATH>::'
   followed by the text from after 'def' up to but not including the first '(' on the current line."
  (interactive)
  (save-some-buffers 1)
  (setq fullpath (buffer-file-name))
  (setq root (projectile-project-root))
  (setq final_path (replace-regexp-in-string root "" fullpath))

  (setq command (concat "docker compose run --rm test "
                        final_path
                        " --no-cov --reuse-db --no-migrations"
                        ))
  (compile command))


;; Recompile should automatically save
(defun save-and-recompile ()
  (interactive)
  (save-some-buffers 1)
  (recompile)
  )

(define-key evil-normal-state-map (kbd "SPC c r") 'save-and-recompile)
(define-key evil-normal-state-map (kbd "SPC c T") 'run-pytest-full-file)

(defun format-buffer-by-mode ()
  "If we're in python, we use black-format-buffer, otherwise we use lsp-format-buffer"
  (interactive)
  (if (string= major-mode "python-ts-mode")
      (progn
        (py-isort-buffer)
        (python-black-buffer)
        )
    (lsp-format-buffer)
    )
  )

(define-key evil-normal-state-map (kbd ", f b") 'format-buffer-by-mode)

(defun current-test-at-point ()
  (let ((my-line (thing-at-point 'line))
        (pattern "^def \\([a-zA-Z0-9_]+\\)")
        (result nil)
        )
    ;;(message my-line)
    (if (string-match pattern my-line)
        ;; then
        (progn
          ;; (message "it matched")
          (setq result (match-string 1 my-line)))
      ;; else
      (save-excursion
        (while (re-search-forward pattern nil t -1)
          (beginning-of-line)
          (let ((this-line (thing-at-point 'line)))
            (message (concat "found test on line be " this-line))
            (when (string-match pattern this-line)
              (message "string-matched.")
              (setq result (match-string 1 this-line))
              )
            )
          )
        )
      )
    result
    )
  )


(defun call-current-test-at-point ()
  ;; lil helper to debug
  (interactive)
  (let ((res (current-test-at-point)))
    (message (concat "Found above test: " res ))
    )
  )

(define-key evil-normal-state-map (kbd "SPC c F") 'call-current-test-at-point)


(defun cb-lint ()
  (interactive)
  (save-some-buffers 1)
  (compile "docker compose run --rm ci linter.lint --fast")
  )

;; Working on being able to automatically use the re-run
;; Final vision is to read the compilation buffer and see if
;; there's a Re-run ... line, and use that command via docker
;; Currently it expects the Re-Run line to be at the cursor

(defun split-line-after-string (line delimiter)
  "Splits a line after the first occurrence of DELIMITER and returns the second half.

If DELIMITER is not found, returns nil."
  (let ((pos (string-match delimiter line)))
    (if pos
        (substring line (1+ (+ 1 pos)))   ; Extract substring after the delimiter ;;extra +1 for teh space
      nil)))                          ; Return nil if delimiter not found

(defun cb-re-lint()
  (interactive)
  (with-current-buffer "*compilation*"
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "^Re-run" nil t)
        (beginning-of-line)
        (let ((line (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
          (save-some-buffers 1)
          (compile (concat "docker compose run --rm ci " (split-line-after-string line ": ")))
          )))))



(defun cb-pyright()
  (interactive)
  (save-some-buffers 1)
  (compile "docker compose run --rm ci linter.pyright.lint-branch")
  )

(defun cb-format()
  (interactive)
  (save-some-buffers 1)
  (compile "docker compose run --rm ci formatpy.format")
  )

(defun my-recompile()
  (interactive)
  (save-some-buffers 1)
  (recompile)
  )


(define-key evil-normal-state-map (kbd "SPC c l") 'cb-lint)
(define-key evil-normal-state-map (kbd "SPC c R") 'cb-re-lint)
(define-key evil-normal-state-map (kbd "SPC c r") 'my-recompile)
(define-key evil-normal-state-map (kbd "SPC c p") 'cb-pyright)
(define-key evil-normal-state-map (kbd "SPC c f") 'cb-format)

(defun cb-reformat()
  ;; Reformats files in the region selected by black output
  ;; would reformat /opt/app/common/util/util.py
  (interactive)
  ;; TODO implement
  )

(defun save-all()
  (interactive)
  (save-some-buffers 1)
  )

(define-key evil-normal-state-map (kbd "SPC c s") 'save-all)

;; frontend compilation
(defun cb-rebuild-react ()
  (interactive)
  (compile "docker compose run --rm frontend-build yarn workspace @multimediallc/cb-react build")
  )

;;(define-key evil-normal-state-map (kbd "SPC c f r b") 'cb-rebuild-react)

(defun cb-test-react ()
  (interactive)
  (compile "docker compose run --rm frontend-build yarn workspace @multimediallc/cb-react test")
  )

;;(define-key evil-normal-state-map (kbd "SPC c f r t") 'cb-test-react)


;; Stashing
(defun magit-stash-read-message ()
  "OVERLOADED: Always include the branch name in the stash message.
Read a message from the minibuffer, to be used for a stash.

The message that Git would have picked, is available as the
default (used when the user enters the empty string) and as
the next history element (which can be accessed with \
\\<minibuffer-local-map>\\[next-history-element])."
  (concat
   (magit-get-current-branch)
   ": "
   (read-string (format "Stash message (default: On%s:%s): "
                        (magit--ellipsis) (magit--ellipsis))
                nil nil
                (format "%s"
                        (magit-rev-format "%h %s"))))
  )

(defun buffer-exists (buffer-name)
  (not (eq nil (get-buffer buffer-name))
       )
  )

;; (defun check-buffa (buffer-name)
;;   (interactive)
;;   (when (buffer-exists buffer-name)
;;     (with-current-buffer buffer-name
;;       buffer-substring
;;       )
;;     )
;;   )

;; (check-buffa "*scratch*")
