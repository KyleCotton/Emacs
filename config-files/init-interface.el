;;Disable Startup Message
(setq inhibit-startup-message t)

;;Disable Tool Bar
(tool-bar-mode -1)

;;Enable Line Numbers
(global-linum-mode t)
;;Relitive Line Numbers
;; (use-package linum-relative
;;        :ensure t
;;        :config
;;        (linum-relative-on))

;;Confirmation Message
(fset 'yes-or-no-p 'y-or-n-p)

;;Line Highlighting
(global-hl-line-mode t)

;;Change the Default Size of the Text
(set-face-attribute 'default nil :height 155)

;;Load the theme
(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

;; (use-package doom-themes
;;   :ensure t
;;   :config (load-theme 'doom-peakcock)

;; ;; Global settings (defaults)
;; (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;       doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; ;; may have their own settings.
;; (load-theme 'doom-one t)

;; ;; Enable flashing mode-line on errors
;; (doom-themes-visual-bell-config)

;; ;; Enable custom neotree theme
;; (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; ;; Corrects (and improves) org-mode's native fontification.
;; (doom-themes-org-config)

;; ;;Disable the Bell, use visual instead.
;; (setq ring-bell-function 'ignore)
;; (setq visible-bell nil)
;;#####################################################


;;Clear the Buffers List
(setq ido-virtual-buffers '())
(setq recentf-list '())


(provide 'init-interface)
