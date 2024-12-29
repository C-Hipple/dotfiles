(defun insert-todo-with-date ()
  (interactive)
  ;; TODO: get the right number of ***.  3 is typical for me though
  (insert "*** TODO ")
  (org-date-from-calendar)
  (insert " ")
  )

(define-key evil-normal-state-map (kbd "SPC C i") 'insert-todo-with-date)

(defun escape-quotes (str)
  "Escape all double quotes in STR."
  (replace-regexp-in-string "\"" "\\\\\"", str))

(defun escape-quotes (str)
  "Escape all double quotes in STR."
  (replace-regexp-in-string "\"" "\\\\\"" str))

(defun escape-quotes (str)
  "Escape all double quotes in STR."
  (replace-regexp-in-string "\"" "\\\\\"" str t t))

(message (escape-quotes "example"))

(defun run-llm (command)
  (interactive "sEnter LLM command: ")
  (setq command (concat "llm \"" (escape-quotes command) "\""))
  (message command)
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


;;can get versioned list here
;; https://github.com/mickeynp/combobulate/blob/ca2545be196ec32945b5db109578582d7c7270b5/.ts-setup.el#L2

;; from https://www.masteringemacs.org/article/how-to-get-started-tree-sitter
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
