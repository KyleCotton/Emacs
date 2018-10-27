;;Custom Agenda View 1

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          ;; (agenda "")
          ;; (alltodo "")
	  ))))

(provide 'init-org-agenda-custom-view)
