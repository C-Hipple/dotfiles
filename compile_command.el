(defun run-individual-pytest ()
  "Compile using 'docker compose run --rm test <FULL_PATH>::'
   followed by the text from after 'def' up to but not including the first '(' on the current line."
  (interactive)
  (save-some-buffers 1)
  (setq my_line (thing-at-point 'line))

  (let ((pattern "^def \\([a-zA-Z0-9_]+\\)"))
    (when (string-match pattern my_line)
      (setq function-name (match-string 1 my_line))))

  (setq fullpath (buffer-file-name))
  (setq root (projectile-project-root))
  (setq final_path (replace-regexp-in-string root "" fullpath))
  (setq command (concat "docker compose run --rm test "
                        final_path
                        "::"
                        function-name
                        " --no-cov --reuse-db --no-migrations"
                        ))
  (message command)
  (compile command)
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

(defun format-by-mode ()
  "If we're in python, we use black-format-buffer, otherwise we use lsp-format-buffer"
    (interactive)
    (if (string= major-mode "python-ts-mode")
        (progn
          (message "Using python formatter")
          (py-isort-buffer)
          (python-black-buffer)
        )
      (lsp-format-buffer)
  )
    )

(define-key evil-normal-state-map (kbd ", f b") 'format-by-mode)

  (defun cb-lint ()
    (interactive)
    (save-some-buffers 1)
    (compile "docker compose run --rm ci linter.lint --fast")
    )

  (defun cb-pyright()
    (interactive)
    (save-some-buffers 1)
    (compile "docker compose run --rm ci linter.pyright.lint-branch")
    )

  (define-key evil-normal-state-map (kbd "SPC c l") 'cb-lint)
  (define-key evil-normal-state-map (kbd "SPC c p") 'cb-pyright)

  ;; frontend compilation
  (defun cb-rebuild-react ()
    (interactive)
    (compile "docker compose run --rm frontend-build yarn workspace @multimediallc/cb-react build")
    )

  (define-key evil-normal-state-map (kbd "SPC c f r b") 'cb-rebuild-react)

  (defun cb-test-react ()
    (interactive)
    (compile "docker compose run --rm frontend-build yarn workspace @multimediallc/cb-react test")
    )

  (define-key evil-normal-state-map (kbd "SPC c f r t") 'cb-test-react)
