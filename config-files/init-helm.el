;; Helm Configuration

;; (use-package helm
;;   :ensure t)

;; (use-package helm-config
;;   :ensure t)

(use-package helm-swoop
  :ensure t)

;; (use-package helm-find-files
;;   :ensure t)


;; (global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-s") 'helm-swoop-without-pre-input)
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)


(provide 'init-helm)
