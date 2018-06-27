;;Org Agenda

(message "Entered Org Agenda")
;;Define Agenda Files Location
(setq org-agenda-files (list "/Users/kyle/Dropbox/org/life.org"
                             "/Users/kyle/Dropbox/org/inbox.org"
                             "/Users/kyle/Dropbox/org/gcal.org"))

;;Define the Org Agenda Key Map
(define-key global-map "\C-ca" 'org-agenda)

;;Don't show done tasks in agenda
(setq org-agenda-skip-scheduled-if-done t)

;;Org Refile
(setq org-refile-targets
      '(("life.org" :maxlevel . 2)
	("inbox.org" :maxlevel . 2)))

;;Org Archive Type
(setq org-archive-location "%s_archive::datetree/")

(provide 'init-org-agenda)

