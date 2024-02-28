(defun compile-def-to-paren-with-docker ()
  "Compile using 'docker compose run --rm test <FULL_PATH>::'
   followed by the text from after 'def' up to but not including the first '(' on the current line."
  (interactive)
  (save-excursion
    (message "starting")
    (setq my_line (thing-at-point 'line))
    (message my_line)

    (let ((pattern "^def \\([a-zA-Z0-9_]+\\)"))
      (when (string-match pattern my_line)
        (setq function-name (match-string 1 my_line))))

    (message function-name)

    (setq original-string "Hello, world! Hello, Emacs!")
    (setq string-to-replace "Hello")
    (setq replacement-string "Goodbye")

    (setq new-string (replace-regexp-in-string string-to-replace replacement-string original-string))

    (setq fullpath (buffer-file-name))
    (message fullpath)
    (setq root (projectile-project-root))
    (message root)
    (setq final_path (replace-regexp-in-string root "" fullpath))
    (message final_path)

    (message "about to concat")
    (setq command (concat "docker compose run --rm test "
                          final_path
                          "::"
                          function-name
                          " --no-cov --reuse-db --no-migrations"
                          ))
    (message command)
    (compile command)))

(define-key evil-normal-state-map (kbd "SPC c t") 'compile-def-to-paren-with-docker)


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
