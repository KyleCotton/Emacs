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

;;Clear the Buffers List
(setq ido-virtual-buffers '())
(setq recentf-list '())

;; Make the cursor full width of the character beneth it
(setq x-stretch-cursor t)


(provide 'init-interface)
