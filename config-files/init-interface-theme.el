;;Install the theme
(use-package doom-themes
  :ensure t)

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
;;(load-theme 'doom-nord t)

(load-theme 'doom-peacock t)
;;(load-theme 'doom-one t)

;;List of Possible Themes
;;doom-one
;;doom-one-light (WIP)
;;doom-vibrant (WIP)
;;doom-citylights
;;doom-dracula
;;doom-molokai
;;doom-nord
;;doom-nord-light
;;doom-nova (WIP)
;;doom-peacock
;;doom-solarized-light
;;doom-spacegrey
;;doom-tomorrow-night (WIP)


;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)


(provide 'init-interface-theme)
