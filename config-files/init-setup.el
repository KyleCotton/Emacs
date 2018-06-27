;;Add package archives
(require 'package)
  (setq package-enable-at-startup nil)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/")t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; (setq
;;    package-archives
;;    '(("melpa-stable" . "http://stable.melpa.org/packages/")
;;      ("melpa" . "http://melpa.org/packages/")
;;      ("org"         . "http://orgmode.org/elpa/")
;;      ("gnu"         . "http://elpa.gnu.org/packages/")))



;;Enable use-package
(package-initialize)

(unless (package-installed-p 'bind-key)
  (package-refresh-contents)
  (package-install 'bind-key))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;Enable servermode allows emacs client to connect
(server-mode t)

(provide 'init-setup)
