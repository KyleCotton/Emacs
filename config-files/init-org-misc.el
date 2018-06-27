;;Install org Mode
(use-package org
  :ensure t)

;;(use-package org
;;  :ensure org-plus-contrib
;;  :pin org)



;;Org Tags
(setq org-tag-alist '(("SixthForm" . ?s) ("University" . ?u) ("Personal" . ?p)))

;;Org Clocking
(setq org-clock-into-drawer t)

;;Org Bullets
(use-package org-bullets 
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'init-org-misc)

