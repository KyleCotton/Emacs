;;Adds configuration for org gcal
(setq package-check-signature nil)

(use-package org-gcal
  :ensure t
  :config
  (setq org-gcal-client-id "771908957162-p4ckpjmkd0couakj9ma9ofsm72cuc3fd.apps.googleusercontent.com"
	org-gcal-client-secret "QOVj0CDKslUfrRnEOrLQIl7B"
	org-gcal-file-alist '(("kylecottonkc@gmail.com" .  "~/Dropbox/org/gcal.org"))))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-fetch)(org-gcal-sync) ))
;;(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

(provide 'init-org-calendar)
