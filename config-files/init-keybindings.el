;;File for all custom keybindings

;; Top Row Shortcut Keys.


(global-set-key (kbd "M-§") 'org-agenda-list)
(global-set-key (kbd "M-1") 'mu4e)
(global-set-key (kbd "M-2") 'circe)
(global-set-key (kbd "M-3") 'elfeed)

;; (global-set-key (kbd "M-<backspace>") 'counsel-spotify-toggle-play-pause)
(global-set-key (kbd "M-0") 'counsel-spotify-toggle-play-pause)
(global-set-key (kbd "M-=") 'counsel-spotify-next)
(global-set-key (kbd "M--") 'counsel-spotify-previous)
(global-set-key (kbd "M-s") 'counsel-spotify-search-track)


;; (keyboard-translate ?\ESC ?\§)

(provide 'init-keybindings)
