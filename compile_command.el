(defun run-individual-pytest ()
  "Compile using 'docker compose run --rm test <FULL_PATH>::'
   followed by the text from after 'def' up to but not including the first '(' on the current line."
  (interactive)
  (save-excursion
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
    (compile command))
  )


(define-key evil-normal-state-map (kbd "SPC c t") 'run-individual-pytest)

(defun run-pytest-full-file ()
  "Compile using 'docker compose run --rm test <FULL_PATH>::'
   followed by the text from after 'def' up to but not including the first '(' on the current line."
  (interactive)
  (save-excursion
    (setq fullpath (buffer-file-name))
    (setq root (projectile-project-root))
    (setq final_path (replace-regexp-in-string root "" fullpath))

    (setq command (concat "docker compose run --rm test "
                          final_path
                          " --no-cov --reuse-db --no-migrations"
                          ))
    (compile command)))

(define-key evil-normal-state-map (kbd "SPC c T") 'run-pytest-full-file)


  (defun cb-lint ()
    (interactive)
    (compile "docker compose run --rm ci linter.lint")
    )

  (defun cb-pyright()
    (interactive)
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
