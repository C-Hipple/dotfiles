(defun run-llm (command)
  (interactive "sEnter LLM command: ")
  (setq command (concat "llm \"" command "\""))
  (with-temp-buffer
    (pop-to-buffer (get-buffer-create "*llm*"))
    (insert-buffer-substring (current-buffer))
    (insert (shell-command-to-string command))
    )
  )

(define-key evil-normal-state-map (kbd ", l l") 'run-llm)

(defun send-buffer-to-llm ()
  (interactive)
  ;; TODO need to escape quotes
  (setq command (concat "llm \"" (buffer-string) "\""))

  (with-temp-buffer
    (pop-to-buffer (get-buffer-create "*llm*"))
    (insert-buffer-substring (current-buffer))
    (insert (shell-command-to-string command))
    )

  )

(define-key evil-normal-state-map (kbd ", l b") 'send-buffer-to-llm)

