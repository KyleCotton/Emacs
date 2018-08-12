;; Window and buffer navigation configuration

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
         ("irc" (mode . circe-channel-mode))
	 ("Org" (or (mode . org-mode)
		    (filename . "OrgMode")))
	 ("Development" (or (mode . shell-mode)
			(mode . eshell-mode)))
	 ("Magit" (mode . magit-mode))
	 ("ERC" (mode . erc-mode))
	 ("Help" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*"))))))


(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "home")))

(setq ibuffer-show-empty-filter-groups nil)

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-auto-mode 1)
	    (ibuffer-switch-to-saved-filter-groups "default")))


(provide 'init-window-buffer-navigation)
