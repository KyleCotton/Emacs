;; General Programming/Development Config

;; (add-hook 'c-mode-common-hook   'hs-minor-mode)
;; (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;; (add-hook 'java-mode-hook       'hs-minor-mode)
;; (add-hook 'lisp-mode-hook       'hs-minor-mode)
;; (add-hook 'perl-mode-hook       'hs-minor-mode)
;; (add-hook 'sh-mode-hook         'hs-minor-mode)

(use-package origami
 :ensure t)

(global-set-key (kbd "C-.") 'origami-recursively-toggle-node)
(add-hook 'java-mode-hook 'origami-mode)


;; (add-hook 'shell-mode-hook
;;       (lambda ()
;;         (face-remap-set-base 'comint-highlight-prompt :inherit nil)))

(provide 'init-dev-general)
