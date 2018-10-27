;;This code allow for literate programming in org mode.
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (java . t)
   (haskell . t)
   (latex . t)
   ))

;; (setq max-lisp-eval-depth 10000)
;; (setq max-specpdl-size 10000)

(provide 'init-org-literate)
