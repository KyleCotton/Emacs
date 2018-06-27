;;Adding the calfw Support

(use-package calfw-ical
  :ensure t)

(use-package calfw-org
  :ensure t)

(use-package calfw
  :ensure ;TODO: 
  :config
  (require 'calfw) 
  (setq cfw:org-overwrite-default-keybinding t)

  (defun mycalendar ()
    (interactive)
    (cfw:open-calendar-buffer
     :contents-sources
     (list
      (cfw:ical-create-source "gcal" "https://calendar.google.com/calendar/ical/kylecottonkc%40gmail.com/public/basic.ics" "IndianRed")))) 
  (setq cfw:org-overwrite-default-keybinding t))

(use-package calfw-gcal
	:ensure t
	:config
	(require 'calfw-gcal))


(provide init-org-calendar-calfw)
