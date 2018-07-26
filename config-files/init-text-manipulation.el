;;UndoTree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))


;;Counsel
(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

;;Allow Emacs to access OS clipboard
(setq save-interprogram-paste-before-kill t)

;;Auto-Complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;;Ya Snippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(provide 'init-text-manipulation)

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
