;;Define Todo's
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "WAITING(w)" "SOMEDAY(s)" "|" "DONE(d)" "CANCELLED(c)" "ARCHIVE(a)"))))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
	      ("SOMEDAY" :foreground "orange" :weight bold)
	      ("DONE" :foreground "forest green" :weight bold)
	      ("WAITING" :foreground "orange" :weight bold)
	      ("CANCELLED" :foreground "forest green" :weight bold)
	      ("ARCHIVE" :foreground "forest green" :weight bold))))

;;Set the parent todo done when all children complete
(defun org-summary-todo (n-done n-not-done)
  (let (org-log-done org-log-states)
  (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


