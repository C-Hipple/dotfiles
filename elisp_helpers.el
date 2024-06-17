(defun run-llm (command)
  (interactive "sEnter LLM command: ")
  (setq command (concat "llm \"" command "\""))
  (with-temp-buffer
    (pop-to-buffer (get-buffer-create "*llm*"))
    (insert-buffer-substring (current-buffer))
    (insert (shell-command-to-string command))
    (markdown-mode)
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


(defun my/org-mode-use-fixed-width-font ()
  "Set Org mode faces to use a fixed-width font."
  (set-face-attribute 'fixed-pitch nil :family "Courier New")
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-document-info-keyword nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-meta-line nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-document-info nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-verbatim nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-special-keyword nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-property-value nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-column nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-column-title nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-drawer nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-level-1 nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-level-2 nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-level-3 nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-level-4 nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-level-5 nil :inherit 'fixed-pitch)
  )

(add-hook 'org-mode-hook 'my/org-mode-use-fixed-width-font)
