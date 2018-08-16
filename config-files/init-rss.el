;; RSS Reader Customisations
(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "/Users/kyle/Dropbox/org/elfeed.org")))

(defun kyle/elfeed-show-all ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-all"))
(defun kyle/elfeed-show-emacs ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-emacs"))
(defun kyle/elfeed-show-daily ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-daily"))

;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun kyle/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

;;write to disk when quiting
(defun kyle/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))


(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
              ("A" . kyle/elfeed-show-all)
              ("E" . kyle/elfeed-show-emacs)
              ("D" . kyle/elfeed-show-daily)
              ("q" . kyle/elfeed-save-db-and-bury)))

(provide 'init-rss)


;;http://pragmaticemacs.com/emacs/read-your-rss-feeds-in-emacs-with-elfeed/
