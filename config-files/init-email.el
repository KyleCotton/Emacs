;; Email Configuration

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; SETTING UP MU4E
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(require 'mu4e)

(setq mu4e-maildir (expand-file-name "~/.Mail"))
;; (setq mu4e-get-mail-command "offlineimap && mu index --maildir ~/.Mail")
(setq mu4e-get-mail-command "offlineimap")

;; Updates every 300 seconds
(setq mu4e-update-interval 300)


(setq mu4e-contexts
 `( ,(make-mu4e-context
     :name "Personal"
     :match-func (lambda (msg) (when msg
       (string-prefix-p "/kylecottonkc@gmail.com" (mu4e-message-field msg :maildir))))
     :vars '(
       (mu4e-trash-folder . "/kylecottonkc@gmail.com/[Gmail].Trash")
       (mu4e-refile-folder . "/kylecottonkc@gmail.com/[Gmail].Archive")
       (mu4e-sent-folder . "/kylecottonkc@gmail.com/[Gmail].Sent Mail")
       (mu4e-drafts-folder . "/kylecottonkc@gmail.com/[Gmail].Drafts")
       (user-mail-address "kylecottonkc@gmail.com")
       ))
))
   ;; ,(make-mu4e-context
   ;;   :name "University"
   ;;   :match-func (lambda (msg) (when msg
   ;;     (string-prefix-p "/k.d.cotton@sms.ed.ac.uk" (mu4e-message-field msg :maildir))))
   ;;   :vars '(
       ;; (mu4e-trash-folder . "/kylecottonkc@gmail.com/[Gmail].Trash")
       ;; (mu4e-refile-folder . "/kylecottonkc@gmail.com/[Gmail].Archive")
       ;; (mu4e-sent-folder . "/kylecottonkc@gmail.com/[Gmail].Sent Mail")
       ;; (mu4e-drafts-folder . "/kylecottonkc@gmail.com/[Gmail].Drafts")
   ;;     (mu4e-refile-folder . exchange-mu4e-refile-folder)
   ;;     ))
   ;; ))

(setq mu4e-maildir-shortcuts
      '(
	("/kylecottonkc@gmail.com/INBOX"  . ?p)
	("/k.d.cotton@sms.ed.ac.uk/INBOX" . ?u)
	))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; RENDING HTML EMAIL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-to-list 'load-path "/usr/local/Cellar/html2text/1.3.2a")
;; (require 'html2text)

;; (defun my-render-html-message ()
;;   (let ((dom (libxml-parse-html-region (point-min) (point-max))))
;;     (erase-buffer)
;;     (shr-insert-document dom)
;;     (goto-char (point-min))))

;; (setq mu4e-html2text-command 'my-render-html-message)

(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; SETTING UP MU4E ALERTS (not working)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package mu4e-alert
  :ensure t
  :after mu4e
  :init
  (setq mu4e-alert-interesting-mail-query
    (concat
     "flag:unread maildir:/kylecottonkc@gmail.com/INBOX "
     "OR "
     "flag:unread maildir:/k.d.cotton@sms.ed.ac.uk/INBOX"
     ))
  (mu4e-alert-enable-mode-line-display)
  (defun gjstein-refresh-mu4e-alert-mode-line ()
    (interactive)
    (mu4e~proc-kill)
    (mu4e-alert-enable-mode-line-display)
    )
  (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line)
  )




(provide 'init-email)

