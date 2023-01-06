;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     python
     javascript
     typescript
     rust
     go
     html
     sql
     ruby
     csv
     yaml
     emacs-lisp
     git
     helm
     lsp
     markdown
     multiple-cursors
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     treemacs)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(nord-theme suscolors-theme gruvbox-theme solarized-theme oceanic-theme rebecca-theme subatomic-theme obsidian-theme planet-theme smyx-theme underwater-theme magit magit-popup vs-light-theme dockerfile-mode helm-dash python-black)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(suscolors
                         gruvbox-dark-medium
                         nord
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Courier New"
                               :size 15.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."


  ;; Org-mode configurations are from the blog in the link below:
  ;; https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html


  ;; For the rare time we're doin tab-lyfe
  (setq default-tab-width 4)
  (setq tab-width 4)

  (setq org-startup-folded t)
  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "PROGRESS(p)" "TENTATIVE(e)" "BLOCKED(b)" "DELEGATED(l)" "|" "DONE(d)" "CANCELLED(c)" )))

  (setq org-agenda-files '("~/gtd/inbox.org"
                           "~/gtd/gtd.org"
                           "~/gtd/tickler.org"))

  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                 (file+headline "~/gtd/inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "~/gtd/tickler.org" "Tickler")
                                 "* %i%? \n %U")))

  (setq org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5)))

  (setq org-refile-targets '(("~/gtd/gtd.org" :maxlevel . 3)
                             ("~/gtd/someday.org" :level . 1)
                             ("~/gtd/tickler.org" :maxlevel . 2)))

  (setq-default helm-display-function 'helm-default-display-buffer)

  (define-key evil-normal-state-map (kbd "RET") 'spacemacs/insert-line-below-no-indent)
  (define-key evil-normal-state-map (kbd "C-RET") 'spacemacs/insert-line-above-no-indent)
  (define-key evil-normal-state-map (kbd "S-RET") 'spacemacs/insert-line-above-no-indent)


  (with-eval-after-load 'magit-mode
    (add-hook 'after-save-hook 'magit-after-save-refresh-status t))

  (setq org-todo-keyword-faces
        '(("TODO" . org-warning) ("STARTED" . "yellow") ("PROGRESS" . "orange") ("WAITING" . "yellow") ("DELEGATED" . "brown")
        ("CANCELED" . (:foreground "blue" :weight bold))))

  ;; define "R" as the prefix key for reviewing what happened in various
  ;; time periods
  (setq org-agenda-custom-commands
        '(("c" "Work" tags-todo "work" ;; (1) (2) (3) (4)
           ((org-agenda-files '("~/gtd/inbox.org" "~/gtd/gtd.org" "~/gtd/notes.org")) ;; (5)
            (org-agenda-sorting-strategy '(priority-up effort-down))) ;; (5) cont.
           ("~/computer.html")) ;; (6)
          ;; ...other commands here
          ))

  (add-to-list 'org-agenda-custom-commands
             '("R" . "Review" )
             )

  ;; Common settings for all reviews
  (setq efs/org-agenda-review-settings
      '((org-agenda-files '("~/gtd/notes.org"
                            "~/gtd/someday.org"
                            "~/gtd/gtd.org"
                            "~/gtd/inbox.org"
                            ))
        (org-agenda-show-all-dates t)
        (org-agenda-start-with-log-mode t)
        (org-agenda-start-with-clockreport-mode t)
        (org-agenda-archives-mode t)
        ;; I don't care if an entry was archived
        (org-agenda-hide-tags-regexp
         (concat org-agenda-hide-tags-regexp
                 "\\|ARCHIVE"))
      ))
  ;; Show the agenda with the log turn on, the clock table show and
  ;; archived entries shown.  These commands are all the same exept for
  ;; the time period.
  (add-to-list 'org-agenda-custom-commands
             `("Rw" "Week in review"
                agenda ""
                ;; agenda settings
                ,(append
                  efs/org-agenda-review-settings
                  '((org-agenda-span 'week)
                    (org-agenda-start-on-weekday 0)
                    (org-agenda-overriding-header "Week in Review"))
                  )
                ("~//review/week.html")
                ))


  (add-to-list 'org-agenda-custom-commands
             `("Rd" "Day in review"
                agenda ""
                ;; agenda settings
                ,(append
                  efs/org-agenda-review-settings
                  '((org-agenda-span 'day)
                    (org-agenda-overriding-header "Day in Review"))
                  )
                ("~//review/day.html")
                ))

  (add-to-list 'org-agenda-custom-commands
             `("Rm" "Month in review"
                agenda ""
                ;; agenda settings
                ,(append
                  efs/org-agenda-review-settings
                  '((org-agenda-span 'month)
                    (org-agenda-start-day "01")
                    (org-read-date-prefer-future nil)
                    (org-agenda-overriding-header "Month in Review"))
                  )
                ("~//review/month.html")
                ))

  ;; Auto update the TODO counts on save
  (defun org-auto-check()
    (org-update-statistics-cookies "ALL"))
  (add-hook 'org-capture-before-finalize-hook 'org-auto-check)


  (with-eval-after-load 'org
    (add-hook 'org-mode-hook #'visual-line-mode)
    (add-hook 'before-save-hook 'org-auto-check))

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

  ;; delete current theme when loading another
  ;; (defadvice load-theme (before theme-dont-propagate activate)
    ;;(mapc #'disable-theme custom-enabled-themes))

  (defun go-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Go")))

  (add-hook 'go-mode-hook 'go-doc)

  (defun python-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Python_3")))

  (add-hook 'python-mode-hook 'python-doc)

  (setq helm-dash-browser-func 'eww)
  (setq shr-use-fonts nil)

  (define-key evil-normal-state-map (kbd ", g d") 'helm-dash-at-point)

  (add-to-list 'custom-theme-load-path "~/dotfiles/emacs/themes")
  ;; Go

  (add-to-list 'exec-path "/Users/chrishipple/go/bin")
  (setq gofmt-command "goimports")

  ;;(require 'lsp-mode)
  ;;  (add-hook 'go-mode-hook #'lsp-deferred)

  ;; Set up before-save hooks to format buffer and add/delete imports.
  ;; Make sure you don't have other gofmt/goimports hooks enabled.
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

  ;; I think something is overriting, try a hook
  (defun go-set-tab-width ()
    (setq tab-width 4))
  (add-hook 'go-mode-hook #'go-set-tab-width)

  ;; Company mode
  ;; (setq company-idle-delay 0)
  ;; (setq company-minimum-prefix-length 1)

  ;; Go - lsp-mode
  ;; Set up before-save hooks to format buffer and add/delete imports.
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

  ;; Start LSP Mode and YASnippet mode
  (add-hook 'go-mode-hook #'lsp-deferred)
  (add-hook 'go-mode-hook #'yas-minor-mode)

  ;; Rust - LSP mode
  (add-to-list 'exec-path "~/.cargo/bin")
  (setq lsp-rust-server 'rust-analyzer)
)


(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox))
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" "ca2e59377dc1ecee2a1069ec7126b453fa1198fed946304abb9a5b8c7ad5404d" default))
 '(desktop-save nil)
 '(exec-path
   '("/bin" "/Users/chrishipple/mm-cli/.venv/bin" "/opt/homebrew/bin" "/opt/homebrew/sbin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-arm64-11" "/Applications/Emacs.app/Contents/MacOS/libexec-arm64-11" "/Users/chrishipple/mm-cli/.venv/bin" "/Users/chrishipple/.local/bin" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Users/chrishipple/.pyenv/shims" "Users/chrishipple/go/bin"))
 '(package-selected-packages
   '(python-isort cov code-review dap-mode lsp-docker bui yasnippet-snippets tern lsp-treemacs lsp-python-ms lsp-pyright lsp-origami origami helm-lsp helm-c-yasnippet fuzzy web-completion-data auto-yasnippet ac-ispell modus-themes pdf-tools go elpy eredis minsk-theme material-theme jedi lsp-jedi lsp-ui lsp-mode eglot sunny-day-theme vs-light-theme smeargle orgit-forge orgit helm-ls-git helm-git-grep gitignore-templates git-timemachine git-modes git-messenger git-link forge yaml ghub closql emacsql-sqlite emacsql treepy magit-popup treemacs-magit magit magit-section git-commit with-editor yapfify yaml-mode web-mode web-beautify underwater-theme toml-mode tide typescript-mode tagedit suscolors-theme subatomic-theme sql-indent sphinx-doc solarized-theme smyx-theme slim-mode seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode ron-mode robe rebecca-theme rbenv rake racer rust-mode pytest pylookup pyenv-mode pydoc py-isort pug-mode prettier-js poetry transient planet-theme pippel pipenv load-env-vars pyvenv pip-requirements org-rich-yank org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-contrib org-cliplink oceanic-theme obsidian-theme npm-mode nose nord-theme nodejs-repl mmm-mode minitest markdown-toc livid-mode skewer-mode live-py-mode json-reformat json-navigator hierarchy json-mode json-snatcher js2-refactor yasnippet multiple-cursors js2-mode js-doc importmagic epc ctable concurrent deferred impatient-mode simple-httpd htmlize helm-pydoc helm-org-rifle helm-css-scss haml-mode gruvbox-theme autothemer godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc go-mode gnuplot git-gutter-fringe fringe-helper git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-rust flycheck-pos-tip pos-tip evil-org emmet-mode cython-mode csv-mode code-cells chruby cargo markdown-mode bundler inf-ruby browse-at-remote blacken auto-dictionary anaconda-mode pythonic ws-butler writeroom-mode visual-fill-column winum volatile-highlights vim-powerline vi-tilde-fringe uuidgen undo-tree queue treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil treemacs cfrs pfuture posframe toc-org symon symbol-overlay string-inflection string-edit spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline-all-the-icons memoize spaceline powerline space-doc restart-emacs request rainbow-delimiters quickrun popwin persp-mode password-generator paradox spinner overseer org-superstar open-junk-file nameless multi-line shut-up macrostep lorem-ipsum link-hint inspector info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-org helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck pkg-info epl flycheck-elsa flx-ido flx fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-terminal-cursor-changer evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-collection annalist evil-cleverparens smartparens evil-args evil-anzu anzu eval-sexp-fu emr iedit clang-format projectile paredit list-utils elisp-slime-nav elisp-def f editorconfig dumb-jump s drag-stuff dired-quick-sort devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol ht dash auto-compile packed compat all-the-icons aggressive-indent ace-window ace-link ace-jump-helm-line helm avy popup helm-core which-key use-package pcre2el hydra lv hybrid-mode holy-mode font-lock+ evil-evilified-state evil goto-chg dotenv-mode diminish bind-map bind-key async))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)

