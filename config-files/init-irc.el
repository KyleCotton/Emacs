;;IRC Config File

(use-package circe
  :ensure t)

(setq circe-default-nick "ScriptRunner"
      circe-default-user "ScriptRunner"
      circe-default-realname "ScriptRunner"
      circe-default-part-message "ScriptRunner Says: Bye"
      circe-default-quit-message "ScriptRunner Says: Bye")

(setq circe-new-buffer-behavior 'ignore)

(setq circe-network-options
      (let ((server-passwd
             (lambda (server-name)
               (read-passwd (format "Password for server: %s? " server-name)))))
        `(
         ("ZNC/imaginarynet"
          :tls t
          :host ,homelab-address
          :port 6501
          :user "kyle/imaginarynet"
          :pass ,znc-password)
	 ("ZNC/freenode"
         :tls t
         :host ,homelab-address
         :port 6501
         :user "kyle/freenode"
         :pass ,znc-password)
	 )))

(setq circe-format-say "{nick:-16s} {body}")
(setq circe-color-nicks-everywhere t)
(enable-circe-color-nicks)
(setq circe-reduce-lurker-spam t)
(setq erc-server-auto-reconnect nil)

(setq
 lui-time-stamp-position 'right-margin
 lui-fill-type nil)

(add-hook 'lui-mode-hook 'my-lui-setup)
(defun my-lui-setup ()
  (setq
   fringes-outside-margins t
   right-margin-width 5
   word-wrap t
   wrap-prefix "    "))


(setq circe-network-defaults nil)


(provide 'init-irc)
