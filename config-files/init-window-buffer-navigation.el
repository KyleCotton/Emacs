;; Window and buffer navigation configuration

(global-set-key (kbd "M-[") 'shrink-window)
(global-set-key (kbd "M-]") 'enlarge-window)
(global-set-key (kbd "M-{") 'shrink-window-horizontally)
(global-set-key (kbd "M-}") 'enlarge-window-horizontally)

;;Ace Window
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))))


;;Winner Mode
(winner-mode 1)

;;IBuffer List Buffers
(defalias 'list-buffers 'ibuffer-other-window)

;; Groups for specific buffer types

(setq ibuffer-saved-filter-groups
      '(("home"
	 ("Org" (or (mode . org-mode)
		    (filename . "OrgMode")))
	 ("Development" (or (mode . shell-mode)
			    (mode . eshell-mode)
			    (mode . haskell-mode)
			    (name . ".hs$")))
	 ("dired" (mode . dired-mode))
	 ("emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")))
	 ("irc" (or (mode . circe-channel-mode)
			    (mode . circe-server-mode)))
	 ("magit" (or (mode . magit-mode)
			    (name . "*magit*")))
	 ("Help" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*")))
	 ("email" (or (mode . mu4e-headers)
			    (mode . mu4e:compose)))
	 )))


(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "home")))

(setq ibuffer-show-empty-filter-groups nil)

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-auto-mode 1)
	    (ibuffer-switch-to-saved-filter-groups "default")))

(use-package ibuffer-rcirc
  :ensure t)

(setq ibuffer-formats
      '((mark modified read-only rcirc-activity-status-one-char " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              ;; (rcirc-activity-status 20 18 :left) " "
              ;; (rcirc-activity-status-mini 5 3 :center) " "
              filename-and-process)))

(defun kyle/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x M-k") 'kyle/kill-this-buffer)

(provide 'init-window-buffer-navigation)
