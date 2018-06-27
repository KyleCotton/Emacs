;;Org Capture
;;Capture Key Bindings
(global-set-key (kbd "C-c c") 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)

(setq org-log-done t)
(setq org-agenda-skip-scheduled-if-done t)

;;Capture Templates
(setq org-capture-templates
      '(("t" "Quick Task" entry (file "~/Dropbox/org/inbox.org") "* TODO %^{Brief Task Description}\nSCHEDULED: %^t\n %^{Additional Details}" :prepend t)
	("e" "Event" entry (file  "~/Dropbox/org/gcal.org" ) "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")

	("n" "Note" entry (file+headline "~/Dropbox/org/life.org" "Notes") "* %^{Title}\n%?" :prepend t)

	("d" "Diary" entry (file+datetree "~/Dropbox/org/diary.org") "** %^{Entry Title}\n%?")

	("l" "Log Time" entry (file+datetree "~/Dropbox/org/time-log.org") "** %T - %^{Activity}")))


(provide 'init-org-capture)
