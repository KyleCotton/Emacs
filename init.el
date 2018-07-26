(add-to-list 'load-path "~/.emacs.d/config-files/")
(require 'init-setup)
(require 'init-secrets)
(require 'init-org-setup)
(require 'init-interface)
(require 'init-interface-theme)
(require 'init-os-specific)
(require 'init-vc-backup)
(require 'init-modeline)
(require 'init-text-manipulation)
(require 'init-text-navigation)
(require 'init-file-navigation)
(require 'init-help-documentation)
(require 'init-window-buffer-navigation)
(require 'init-org-misc)
(require 'init-org-agenda)
(require 'init-org-todo)
(require 'init-org-export)
(require 'init-org-agenda-custom-view)
(require 'init-org-capture)
(require 'init-irc)
(require 'init-org-calendar)
(require 'init-org-literate)
(require 'init-helm)
(require 'init-misc)
(require 'init-keybindings)
;;(require 'init-evil)

;;(require 'init-org-calendar-calfw)
;-----------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (all-the-icons-dired dired-sidebar helm-config helm-find-file helm-find-files helm-fuzzy-find helm-swoop helm zenburn-theme yasnippet which-key use-package try powerline-evil org-gcal org-bullets magit linum-relative htmlize expand-region doom-themes counsel calfw-org calfw-ical calfw-gcal calfw auto-complete airline-themes ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
