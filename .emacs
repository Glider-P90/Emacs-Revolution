;; Last update Sun Jan 18 09:28:47 2026 @author Glider
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
        ("gnu"   . "https://elpa.gnu.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("org" . "https://orgmode.org/elpa/")))

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
  (org-babel-load-file "~/.emacs.d/revolution/globals.org")
  (org-babel-load-file "~/.emacs.d/revolution/lib-revolution.org")
  (org-babel-load-file "~/.emacs.d/revolution/revolution-settings.org")
  (org-babel-load-file "~/.emacs.d/revolution/ihm.org")
  (org-babel-load-file "~/.emacs.d/revolution/lang-settings.org")
  (org-babel-load-file "~/.emacs.d/revolution/headers/std_comment.org")
  (org-babel-load-file "~/.emacs.d/revolution/header.org")
  (org-babel-load-file "~/.emacs.d/revolution/shortcuts.org")
  (message "Revolution loaded on \"%s\" done." major-mode)
  )

(add-hook 'window-setup-hook 'revolution-load-org-config)

;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   '("https://linuxfr.org/news.atom"
     "https://www.journalduhacker.net/rss"))
 '(org-agenda-files
   '("~/Projects/Emacs-Revolution/README.org"
     "/home/glider/.emacs.d/revolution/planning/todo.org"
     "/home/glider/.emacs.d/revolution/planning/projets.org"
     "/home/glider/.emacs.d/revolution/planning/rdv.org"))
 '(package-selected-packages
   '(-package ag boxy-headings bug-hunter calfw-org cape corfu dap-mode
	      el-fly-indent-mode elfeed elfeed-org elfeed-protocol
	      elfeed-score elisp-demos flycheck flycheck-package
	      flycheck-posframe ivy log4e lsp-mode lsp-ui marginalia
	      multiple-cursors neotree orderless posframe projectile
	      quelpa quelpa-use-package treesit-auto vertico which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elisp-shorthand-font-lock-face ((t (:inherit font-lock-keyword-face :foreground "green"))))
 '(font-lock-builtin-face ((t (:foreground "deepskyblue"))))
 '(font-lock-string-face ((t (:foreground "brightmagenta"))))
 '(popup-scroll-bar-foreground-face ((t (:background "blue")))))
