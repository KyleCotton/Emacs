;;Disable Startup Message
(setq inhibit-startup-message t)

;;Disable Tool Bar
(tool-bar-mode -1)

;;Disable Tool Bar
(menu-bar-mode -1) 

;;Enable Line Numbers
(global-linum-mode t)

;;Relitive Line Numbers
(use-package linum-relative
       :ensure t
       :config
       (linum-relative-on))

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


(provide 'init-interface)
