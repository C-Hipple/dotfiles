;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     org
     scala
     sql
     clojure
     javascript
     vimscript
     python
     ess
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; ivy
     ipython-notebook
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 3))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(suscolors
                         spacemacs-light,
                         nord-theme)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy
   dotspacemacs-default-font '("AverageMono"
                               :size 26
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
  (push '('melpa-stable' . 'stable.melpa.org/packages/') configuration-layer--elpa-archives)
  (push '(helm . 'melpa-stable') package-pinned-packages))

`dotspacemacs/user-config' first."
  ;;(require 'ein)
 )

(defun rmd-mode ()
  "ESS Markdown mode for rmd files"
  (interactive)
  (setq load-path
        (append (list "~/.emacs.d/private/polymode/" "~/.emacs.d/layers/+lang/")
                load-path))
  (require 'poly-R)
  (require 'poly-markdown)
  (poly-markdown+r-mode))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Org-mode configurations are from the blog in the link below:
  ;; https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html

  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "PROGRESS(p)" "TENTATIVE(e)" "|" "DONE(d)" "CANCELLED(c)")))

  (setq org-agenda-files '("~/Documents/gtd/inbox.org"
                           "~/Documents/gtd/gtd.org"
                           "~/Documents/gtd/tickler.org"))

  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                 (file+headline "~/Documents/GTD/inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "~/Documents/GTD/tickler.org" "Tickler")
                                 "* %i%? \n %U")))

  (setq org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5)))

  ;;(setq org-refile-targets '(("~/Documents/GTD/gtd.org" :maxlevel . 3)
                             ;;("~/Documents/GTD/someday.org" :level . 1)
                             ;;("~/Documents/GTD/tickler.org" :maxlevel . 2)))


  (setq-default evil-escape-key-sequence "jj")
  (setq ein:notebook-modes '(ein:notebook-multilang-mode ein:notebook-python-mode))
  (define-key evil-normal-state-map (kbd "RET") 'spacemacs/insert-line-below-no-indent)
  (define-key evil-normal-state-map (kbd "C-RET") 'spacemacs/insert-line-above-no-indent)
  (define-key evil-normal-state-map (kbd "S-RET") 'spacemacs/insert-line-above-no-indent)

  (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
  (add-to-list 'load-path "~/.emacs.d/lisp")
  (add-to-list 'custom-theme-load-path' "~/dotfiles/emacs_themes/")
  (define-key evil-normal-state-map (kbd "R") (kbd "I#"))
  (require `helm-bookmark)
  (with-eval-after-load 'helm
    (setq helm-display-function 'helm-default-display-buffer))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-jump-helm-line-autoshow-mode t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("33af2d5cb040182b798c3a4ee6d16210e700a2fabaa409231e1c4a003cafd1c2" "406251a3b514a1b353dfba5e8986037ae354ee2b090039c1168fb985fef17aa7" "bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" "28fa7536c8f563c6d6296989937a8e87a2dc6477fd7b366e0336a8997a521094" "2593436c53c59d650c8e3b5337a45f0e1542b1ba46ce8956861316e860b145a0" "668793e975138624afffc010983862439fa01154ee96cf8da232cca81cb55d1e" "5057614f7e14de98bbc02200e2fe827ad897696bfd222d1bcab42ad8ff313e20" "820adda9854ceaf51d342cbf64acc665226556ef36757feb1ca8d176a49a6ea9" "3e83abe75cebf5621e34ce1cbe6e12e4d80766bed0755033febed5794d0c69bf" "2b2fff94a0e7e4f46d46b6cb072d43005a84460f6f812c5e63e0ec9e23b36ba0" "9fcac3986e3550baac55dc6175195a4c7537e8aa082043dcbe3f93f548a3a1e0" "242527ce24b140d304381952aa7a081179a9848d734446d913ca8ef0af3cef21" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "8dce5b23232d0a490f16d62112d3abff6babeef86ae3853241a85856f9b0a6e7" "a7004835dd02c73989032e57574087ec78ce8c2dd0d79f21cdd7423c01d9d2f5" "7b79c3b97320dbb339cb643f7841086ef9c5760148206894a17880f3f70d7165" "66f32da4e185defe7127e0dc8b779af99c00b60c751b0662276acaea985e2721" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "9b402e9e8f62024b2e7f516465b63a4927028a7055392290600b776e4a5b9905" "551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" "ab2cbf30ab758c5e936b527377d543ce4927001742f79519b62c45ba9dd9f55e" "fe1682ca8f7a255cf295e76b0361438a21bb657d8846a05d9904872aa2fb86f2" "d3a7eea7ebc9a82b42c47e49517f7a1454116487f6907cf2f5c2df4b09b50fc1" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "a4e6940f5c63f3c6759d35e6534eaa26ff14512aa61616a0584bda9f858c60b9" "16229c52cc5d182eea2a1ca424736232d1cbfec479a8045714822208145332f9" "4a5b30efbe455b1840b7d8bb8e8d94ee3abdb1de07654ed4d6f0be1e670962a9" "1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "2b9d658692fdcd9beda242cef1466db3814a87f1e149428e5b11cee7a6861b30" "e1994cf306356e4358af96735930e73eadbaf95349db14db6d9539923b225565" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "62408b3adcd05f887b6357e5bd9221652984a389e9b015f87bbc596aba62ba48" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#073642" t)
 '(gnus-logo-colors (quote ("#0d7b72" "#adadad")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-background-colors (quote ("#e8fce8" "#c1e7f8" "#f8e8e8")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(magit-diff-use-overlays nil)
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (helm-ag-r iodine-theme flatland-black-theme kaolin-themes planet-theme clues-theme hc-zenburn-theme avk-emacs-themes color-theme-sanityinc-solarized darkburn-theme monokai-theme zenburn-theme flatland-theme firecode-theme poly-R moe-theme espresso-theme lenlen-theme plan9-theme nord-theme dakrone-light-theme dakrone-theme flatui-theme dracula-theme soft-charcoal-theme soft-morning-theme soft-stone-theme professional-theme solarized-theme occidental-theme light-soap-theme hydandata-light-theme github-theme faff-theme autumn-light-theme eziam-theme alect-themes twilight-bright-theme poet-theme csv-mode undo-tree inflections edn seq spinner org-mime flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck ghub treepy sesman ac-ispell adaptive-wrap noflet ensime sbt-mode scala-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data wgrep smex ivy-hydra counsel-projectile counsel swiper ivy winum powerline org-category-capture gntp json-snatcher json-reformat multiple-cursors hydra parent-mode gitignore-mode fringe-helper git-gutter+ git-gutter fuzzy pos-tip flx let-alist graphql iedit anzu goto-chg ctable skewer-mode request-deferred websocket request deferred simple-httpd dash-functional tern peg eval-sexp-fu highlight queue pkg-info epl bind-map bind-key packed pythonic auto-complete popup sql-indent grandshell-theme badwolf-theme badger-theme abyss-theme gruvbox-theme ample-theme color-theme-sanityinc-tomorrow inkpot-theme creamsody-theme paper-theme jazz-theme dash org diminish paredit cider clojure-mode anaconda-mode ess julia-mode smartparens magit magit-popup evil git-commit with-editor company helm helm-core yasnippet avy markdown-mode async alert log4e projectile f js2-mode s suscolors-theme yapfify ws-butler window-numbering which-key web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline smeargle restart-emacs rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort popwin polymode pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view elisp-slime-nav ein dumb-jump diff-hl define-word dactyl-mode cython-mode company-tern company-statistics company-anaconda column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#969896" . "#f8eec7")))
 '(pos-tip-background-color "#1A3734")
 '(pos-tip-foreground-color "#FFFFC8")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:family "AverageMono" :foundry "outline" :slant normal :weight normal :height 75 :width normal)) (((class color) (min-colors 89)) (:background "#1c1c1c" :foreground "#eeeeee" :family "AverageMono" :foundry "outline" :slant normal :weight normal :height 75 :width normal)))))
