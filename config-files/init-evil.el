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



(provide 'init-evil)
