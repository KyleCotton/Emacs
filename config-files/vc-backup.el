;;Change the location of backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

;;Reload the file if chaanged on the disk
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)

;;Install magit
(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))
