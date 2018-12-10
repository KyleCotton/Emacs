(add-to-list 'load-path "~/.emacs.d/config-files/")
;;Add package archives
(require 'package)
  (setq package-enable-at-startup nil)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;;Enable use-package
(package-initialize)

(unless (package-installed-p 'bind-key)
  (package-refresh-contents)
  (package-install 'bind-key))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;Enable servermode allows emacs client to connect
(server-mode t)

;; Change the path so that terminal works
;;/usr/local/bin
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;;MacOS
;;############################
;;Realease Modifier Keys
(setq ns-right-alternate-modifier (quote noneaa))
(setq ns-right-option-modifier (quote none))
(setq ns-right-command-modifier (quote none))
(setq ns-right-control-modifier (quote none))

(setq mac-option-modifier 'meta)

(provide 'init-os-specific)

(require 'init-secrets)

;;UndoTree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))


;;Counsel
(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

;;Allow Emacs to access OS clipboard
(setq save-interprogram-paste-before-kill t)

;;Auto-Complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;;Ya Snippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;;Text Navigation

;;Swiper (Searching)
(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "C-x b") 'ivy-switch-buffer)))
;;    (global-set-key (kbd "C-x k") 'ivy-kill-buffer)))

;;Avy
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;;Expand Region
(use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))



;;Narrow & Widen
 (defun narrow-or-widen-dwim (p)
   (interactive "P")
   (declare (interactive-only))
   (cond ((and (buffer-narrowed-p) (not p)) (widen))
	 ((region-active-p)
	  (narrow-to-region (region-beginning)
			    (region-end)))
	 ((derived-mode-p 'org-mode)
	  (cond ((ignore-errors (org-edit-src-code) t)
		 (delete-other-windows))
		((ignore-errors (org-narrow-to-block) t))
		(t (org-narrow-to-subtree))))
	 ((derived-mode-p 'latex-mode)
	  (LaTeX-narrow-to-environment))
	 (t (narrow-to-defun))))
 (define-key ctl-x-map "n" #'narrow-or-widen-dwim)
 (add-hook 'LaTeX-mode-hook
	   (lambda ()
	     (define-key LaTeX-mode-map "\C-xn"
	       nil)))

;; Swoop Search

(use-package helm-swoop
  :ensure t)

;; (global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-s") 'helm-swoop-without-pre-input)
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Spelling Configuration

;; ispell and aspell need to be installed
;; BASH COMMAND: brew install ispell --with-lang-en && brew install aspell --with-lang-en

(setq ispell-program-name "/usr/local/bin/aspell")

;;Dired Sidebar
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (use-package all-the-icons-dired
    ;; M-x all-the-icons-install-fonts
    :ensure t
    :commands (all-the-icons-dired-mode)))

;; Window and buffer navigation configuration

;;Ace Window
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))))


;;Winner Mode
(winner-mode 1)

;;IBuffer List Buffers
(defalias 'list-buffers 'ibuffer-other-window)

;; Groups for specific buffer types

(setq ibuffer-saved-filter-groups
      '(("home"
	 ("Org" (or (mode . org-mode)
		    (filename . "OrgMode")))
	 ("Development" (or (mode . shell-mode)
			    (mode . eshell-mode)
			    (mode . haskell-mode)
			    (name . ".hs$")))
	 ("dired" (mode . dired-mode))
	 ("emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")))
	 ("irc" (or (mode . circe-channel-mode)
			    (mode . circe-server-mode)))
	 ("magit" (or (mode . magit-mode)
			    (name . "*magit*")))
	 ("Help" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*")))
	 ("email" (or (mode . mu4e-headers)
			    (mode . mu4e:compose)))
	 )))


(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "home")))

(setq ibuffer-show-empty-filter-groups nil)

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-auto-mode 1)
	    (ibuffer-switch-to-saved-filter-groups "default")))

(use-package ibuffer-rcirc
  :ensure t)

(setq ibuffer-formats
      '((mark modified read-only rcirc-activity-status-one-char " "
	      (name 18 18 :left :elide)
	      " "
	      (size 9 -1 :right)
	      " "
	      (mode 16 16 :left :elide)
	      " "
	      ;; (rcirc-activity-status 20 18 :left) " "
	      ;; (rcirc-activity-status-mini 5 3 :center) " "
	      filename-and-process)))

(defun kyle/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x M-k") 'kyle/kill-this-buffer)

;;Which Key
(use-package which-key
	:ensure t
	:config
	(which-key-mode))

;;Disable Startup Message
(setq inhibit-startup-message t)

;;Disable Tool Bar
(tool-bar-mode -1)

;;Disable Tool Bar
(menu-bar-mode -1) 

;;Enable Line Numbers
(global-linum-mode t)

;;Confirmation Message
(fset 'yes-or-no-p 'y-or-n-p)

;;Line Highlighting
(global-hl-line-mode t)

;;Change the Default Size of the Text
(set-face-attribute 'default nil :height 160)

;;Load the theme
(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

;;Clear the Buffers List
(setq ido-virtual-buffers '())
(setq recentf-list '())

;; Make the cursor full width of the character beneth it
(setq x-stretch-cursor t)

;;Install the theme
(use-package doom-themes
  :ensure t)

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.

;; (load-theme 'doom-one t)
;; (load-theme 'doom-one-light t)
;; (load-theme 'doom-vibrant t)
;; (load-theme 'doom-citylights t)
;; (load-theme 'doom-dracula t)
(load-theme 'doom-molokai t)
;; (load-theme 'doom-nord t)
;; (load-theme 'doom-nord-light t)
;; (load-theme 'doom-nova t)
;; (load-theme 'doom-peacock t)
;; (load-theme 'doom-solarized-light t)
;; (load-theme 'doom-spacegrey t)
;; (load-theme 'doom-tomorrow-night t)


;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;;Mode Line
(display-time-mode 1)

 (use-package powerline
   :ensure t
   :init
   (powerline-default-theme))

;; Highlight Maching Bracket
(show-paren-mode t)
(setq show-paren-style 'expression)

;;Change the location of backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

;;Reload the file if chaanged on the disk
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)

;;Install magit
(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
    )

;; Term Config

(use-package multi-term
  :ensure t)

(setq multi-term-program "/bin/bash")



(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$"
			  ""
			  (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Haskell Customisations

(use-package haskell-mode
  :ensure t)

(add-hook 'haskell-mode-hook 'haskell-mode)

;;Install and setup Org
(unless package-archive-contents    ;; Refresh the packages descriptions
  (package-refresh-contents))
(setq package-load-list '(all))     ;; List of packages to load
(unless (package-installed-p 'org)  ;; Make sure the Org package is
  (package-install 'org))           ;; installed, install it if not
(package-initialize)                ;; Initialize & Install Package

;;Install org Mode
(use-package org
  :ensure t)

;;(use-package org
;;  :ensure org-plus-contrib
;;  :pin org)



;;Org Tags
(setq org-tag-alist '(("SixthForm" . ?s) ("University" . ?u) ("Personal" . ?p)))

;;Org Clocking
(setq org-clock-into-drawer t)

;;Org Bullets
(use-package org-bullets 
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;Org Agenda

(message "Entered Org Agenda")
;;Define Agenda Files Location
(setq org-agenda-files (list "/Users/kyle/Dropbox/org/life.org"
			     "/Users/kyle/Dropbox/org/inbox.org"
			     "/Users/kyle/Dropbox/org/gcal.org"
			     "/Users/kyle/Dropbox/org/edinburgh.org"
			     "/Users/kyle/workspace/MapApp/README.org"))

;;Define the Org Agenda Key Map
(define-key global-map "\C-ca" 'org-agenda)

;;Don't show done tasks in agenda
(setq org-agenda-skip-scheduled-if-done nil)

;;Org Refile
(setq org-refile-targets
      '(("life.org" :maxlevel . 2)
	("inbox.org" :maxlevel . 2)
	("edinburgh.org" :maxlevel . 2)))

;;Org Archive Type
(setq org-archive-location "%s_archive::datetree/")

;;Custom Agenda View 1

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
	 ((tags "PRIORITY=\"A\""
		((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
		 (org-agenda-overriding-header "High-priority unfinished tasks:")))
	  ;; (agenda "")
	  ;; (alltodo "")
	  ))))

;;Define Todo's
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "WAITING(w)" "SOMEDAY(s)" "|" "DONE(d)" "CANCELLED(c)" "ARCHIVE(a)"))))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
	      ("SOMEDAY" :foreground "orange" :weight bold)
	      ("DONE" :foreground "forest green" :weight bold)
	      ("WAITING" :foreground "orange" :weight bold)
	      ("CANCELLED" :foreground "forest green" :weight bold)
	      ("ARCHIVE" :foreground "forest green" :weight bold))))

;;Set the parent todo done when all children complete
(defun org-summary-todo (n-done n-not-done)
  (let (org-log-done org-log-states)
  (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;;Org HTML Export
(use-package htmlize
  :ensure t)

;;Agenda Export
(setq org-agenda-exporter-settings
      '((ps-number-of-columns 2)
	(ps-landscape-mode t)
	(org-agenda-add-entry-text-maxlines 5)
	(htmlize-output-type 'css)))

;;Org Capture
;;Capture Key Bindings
(global-set-key (kbd "C-c c") 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)

(setq org-log-done t)
(setq org-agenda-skip-scheduled-if-done t)

;;Capture Templates
(setq org-capture-templates
      '(
	("t" "Quick Task" entry (file "~/Dropbox/org/inbox.org") "* TODO %^{Brief Task Description}\nSCHEDULED: %^t\n %^{Additional Details}" :prepend t)
	("e" "Event" entry (file  "~/Dropbox/org/gcal.org" ) "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
	("n" "Note" entry (file+headline "~/Dropbox/org/life.org" "Misc Notes") "* %^{Title}\n%?" :prepend t)
	("d" "Diary" entry (file+datetree "~/Dropbox/org/diary.org") "** %^{Entry Title}\n%?")
	))

;;This code allow for literate programming in org mode.
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (java . t)
   (haskell . t)
   (latex . t)
   ))

;; (setq max-lisp-eval-depth 10000)
;; (setq max-specpdl-size 10000)

;;IRC Config File

(use-package circe
  :ensure t)

(setq circe-default-nick "ScriptRunner"
      circe-default-user "ScriptRunner"
      circe-default-realname "ScriptRunner"
      circe-default-part-message "ScriptRunner Says: Bye"
      circe-default-quit-message "ScriptRunner Says: Bye")

(setq circe-new-buffer-behavior 'ignore)

(setq circe-network-options
      (let ((server-passwd
	     (lambda (server-name)
	       (read-passwd (format "Password for server: %s? " server-name)))))
	`(
	 ("ZNC/imaginarynet"
	  :tls t
	  :host ,homelab-address
	  :port 6501
	  :user "kyle/imaginarynet"
	  :pass ,znc-password)
	 ("ZNC/freenode"
	 :tls t
	 :host ,homelab-address
	 :port 6501
	 :user "kyle/freenode"
	 :pass ,znc-password)
	 )))

(setq circe-format-say "{nick:-16s} {body}")
(setq circe-color-nicks-everywhere t)
(enable-circe-color-nicks)
(setq circe-reduce-lurker-spam t)
(setq erc-server-auto-reconnect nil)

(setq
 lui-time-stamp-position 'right-margin
 lui-fill-type nil)

(add-hook 'lui-mode-hook 'my-lui-setup)
(defun my-lui-setup ()
  (setq
   fringes-outside-margins t
   right-margin-width 5
   word-wrap t
   wrap-prefix "    "))


(setq circe-network-defaults nil)

(use-package counsel-spotify
  :ensure t)

(setq counsel-spotify-client-id spotify-client-id)
(setq counsel-spotify-client-secret spotify-client-secret)

;; RSS Reader Customisations
(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "/Users/kyle/Dropbox/org/elfeed.org")))

(defun kyle/elfeed-show-all ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-all"))
(defun kyle/elfeed-show-emacs ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-emacs"))
(defun kyle/elfeed-show-daily ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-daily"))

;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun kyle/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

;;write to disk when quiting
(defun kyle/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))


(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
	      ("A" . kyle/elfeed-show-all)
	      ("E" . kyle/elfeed-show-emacs)
	      ("D" . kyle/elfeed-show-daily)
	      ("q" . kyle/elfeed-save-db-and-bury)))

;;http://pragmaticemacs.com/emacs/read-your-rss-feeds-in-emacs-with-elfeed/

;; Email Configuration

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; SETTING UP MU4E
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(require 'mu4e)

(setq mu4e-maildir (expand-file-name "~/.Mail"))
;; (setq mu4e-get-mail-command "offlineimap && mu index --maildir ~/.Mail")
(setq mu4e-get-mail-command "offlineimap")

;; Updates every 300 seconds
(setq mu4e-update-interval 300)


(setq mu4e-contexts
 `( ,(make-mu4e-context
     :name "Personal"
     :match-func (lambda (msg) (when msg
       (string-prefix-p "/kylecottonkc@gmail.com" (mu4e-message-field msg :maildir))))
     :vars '(
       (mu4e-trash-folder . "/kylecottonkc@gmail.com/[Gmail].Trash")
       (mu4e-refile-folder . "/kylecottonkc@gmail.com/[Gmail].Archive")
       (mu4e-sent-folder . "/kylecottonkc@gmail.com/[Gmail].Sent Mail")
       (mu4e-drafts-folder . "/kylecottonkc@gmail.com/[Gmail].Drafts")
       (user-mail-address "kylecottonkc@gmail.com")
       ))
))
   ;; ,(make-mu4e-context
   ;;   :name "University"
   ;;   :match-func (lambda (msg) (when msg
   ;;     (string-prefix-p "/k.d.cotton@sms.ed.ac.uk" (mu4e-message-field msg :maildir))))
   ;;   :vars '(
       ;; (mu4e-trash-folder . "/kylecottonkc@gmail.com/[Gmail].Trash")
       ;; (mu4e-refile-folder . "/kylecottonkc@gmail.com/[Gmail].Archive")
       ;; (mu4e-sent-folder . "/kylecottonkc@gmail.com/[Gmail].Sent Mail")
       ;; (mu4e-drafts-folder . "/kylecottonkc@gmail.com/[Gmail].Drafts")
   ;;     (mu4e-refile-folder . exchange-mu4e-refile-folder)
   ;;     ))
   ;; ))

(setq mu4e-maildir-shortcuts
      '(
	("/kylecottonkc@gmail.com/INBOX"  . ?p)
	("/k.d.cotton@sms.ed.ac.uk/INBOX" . ?u)
	))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; RENDING HTML EMAIL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-to-list 'load-path "/usr/local/Cellar/html2text/1.3.2a")
;; (require 'html2text)

;; (defun my-render-html-message ()
;;   (let ((dom (libxml-parse-html-region (point-min) (point-max))))
;;     (erase-buffer)
;;     (shr-insert-document dom)
;;     (goto-char (point-min))))

;; (setq mu4e-html2text-command 'my-render-html-message)

(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; SETTING UP MU4E ALERTS (not working)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package mu4e-alert
  :ensure t
  :after mu4e
  :init
  (setq mu4e-alert-interesting-mail-query
    (concat
     "flag:unread maildir:/kylecottonkc@gmail.com/INBOX "
     "OR "
     "flag:unread maildir:/k.d.cotton@sms.ed.ac.uk/INBOX"
     ))
  (mu4e-alert-enable-mode-line-display)
  (defun gjstein-refresh-mu4e-alert-mode-line ()
    (interactive)
    (mu4e~proc-kill)
    (mu4e-alert-enable-mode-line-display)
    )
  (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line)
  )

;;File for all custom keybindings

;; Top Row Shortcut Keys.


(global-set-key (kbd "M-§") 'org-agenda-list)
(global-set-key (kbd "M-1") 'mu4e)
(global-set-key (kbd "M-2") 'circe)
(global-set-key (kbd "M-3") 'elfeed)

(global-set-key (kbd "M-[") 'shrink-window)
(global-set-key (kbd "M-]") 'enlarge-window)
(global-set-key (kbd "M-{") 'shrink-window-horizontally)
(global-set-key (kbd "M-}") 'enlarge-window-horizontally)

;; (global-set-key (kbd "M-<backspace>") 'counsel-spotify-toggle-play-pause)
(global-set-key (kbd "M-0") 'counsel-spotify-toggle-play-pause)
(global-set-key (kbd "M-=") 'counsel-spotify-next)
(global-set-key (kbd "M--") 'counsel-spotify-previous)
(global-set-key (kbd "M-s") 'counsel-spotify-search-track)


;; (keyboard-translate ?\ESC ?\§)
