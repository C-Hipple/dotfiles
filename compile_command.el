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

(defun run-individual-pytest ()
  "Compile using 'docker compose run --rm test <FULL_PATH>::'
   followed by the text from after 'def' up to but not including the first '(' on the current line."
  (interactive)
  (save-some-buffers 1)
  (let (
        (my_line (thing-at-point 'line))
        (function-name (current-test-at-point))
        (final_path (replace-regexp-in-string (projectile-project-root) "" (buffer-file-name)))
        )

    (compile (concat "docker compose run --rm test "
                     final_path
                     "::"
                     function-name
                     " --no-cov --reuse-db --no-migrations"
                     ))
    )
  )


(defun save-all()
  (interactive)
  (save-some-buffers 1)
  )


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


(defun cb-lint ()
  (interactive)
  (save-some-buffers 1)
  (compile "docker compose run --rm ci linter.lint --fast")
  )

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


(defun split-line-after-string (line delimiter)
  "Splits a line after the first occurrence of DELIMITER and returns the second half.

If DELIMITER is not found, returns nil."
  (let ((pos (string-match delimiter line)))
    (if pos
        (substring line (1+ (+ 1 pos)))   ; Extract substring after the delimiter ;;extra +1 for teh space
      nil)))                          ; Return nil if delimiter not found



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

(defun cb-py-test-command (file-name test-name)
  (concat "docker compose run --rm test "
          (replace-regexp-in-string (projectile-project-root) "" (buffer-file-name))
          "::"
          test-name
          " --no-cov --reuse-db --no-migrations"))

(with-eval-after-load 'test-at-point
  (add-to-list project-mode-command-overide-alist '("chaturbate" . ((python-ts-mode . cb-py-test-command)))))


(define-key evil-normal-state-map (kbd "SPC c t") 'run-individual-pytest)
(define-key evil-normal-state-map (kbd "SPC c A") 'get-command-by-mode)

(define-key evil-normal-state-map (kbd "SPC c r") 'save-and-recompile)
(define-key evil-normal-state-map (kbd "SPC c T") 'run-pytest-full-file)

(define-key evil-normal-state-map (kbd "SPC c F") 'call-current-test-at-point)

(define-key evil-normal-state-map (kbd ", f b") 'format-buffer-by-mode)




(define-key evil-normal-state-map (kbd "SPC c l") 'cb-lint)
(define-key evil-normal-state-map (kbd "SPC c R") 'cb-re-lint)
(define-key evil-normal-state-map (kbd "SPC c r") 'my-recompile)
(define-key evil-normal-state-map (kbd "SPC c p") 'cb-pyright)
(define-key evil-normal-state-map (kbd "SPC c f") 'cb-format)
;; (define-key evil-normal-state-map (kbd "SPC c f r t") 'cb-test-react)
