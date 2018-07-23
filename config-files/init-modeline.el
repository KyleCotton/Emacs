;;Mode Line
(display-time-mode 1)

;; (use-package powerline
;;   :ensure t
;;   :init
;;   (progn
;;     (require 'cl)
;;     (powerline-default-theme)
;;     (setq powerline-arrow-shape 'arrow)))
 (use-package powerline
   :ensure t
   :init
   (powerline-default-theme))

(use-package airline-themes
  :ensure t
  :init
  (load-theme 'airline-light))

;; (use-package powerline-evil
;;   :ensure t
;;   :init
;;   (progn
;;     (require 'cl)
;;     (powerline-default-theme)
;;     (setq powerline-arrow-shape 'arrow)))

(provide 'init-modeline)
