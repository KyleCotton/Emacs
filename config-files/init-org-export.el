;;Org HTML Export
(use-package htmlize
  :ensure t)

;;Agenda Export
(setq org-agenda-exporter-settings
      '((ps-number-of-columns 2)
	(ps-landscape-mode t)
        (org-agenda-add-entry-text-maxlines 5)
        (htmlize-output-type 'css)))


(provide 'init-org-export)
