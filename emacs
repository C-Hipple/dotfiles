(require 'package) ;; Simple package system for emacs

;; Enable installation of packages from MELP
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it again, replace the t with 0)
(setq inhibit-splace-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)

;; Make org-mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass))))
(custom-set-faces
 )
