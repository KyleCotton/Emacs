;;Swiper (Searching)
(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "C-x b") 'ivy-switch-buffer)))
;;    (global-set-key (kbd "C-x k") 'ivy-kill-buffer)))

;;Avy
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;;Expand Region
(use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))



;;Narrow & Widen
 (defun narrow-or-widen-dwim (p)
   (interactive "P")
   (declare (interactive-only))
   (cond ((and (buffer-narrowed-p) (not p)) (widen))
         ((region-active-p)
          (narrow-to-region (region-beginning)
                            (region-end)))
         ((derived-mode-p 'org-mode)
          (cond ((ignore-errors (org-edit-src-code) t)
                 (delete-other-windows))
                ((ignore-errors (org-narrow-to-block) t))
                (t (org-narrow-to-subtree))))
         ((derived-mode-p 'latex-mode)
          (LaTeX-narrow-to-environment))
         (t (narrow-to-defun))))
 (define-key ctl-x-map "n" #'narrow-or-widen-dwim)
 (add-hook 'LaTeX-mode-hook
           (lambda ()
             (define-key LaTeX-mode-map "\C-xn"
               nil)))



