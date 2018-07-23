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


(provide 'init-modeline)
