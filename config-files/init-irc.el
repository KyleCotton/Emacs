;;Erc Code
(defun erc-login ()
  (interactive)
  (let
      ((password-cache nil))
    (erc
     :server "irc.freenode.net"
     :port "6667"
     :nick "ScriptRunner"
     :password freenode-password)))

(provide 'init-irc)

