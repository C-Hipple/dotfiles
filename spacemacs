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
   '(nginx
     lua
     python
     (javascript :variables
                 javascript-backend 'tide)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     (typescript :variables
                 typescript-backend 'tide)
     rust
     (go :variables go-tab-width 4)
     html
     sql
     ruby
     csv
     yaml
     emacs-lisp
     git
     helm
     markdown
     multiple-cursors
     ;;auto-completion
     org
     lsp
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     treemacs

     ;; fun
     (haskell :variables
              haskell-enable-hindent-style "johan-tibell"
              haskell-completion-backend 'lsp)
     terraform
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   ;; dotspacemacs-additional-packages '(nord-theme suscolors-theme gruvbox-theme solarized-theme oceanic-theme rebecca-theme subatomic-theme obsidian-theme planet-theme smyx-theme underwater-theme magit magit-popup vs-light-theme dockerfile-mode helm-dash python-black )
   dotspacemacs-additional-packages
   '(
     ;; (copilot :location (recipe
     ;;                        :fetcher github
     ;;                        :repo "zerolfx/copilot.el"
     ;;                        :files ("*.el" "dist")
     ;;                        )
     ;;          )
     ;; (chatgpt :location (recipe
     ;;                     :fetcher github
     ;;                     :repo "joshcho/ChatGPT.el")
     ;;          )
     ;; (chatgpt :location (recipe
     ;;                     :fetcher github
     ;;                     :repo "MercuricChloride/chatgpt.el"
     ;;                     :files ("*.el" "dist")
     ;;                     )
     ;;          )

     solarized-theme
     vs-light-theme
     python-black
     helm-dash
     dap-mode
     exec-path-from-shell
     sqlite3
     (code-review :location (recipe
                             :fetcher github
                             :repo "C-Hipple/code-review"
                             :files ("*.el")))
     (diff-lsp :location (recipe
                          :fetcher github
                          :repo "C-Hipple/diff-lsp.el"
                          :files ("*.el")))
     magit-delta
     dockerfile-mode
     docker-compose-mode
     fireplace
     ef-themes
     tide
     treesit-auto
     jazz-theme
     (test-at-point :location (recipe
                               :fetcher github
                               :repo "C-Hipple/test-at-point"
                               :files ("*.el")))

     (harpoon :location (recipe
                         :fetcher github
                         :repo "C-Hipple/harpoon.el"
                         :files ("*.el")))
     gptel
     prettier
     aider
     )

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
   dotspacemacs-read-process-output-max (* 2048 2048)

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
                         jazz
                         ;; ef-duo-light
                         ef-light
                         )

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
                               :size 18.0
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
   ;; '(:relative ni
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
  (setq image-types (cons 'svg image-types))

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


  ;; General stuff
  (setq-default tab-width 4)
  (define-key evil-normal-state-map (kbd "K") (lambda () (interactive) (previous-line 10)))
  (define-key evil-normal-state-map (kbd "J") (lambda () (interactive) (next-line 10)))
  (define-key evil-normal-state-map (kbd "C-k") (lambda () (interactive) (previous-line 15)))
  (define-key evil-normal-state-map (kbd "C-j") (lambda () (interactive) (next-line 15)))

  (define-key evil-normal-state-map (kbd "L") (lambda () (interactive) (end-of-line)))
  (define-key evil-normal-state-map (kbd "J") (lambda () (interactive) (beginning-of-line)))

  ;; Tree sitter!
  (use-package treesit-auto
    :config
    (global-treesit-auto-mode))

  ;; not a real hook
  ;;(setq rust-ts-mode-hook rustic-mode-hook)
  (setq python-ts-mode-hook python-mode-hook)
  ;;(setq go-ts-mode-hook go-mode-hook)
  (setq typescript-ts-mode-hook typescript-mode-hook)
  (setq typescript-tsx-ts-mode-hook typescript-mode-hook)

  (setq major-mode-remap-alist
        '((yaml-mode . yaml-ts-mode)
          (bash-mode . bash-ts-mode)
          (go-mode . go-ts-mode)
          (rustic-mode . rust-ts-mode)
          (js2-mode . js-ts-mode)
          (typescript-mode . typescript-ts-mode)
          (tsx-mode . tsx-ts-mode)
          (json-mode . json-ts-mode)
          (css-mode . css-ts-mode)
          (python-mode . python-ts-mode)))

  (add-hook 'python-ts-mode-hook 'lsp)
  (add-hook 'go-ts-mode-hook 'lsp)
  (add-hook 'tsx-ts-mode-hook 'lsp)
  (add-hook 'typescript-ts-mode-hook 'lsp)
  (add-hook 'rust-ts-mode-hook 'lsp)

  (setq tab-width 4)
  (setq go-ts-mode-indent-offset tab-width)

  ;; This may bite me if I"m ever in a non-lsp language"

  (define-key evil-normal-state-map (kbd ", g g") 'lsp-find-definition)
  (define-key evil-normal-state-map (kbd ", g r") 'xref-find-references)
  (define-key evil-normal-state-map (kbd ", r I") 'py-isort-buffer)
  (define-key evil-normal-state-map (kbd ", f i") 'py-isort-buffer)


  (setq eldoc-echo-area-prefer-doc-buffer t
        eldoc-echo-area-use-multiline-p nil)

  (defun save-all()
    (interactive)
    (save-some-buffers 1)
    )

  (defun my-recompile()
    (interactive)
    (save-some-buffers 1)
    (recompile)
    )

  (defun remove-markdown-code-block-delimiters ()
    "Remove all markdown code block entry and exit lines in the current buffer. Useful for LLM slop."
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (while (search-forward-regexp "^```\\(.*\\)$" nil t)
        (kill-whole-line))
      (goto-char (point-min))
      (while (search-forward-regexp "^```" nil t)
        (kill-whole-line))))

  (defun format-buffer-by-mode ()
    "Format the current buffer based on its major mode."
    (interactive)
    (remove-markdown-code-block-delimiters)
    (let ((mode (symbol-name major-mode)))
      (cond
       ((string= mode "python-ts-mode")
        (message "Formatting Python with isort and black")
        (py-isort-buffer)
        (python-black-buffer))
       ((or (string= mode "tsx-ts-mode")
            (string= mode "typescript-ts-mode")
            (string= mode "typescript-tsx-mode"))
        (message "Formatting Typescript with prettier")
        (prettier-prettify))
       (t
        (lsp-format-buffer)))))

  (setq lsp-enable-on-type-formatting nil)

  (define-key evil-normal-state-map (kbd ", f b") 'format-buffer-by-mode)
  (define-key evil-normal-state-map (kbd "SPC c t") 'run-test-at-point)
  (define-key evil-normal-state-map (kbd "SPC c a") 'select-current-test-at-point)
  (define-key evil-normal-state-map (kbd "SPC c T") 'test-at-point-run-selected)
  (define-key evil-normal-state-map (kbd "SPC c u") 'remove-current-test-at-point-from-buffer)
  (define-key evil-normal-state-map (kbd "SPC c r") 'my-recompile)
  (define-key evil-normal-state-map (kbd "SPC c s") 'save-all)

  ;; For when I want to back out
  (setq auto-mode-alist (delete '("\.py[iw]?\'" . python-ts-mode) auto-mode-alist))

  ;; for macos shell env vars
  (exec-path-from-shell-initialize)

  (exec-path-from-shell-copy-env "GTDBOT_GITHUB_TOKEN")
  (exec-path-from-shell-copy-env "GEMINI_API_TOKEN")
  (exec-path-from-shell-copy-env "JIRA_API_TOKEN")
  (exec-path-from-shell-copy-env "JIRA_API_EMAIL")

  ;; Harpoon
  (define-key evil-normal-state-map (kbd "SPC h A") 'harpoon-open-or-create)

  (define-key evil-normal-state-map (kbd "SPC h 1") (lambda () (interactive) (harpoon-open-entry 1)))
  (define-key evil-normal-state-map (kbd "SPC h 2") (lambda () (interactive) (harpoon-open-entry 2)))
  (define-key evil-normal-state-map (kbd "SPC h 3") (lambda () (interactive) (harpoon-open-entry 3)))
  (define-key evil-normal-state-map (kbd "SPC h 4") (lambda () (interactive) (harpoon-open-entry 4)))

  (define-key evil-normal-state-map (kbd "SPC h a 1") (lambda () (interactive) (harpoon-add-file-or-buffer 1)))
  (define-key evil-normal-state-map (kbd "SPC h a 2") (lambda () (interactive) (harpoon-add-file-or-buffer 2)))
  (define-key evil-normal-state-map (kbd "SPC h a 3") (lambda () (interactive) (harpoon-add-file-or-buffer 3)))
  (define-key evil-normal-state-map (kbd "SPC h a 4") (lambda () (interactive) (harpoon-add-file-or-buffer 4)))

  ;; Org-mode configurations are from the blog in the link below:
  ;; https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html


  ;; For the rare time we're doin tab-lyfe
  (with-eval-after-load 'company
    ;; disable inline previews
    (delq 'company-preview-if-just-one-frontend company-frontends))

  ;; ORG MODE
  (setq org-startup-folded t)
  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "PROGRESS(p)" "MAYBE(m)" "BLOCKED(b)" "DELEGATED(l)" "REVIEW(r)" "|" "DONE(d)" "CANCELLED(c)" )))

  (setq org-agenda-files '("~/gtd/inbox.org"
                           "~/gtd/next_actions.org"
                           "~/gtd/tickler.org"))

  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                 (file+headline "~/gtd/inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "~/gtd/tickler.org" "Tickler")
                                 "* %i%? \n %U")))

  (setq org-refile-targets '(("~/gtd/next_actions.org" :maxlevel . 3)
                             ("~/gtd/someday.org" :maxlevel . 3)
                             ("~/gtd/notes.org" :maxlevel . 3)
                             ("~/gtd/tickler.org" :maxlevel . 2)))


  (setq org-todo-keyword-faces
        '(("TODO" . org-warning) ("STARTED" . "yellow") ("PROGRESS" . "orange") ("WAITING" . "yellow") ("DELEGATED" . "brown") ("REVIEW" . "yellow")
          ("CANCELED" . (:foreground "blue" :weight bold))))

  ;; This makes it so helm is only the width of the buffer, not full emacs
  (setq-default helm-display-function 'helm-default-display-buffer)

  (define-key evil-normal-state-map (kbd "RET") 'spacemacs/insert-line-below-no-indent)
  (define-key evil-normal-state-map (kbd "C-RET") 'spacemacs/insert-line-above-no-indent)
  (define-key evil-normal-state-map (kbd "S-RET") 'spacemacs/insert-line-above-no-indent)


  (with-eval-after-load 'magit-mode
    (add-hook 'after-save-hook 'magit-after-save-refresh-status t)
    )

  (with-eval-after-load 'magit-stash
    (defun magit-stash-read-message ()
      "OVERLOADED: Always include the branch name in the stash message.
Read a message from the minibuffer, to be used for a stash.

The message that Git would have picked, is available as the
default (used when the user enters the empty string) and as
the next history element (which can be accessed with \
\\<minibuffer-local-map>\\[next-history-element])."
      (concat
       (magit-get-current-branch)
       ": "
       (read-string (format "Stash message (default: On%s:%s): "
                            (magit--ellipsis) (magit--ellipsis))
                    nil nil
                    (format "%s"
                            (magit-rev-format "%h %s"))))
      )
    )

  (setq magit-list-refs-sortby "-committerdate")

  ;; Auto update the TODO counts on save
  (defun org-auto-check()
    (if (string= major-mode "org-mode")
        (org-update-statistics-cookies "ALL")))
  (add-hook 'org-capture-before-finalize-hook 'org-auto-check)

  (with-eval-after-load 'org
    (add-hook 'org-mode-hook 'visual-line-mode)
    (add-hook 'before-save-hook 'org-auto-check)
    (add-hook 'before-save-hook 'whitespace-cleanup))

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  (defun open-inbox-org ()
    (interactive)
    (find-file "~/gtd/inbox.org"))

  (define-key evil-normal-state-map (kbd "SPC b i") 'open-inbox-org)

  (defun open-review-org ()
    (interactive)
    (find-file "~/gtd/reviews.org"))

  (define-key evil-normal-state-map (kbd "SPC b r") 'open-review-org)

  (defun open-release-org ()
    (interactive)
    (find-file "~/gtd/release.org"))

  (define-key evil-normal-state-map (kbd "SPC b R") 'open-release-org)

  (defun open-next-actions-org ()
    (interactive)
    (find-file "~/gtd/next_actions.org"))

  (define-key evil-normal-state-map (kbd "SPC b a") 'open-next-actions-org)

  (defun open-agendas-org ()
    (interactive)
    (find-file "~/gtd/agendas.org"))

  (define-key evil-normal-state-map (kbd "SPC b A") 'open-agendas-org)

  ;; delete current theme when loading another
  ;; (defadvice load-theme (before theme-dont-propagate activate)
  ;;(mapc #'disable-theme custom-enabled-themes))

  ;; Silly theme stuff

  (defun hide-title-bar()
    ;; call this and then make a new frame
    (add-to-list 'default-frame-alist '(undecorated . t)))

  (defun set-gold ()
    (interactive)
    (set-face-attribute 'default nil :foreground "#d7af5f"))

  (defun reset-default-face()
    (interactive)
    (set-face-attribute 'default nil :foreground "#ebdbb2")
    )

  (defun make-blue ()
    (interactive)
    (set-face-attribute 'default nil :background "#2E3440")
    (set-face-attribute 'fringe nil :background "#2E3440")
    )

  (defun reset-default-background()
    (interactive)
    (set-face-attribute 'default )
    )

  ;; Reset default face's session customizations
  ;; it bork
  (defun reset-default-face-session-customization ()
    "Reset FACE to its default settings."
    (interactive)
    (list (read-face-name "Face to reset: "))
    (let ((face-spec (get face 'face-defface-spec)))
      (if face-spec
          (progn
            (face-spec-set face face-spec)
            (message "Face '%s' reset to default." face))
        (message "No default settings found for face '%s'." face)))
    )


  ;; it bork
  ;; (defun revert-face-to-default ()
  ;;   (interactive)
  ;;   "Revert the given FACE to its default settings."
  ;;   (let ((default-attributes (face-default-attributes 'default)))
  ;;     (apply 'set-face-attributes face default-attributes)))

  (add-to-list 'custom-theme-load-path "~/dotfiles/emacs/themes")


  (define-key evil-normal-state-map (kbd ", c") 'comint-clear-buffer)

  ;; Waiting on the new release which uses the APIs instead of webdriver
  ;;(setq python-interpreter "/Users/chrishipple/.pyenv/shims/python")
  ;;(setq python-shell-interpreter "/Users/chrishipple/.pyenv/shims/python")

  ;; Go  golang
  (setq gofmt-command "goimports")

  (use-package lsp-mode
    :config
    (lsp-register-custom-settings
     '(("pyls.plugins.pyls_mypy.enabled" t t)
       ("pyls.plugins.pyls_mypy.live_mode" nil t)
       )
     )
    )

  ;; Hackyness while i sort out lsp configs
  (defun set-lsp-configs ()
    (message "Setting LSP configs")
    (add-to-list 'lsp-pylsp-plugins-pydocstyle-ignore "D101")
    (add-to-list 'lsp-pylsp-plugins-pydocstyle-ignore "D102")
    (add-to-list 'lsp-pylsp-plugins-pydocstyle-ignore "D213")
    (add-to-list 'lsp-pylsp-plugins-pydocstyle-ignore "D400")
    (add-to-list 'lsp-pylsp-plugins-pydocstyle-ignore "D401")
    (add-to-list 'lsp-pylsp-plugins-pycodestyle-ignore "W503")
    (add-to-list 'lsp-pylsp-plugins-pycodestyle-exclude "W503")
    (add-to-list 'lsp-pylsp-plugins-flake8-ignore "W503")
    (add-to-list 'lsp-pylsp-plugins-flake8-exclude "W503")
    )

  (with-eval-after-load 'lsp-mode
    (add-hook 'lsp-mode-hook 'set-lsp-configs))

  ;; Company mode
  ;; (setq company-idle-delay 0)
  ;; (setq company-minimum-prefix-length 1)

  ;; Go - lsp-mode
  ;; Set up before-save hooks to format buffer and add/delete imports.

  ;; Start LSP Mode and YASnippet mode
  ;; (add-hook 'go-mode-hook 'lsp-deferred)
  ;; (add-hook 'go-mode-hook 'yas-minor-mode)


  ;; Rust - LSP mode
  (add-to-list 'exec-path "~/.cargo/bin")
  (setq lsp-rust-server 'rust-analyzer)

  (setq lsp-disabled-clients '(ruff-lsp))

  ;; Haskell
  (add-to-list 'exec-path "~/.ghcup/bin")

  ;; dash

  (defun go-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Go")))

  ;;(add-hook 'go-mode-hook 'go-doc)

  ;; Python
  (define-key evil-visual-state-map (kbd ", f r") 'python-black-region)

  (defun python-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Python_3")))

  (add-hook 'python-mode-hook 'python-doc)
  (add-to-list 'exec-path "/Users/chrishipple/.pyenv/shims/python")

  (setq helm-dash-browser-func 'eww)
  (setq shr-use-fonts nil)
  (setq dash-docs-enable-debugging nil)


  (define-key evil-normal-state-map (kbd ", g d") 'helm-dash-at-point)

  ;; Magit stuffo
  (defun my-magit-visit-file-other-window ()
    "Visit the current file's diff in another window."
    (interactive)
    (let ((current-file (buffer-file-name)))
      (if current-file
          (progn
            (magit-find-file "master" current-file)
            )
        (message "This buffer is not visiting a file!"))))

  (define-key evil-normal-state-map (kbd "SPC g F") 'my-magit-visit-file-other-window)

  ;; Copy org to google docs
  (defun org-region-to-docx-clipboard ()
    "Convert selected org-mode region from START to END to docx format and copy to clipboard."
    (interactive "r")
    (let* ((org-text (buffer-substring-no-properties region-beginning region-end))
           (temp-file-org (make-temp-file "org-to-docx-" nil ".org"))
           (temp-file-docx (make-temp-file "org-to-docx-" nil ".docx")))
      ;; Write the org text to a temp file
      (with-temp-file temp-file-org
        (insert org-text))
      ;; Use pandoc to convert
      (call-process "pandoc" nil nil nil
                    "-s" temp-file-org
                    "-o" temp-file-docx)
      ;; Copy to clipboard
      (with-temp-buffer
        (insert-file-contents temp-file-docx)
        (shell-command-on-region (point-min) (point-max) "clip" nil t))
      ;; Clean up
      (delete-file temp-file-org)
      (delete-file temp-file-docx)
      )
    )
  ;; Compilation
  (setq compilation-scroll-output t)
  (defun my-ansi-color (&optional beg end)
    "Interpret ANSI color esacape sequence by colorifying cotent.
Operate on selected region on whole buffer."
    (interactive
     (if (use-region-p)
         (list (region-beginning) (region-end))
       (list (point-min) (point-max))))
    (ansi-color-apply-on-region beg end))

  (ignore-errors
    (require 'ansi-color)
    (defun my-colorize-compilation-buffer ()
      (when (eq major-mode 'compilation-mode)
        (ansi-color-apply-on-region compilation-filter-start (point-max))))
    (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))


  ;; Code Review
  (setq code-review-fill-column 120)
  (with-eval-after-load 'code-review
    (progn
      (define-key code-review-mode-map (kbd "K") (lambda () (interactive) (previous-line 10)))
      (define-key code-review-mode-map (kbd "J") (lambda () (interactive) (next-line 10)))
      (define-key code-review-mode-map (kbd "C-k") (lambda () (interactive) (previous-line 15)))
      (define-key code-review-mode-map (kbd "C-j") (lambda () (interactive) (next-line 15)))
      (define-key code-review-mode-map (kbd "c") 'code-review-comment-add-or-edit)
      (define-key code-review-mode-map (kbd ", g g") 'lsp-find-definition) ;; DIFF-LSP HYPPEEEEE
      (define-key code-review-mode-map (kbd ", g r") 'xref-find-references)))

  (define-key evil-normal-state-map (kbd ", r r") 'code-review-start)
  (define-key evil-normal-state-map (kbd ", r s") 'code-review-start-at-point)
  (define-key evil-normal-state-map (kbd "SPC b C") (lambda () (interactive) (switch-to-buffer "*Code Review*" nil t)))


  ;; overwrite default shell-command keybind to be async
  (define-key evil-normal-state-map (kbd "SPC !") 'async-shell-command)

  (defun project-async-shell-command (command)
    (interactive "sProject Async Command: ")
    (let ((default-directory (projectile-project-root)))
      (async-shell-command command)
      )
    )
  (define-key evil-normal-state-map (kbd "SPC @") 'project-async-shell-command)

  (define-key evil-normal-state-map (kbd "SPC f c") 'spacemacs/comment-or-uncomment-lines)

  (exec-path-from-shell-copy-env "GTDBOT_GITHUB_TOKEN")

  (defun switch-to-compilation-buffer ()
    (interactive)
    (let ((display-buffer-overriding-action
           '((display-buffer-same-window))))
      (switch-to-buffer "*compilation*" nil t)))

  (define-key evil-normal-state-map (kbd "SPC b c") 'switch-to-compilation-buffer)

  (if (file-exists-p "~/dotfiles/elisp_helpers.el")
      (load-file "~/dotfiles/elisp_helpers.el"))

  (if (file-exists-p "~/gtdbot/gtdbot.el")
      (load-file "~/gtdbot/gtdbot.el"))

  ;; TODO set this into a private layer installed locally
  (if (file-exists-p "~/mm-tools/mm-tools.el")
      (load-file "~/mm-tools/mm-tools.el"))

  ;; trying something here, I htink I need to compile emacs with something else
  ;; (set-frame-parameter nil 'alpha-background 88)

  ;; (use-package combobulate
  ;;   :custom
  ;;   ;; You can customize Combobulate's key prefix here.
  ;;   ;; Note that you may have to restart Emacs for this to take effect!
  ;;   (combobulate-key-prefix "C-c o")
  ;;   :hook ((prog-mode . combobulate-mode))
  ;;   ;; Amend this to the directory where you keep Combobulate's source
  ;;   ;; code.
  ;;   :load-path ("~/combobulate/"))
  ;; MERGING

  (define-key evil-normal-state-map (kbd ", k u") 'smerge-keep-upper)
  (define-key evil-normal-state-map (kbd ", k l") 'smerge-keep-lower)
  (define-key evil-normal-state-map (kbd ", k b") 'smerge-keep-base)
  (define-key evil-normal-state-map (kbd ", k a") 'smerge-keep-all)

  ;; GPT / AI
  ;;
  (setq
   gptel-model 'gemini-2.5-flash-lite-preview-06-17
   gptel-backend (gptel-make-gemini "Gemini"
                   :key (getenv "GEMINI_API_TOKEN")
                   :stream t))

  (define-key evil-normal-state-map (kbd ", a m") 'gptel-menu)
  (define-key evil-normal-state-map (kbd ", a a") 'gptel-add)
  (define-key evil-normal-state-map (kbd ", a c") 'gptel) ;; chat
  (add-hook 'gptel-post-stream-hook 'gptel-auto-scroll)

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
     '("d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87"
       "0517759e6b71f4ad76d8d38b69c51a5c2f7196675d202e3c2507124980c3c2a3"
       "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98"
       "2681c80b05b9b972e1c5e4d091efb9ba7bb5fa7dad810d9026bc79607a78f1c0"
       "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d"
       "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298"
       "ca2e59377dc1ecee2a1069ec7126b453fa1198fed946304abb9a5b8c7ad5404d" default))
   '(desktop-save nil)
   '(package-selected-packages
     '(a ac-ispell ace-jump-helm-line ace-link ace-window aggressive-indent aider aio
         alert all-the-icons all-the-icons-completion almost-mono-themes
         anaconda-mode annalist anzu apheleia async attrap auto-compile
         auto-dictionary auto-highlight-symbol auto-yasnippet autothemer
         avk-emacs-themes avy basic-theme berrys-theme bind-key bind-map blacken
         browse-at-remote bui bundler calmer-forest-theme cargo
         centered-cursor-mode cfrs chruby clang-format clean-aindent-mode cmm-mode
         code-cells column-enforce-mode company-cabal company-lua
         company-terraform compat concurrent counsel counsel-gtags cov csv-mode
         ctable cython-mode dakrone-light-theme dakrone-theme dap-mode dash
         dash-docs deferred define-word devdocs diff-lsp diminish dired-quick-sort
         docker-compose-mode dockerfile-mode doom-themes dotenv-mode drag-stuff
         dream-theme dumb-jump editorconfig ef-themes eglot elisp-def
         elisp-slime-nav elpy emacsql emacsql-sqlite emacsql-sqlite-builtin
         emacsql-sqlite-module emmet-mode emojify emr epc epl eredis eval-sexp-fu
         evil evil-anzu evil-args evil-cleverparens evil-collection
         evil-easymotion evil-escape evil-evilified-state evil-exchange
         evil-goggles evil-iedit-state evil-indent-plus evil-lion evil-lisp-state
         evil-matchit evil-mc evil-nerd-commenter evil-numbers evil-org
         evil-surround evil-terminal-cursor-changer evil-textobj-line evil-tutor
         evil-unimpaired evil-visual-mark-mode evil-visualstar
         exec-path-from-shell expand-region eyebrowse f fancy-battery fireplace
         flx flx-ido flycheck flycheck-elsa flycheck-haskell flycheck-package
         flycheck-pos-tip flycheck-rust flyspell-correct flyspell-correct-helm
         font-lock+ forge fringe-helper fuzzy ggtags gh-md ghub git-commit
         git-gutter git-gutter-fringe git-link git-messenger git-modes
         git-timemachine github-review gitignore-templates gntp gnuplot go
         go-eldoc go-fill-struct go-gen-test go-guru go-impl go-mode go-rename
         go-tag godoctor golden-ratio google-translate goose-theme goto-chg gptel
         gruvbox-theme haml-mode haskell-mode haskell-snippets hcl-mode helm
         helm-ag helm-c-yasnippet helm-core helm-css-scss helm-dash helm-descbinds
         helm-flx helm-git-grep helm-gtags helm-hoogle helm-ls-git helm-lsp
         helm-make helm-mode-manager helm-org helm-org-rifle helm-projectile
         helm-purpose helm-pydoc helm-swoop helm-themes helm-xref help-fns+
         hide-comnt hierarchy highlight-indentation highlight-numbers
         highlight-parentheses hindent hl-todo hlint-refactor holy-mode ht htmlize
         hungry-delete hybrid-mode hydandata-light-theme hydra iedit imenu-list
         impatient-mode indent-guide inf-ruby info+ inspector iter2 ivy jazz-theme
         jedi js-doc js2-mode js2-refactor json-mode json-navigator json-reformat
         json-snatcher kuronami-theme lcr link-hint list-utils live-py-mode
         livid-mode load-env-vars log4e lorem-ipsum lsp-docker lsp-haskell
         lsp-jedi lsp-mode lsp-origami lsp-pyright lsp-python-ms lsp-treemacs
         lsp-ui lua-mode lv macrostep magit magit-delta magit-popup magit-section
         markdown-mode markdown-toc material-theme melancholy-theme memoize
         minimal-theme minitest minsk-theme mmm-mode modus-themes multi-line
         multiple-cursors nameless nginx-mode nodejs-repl nord-theme nose npm-mode
         nvm obsidian-theme oceanic-theme open-junk-file org-category-capture
         org-cliplink org-contrib org-download org-mime org-pomodoro org-present
         org-projectile org-rich-yank org-superstar orgit orgit-forge origami
         overseer package-lint packed paradox paredit parent-mode
         password-generator pcre2el pdf-tools persp-mode pfuture pip-requirements
         pipenv pippel pkg-info planet-theme poetry popup popwin pos-tip posframe
         powerline pr-review prettier prettier-js projectile pug-mode py-isort
         pydoc pyenv-mode pylookup pytest python-black python-isort pythonic
         pyvenv quelpa-use-package queue quickrun racer rainbow-delimiters rake
         rbenv rebecca-theme reformatter request restart-emacs robe ron-mode
         rspec-mode rubocop rubocopfmt ruby-hash-syntax ruby-refactor
         ruby-test-mode ruby-tools rust-mode rvm s sass-mode scss-mode
         seeing-is-believing shut-up simple-httpd skewer-mode slim-mode
         smartparens smeargle smyx-theme solarized-theme solo-jazz-theme space-doc
         spaceline spaceline-all-the-icons spacemacs-purpose-popwin
         spacemacs-whitespace-cleanup sphinx-doc spinner sql-indent sqlite3
         string-inflection subatomic-theme sunny-day-theme suscolors-theme swiper
         symbol-overlay symon tablist tagedit tangonov-theme tern terraform-mode
         tide timu-macos-theme toc-org toml-mode tommyh-theme transient treemacs
         treemacs-evil treemacs-icons-dired treemacs-magit treemacs-persp
         treemacs-projectile treepy treesit-auto typescript-mode underwater-theme
         undo-tree use-package uuidgen vi-tilde-fringe vim-powerline
         visual-fill-column volatile-highlights vs-light-theme vterm web-beautify
         web-completion-data web-mode which-key window-purpose winum with-editor
         writeroom-mode ws-butler xref xterm-color yaml yaml-mode yapfify
         yasnippet yasnippet-snippets zeno-theme))
   '(safe-local-variable-values
     '((web-mode-indent-style . 2) (web-mode-block-padding . 4)
       (web-mode-script-padding . 4) (web-mode-style-padding . 4)
       (typescript-backend . tide) (typescript-backend . lsp)
       (javascript-backend . tide) (javascript-backend . tern)
       (javascript-backend . lsp)))
   '(warning-minimum-level :error)
   '(warning-suppress-types '((emacs) ((flycheck syntax-checker)))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
  )
