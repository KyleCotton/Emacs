;;IRC Config File

;;https://github.com/jorgenschaefer/circe/wiki/Commands

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
          `(("ZNC/freenode"
         :tls t
         :host ,homelab-address
         :port 6501
         :user "kyle/freenode"
         :pass ,znc-password)
         ("ZNC/imaginarynet"
          :tls t
          :host ,homelab-address
          :port 6501
          :user "kyle/imaginarynet"
          :pass ,znc-password))))


;; (setq circe-network-options
;;       `(("Freenode"
;;          :nick "forcer"
;;          :channels (:after-auth "#wildfly" "#hibernate-dev")
;;          :nickserv-password ,freenode-password)))


(setq circe-format-say "{nick:-16s} {body}")
(setq circe-color-nicks-everywhere t)
(enable-circe-color-nicks)
(setq circe-reduce-lurker-spam t)
(setq erc-server-auto-reconnect nil)

(defun irc ()
  "Connect to IRC"
  (interactive)
  (circe "ZNC/imaginarynet")
  (circe "ZNC/freenode"))



(provide 'init-irc)


;;https://github.com/jorgenschaefer/circe/wiki
;;https://github.com/wasamasa/dotemacs/blob/master/init.org
;;https://github.com/stsquad/my-emacs-stuff/blob/master/my-circe.el
;;https://github.com/jorgenschaefer/circe/wiki/Configuration
;;https://github.com/alphor/.emacs.d
