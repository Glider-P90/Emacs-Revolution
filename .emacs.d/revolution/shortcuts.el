(global-unset-key (kbd "C-_"))
(global-unset-key (kbd "C-x u"))
(global-set-key [(control z)] 'undo)

;;******     Insert an header      ******;;
(global-set-key (kbd "C-c h") 'std-file-header)

;;******  Affiche le mode majeur   ******;;
(global-set-key (kbd "C-c m") 'show-major-mode)

;;******  Affiche dans la fenetre principale les flux RSS   ******;;
(global-set-key (kbd "C-c n") #'my/open-elfeed-fullscreen)
(global-set-key (kbd "C-c w") 'elfeed)
