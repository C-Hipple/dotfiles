(defun run-llm (command)
  (interactive "sEnter LLM command: ")
  (setq command (concat "llm \"" command "\""))
  (with-temp-buffer
    (pop-to-buffer (get-buffer-create "*llm*"))
    (insert-buffer-substring (current-buffer))
    (insert (shell-command-to-string command))
    )
  )

(define-key evil-normal-state-map (kbd ", l") 'run-llm)
