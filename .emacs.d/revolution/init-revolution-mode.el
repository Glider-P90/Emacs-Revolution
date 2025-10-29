;;
;; ======================================================================
;; @license Copyright 2016-2025 Pierre Schebath
;; ---------------------
;; 
;; @brief This file has been written by Pierre Etienne Charles Schebath Cazoulat.
;; 
;; This source code, its related data and algorithms are Pierre Schebath
;; Proprietary Information and shall be protected in strict confidence by
;; the party who receives it.  It shall not be disclosed nor copied nor
;; duplicated in whole or in part to any third party without Pierre Schebath
;; written prior permission.
;; ======================================================================
;; init-revolution-mode.el for revolution in ~/.emacs.d/revolution/
;; @description: init of revolution's project
;; 
;; Started on  Wed Jun  4 11:18:08 2025 @author Glider
;; Last update Thu Oct 23 23:32:44 2025 @author Glider
;; ======================================================================
;;; Code:

(message "Init Revolution mode...")
(ac-config-default)
(org-babel-load-file "~/.emacs.d/revolution/globals.org")
(org-babel-load-file "~/.emacs.d/revolution/lib-revolution.org")
(org-babel-load-file "~/.emacs.d/revolution/lang-settings.org")
(org-babel-load-file "~/.emacs.d/revolution/elfeed-init.org")
(org-babel-load-file "~/.emacs.d/revolution/shortcuts.org")
(message "Revolution load \"%s\" done." major-mode)

(provide 'init-revolution-mode)
;;; init-revolution-mode.el ends here
