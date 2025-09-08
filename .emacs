;; Last update Wed Jun  4 23:49:24 2025 @author Glider
;;; Commentary:
;; ======================================================================
;; @license Copyright 2016-2024 Pierre Schebath
;; ---------------------
;;
;; @brief This file has been written by Pierre Etienne Charles Schebath Cazoulat.
;;
;; This source code, its related data and algorithms are Pierre Schebath
;; Proprietary Informatichaon and shall be protected in strict confidence by
;; the party who receives it.  It shall not be disclosed nor copied nor
;; duplicated in whole or in part to any third party without Pierre Schebath
;; written prior permission.
;; ======================================================================
;; .emacs for lugtech in ~/
;; @description: glider config
;;
;; Started on  Sat Jan 27 08:22:36 2024 @author Glider
;; ======================================================================
;;; Code:

;;;;;;;;;****************************;;;;;;;;;
;;;;;;;;;**     EMACS SETUP        **;;;;;;;;;
;;;;;;;;;****************************;;;;;;;;;

;;;;;;;;;     GENERAL SETTINGS      ;;;;;;;;;;

;; Initialise le gestionnaire de packages
(require 'package)

;;; Ajoute les dépôts
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
;; Initialise le gestionnaire de packages
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(message "Emacs external configuration is loaded")
(defun revolution-load-org-config()
  "Load revolution configuration."
  (message "Emacs Start revolution")
  (add-to-list 'load-path "~/.emacs.d/revolution/")
  (require 'init-revolution-mode)
  )

(add-hook 'window-setup-hook 'revolution-load-org-config)

;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   '("https://linuxfr.org/news.atom" "https://www.journalduhacker.net/rss"))
 '(org-agenda-files
   '("~/.emacs.d/revolution/globals.org" "/home/glider/.emacs.d/revolution/planning/todo.org" "/home/glider/.emacs.d/revolution/planning/projets.org" "/home/glider/.emacs.d/revolution/planning/rdv.org"))
 '(package-selected-packages
   '(multiple-cursors boxy-headings elfeed-score elfeed-org neotree elfeed quelpa-use-package quelpa org-ac company-mode calfw-org company-org-block flycheck-posframe posframe company which-key -package flycheck-package elisp-demos bug-hunter auto-complete el-fly-indent-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
