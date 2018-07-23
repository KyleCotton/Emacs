;; Emacs Evil Mode

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; The above line is not tested
;; Not using evil at the minute
;;(evil-mode 1)



;;Relitive Line Numbers
(use-package linum-relative
       :ensure t
       :config
       (linum-relative-on))

;; Modeline

;; (use-package airline-themes
;;   :ensure t
;;   :init
;;   (load-theme 'airline-light))

;; (use-package powerline-evil
;;   :ensure t
;;   :init
;;   (progn
;;     (require 'cl)
;;     (powerline-default-theme)
;;     (setq powerline-arrow-shape 'arrow)))


(provide 'init-evil)
