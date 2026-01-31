;;; .emacs --- -*- lexical-binding: t; -*-
;; ======================================================================
;; @license Copyright 2016-2026 Pierre Schebath
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
;; .emacs for Emacs Revolution in ~/
;;; Commentary:
;; @description: main file of project.
;; 
;; Started on  Sun Jan 25 00:01:57 2026 @author Glider
;; Last update Sat Jan 31 11:06:52 2026 @author Glider
;; ======================================================================
;;; Code:


;;;;;;;;;****************************;;;;;;;;;
;;;;;;;;;**     EMACS SETUP        **;;;;;;;;;
;;;;;;;;;****************************;;;;;;;;;

(require 'package)
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("gnu"    . "https://elpa.gnu.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

;; Set Emacs Revolution
(org-babel-load-file "~/.emacs.d/revolution/emacs-revolution.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cape corfu corfu-terminal dired-filetype-face dired-launch
	  dired-quick-sort disk-usage font-utils htmlize lsp-mode
	  marginalia neotree orderless org-drill org-side-tree quelpa
	  treesit-auto unicode-emoticons unicode-enbox vertico))
 '(which-key-popup-type 'side-window)
 '(which-key-show-prefix 'left))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-dir-link-face ((t (:foreground "brightblue"))))
 '(neo-file-link-face ((t (:foreground "magenta")))))
