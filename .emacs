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
;; Last update Mon Jan 26 14:52:28 2026 @author Glider
;; ======================================================================
;;; Code:


;;;;;;;;;****************************;;;;;;;;;
;;;;;;;;;**     EMACS SETUP        **;;;;;;;;;
;;;;;;;;;****************************;;;;;;;;;

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("org" . "https://orgmode.org/elpa/")))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "unspecified-bg" :foreground "dodgerblue" :inverse-video nil :box nil :strike-through nil :extend nil :overline nil :underline nil :slant normal :weight regular :height 1 :width normal :foundry "default" :family "default"))))
 '(Info-quoted ((t (:inherit fixed-pitch-serif))))
 '(ag-match-face ((t (:inherit match :background "yellow" :distant-foreground "black" :foreground "black"))))
 '(ansi-color-green ((t (:background "green3" :foreground "brightgreen"))))
 '(corfu-bar ((t (:background "darkorange" :foreground "darkslategray"))))
 '(corfu-border ((t (:background "#d7d7d7" :foreground "black"))))
 '(custom-comment ((t (:background "brightgreen" :foreground "black"))))
 '(elisp-shorthand-font-lock-face ((t (:inherit font-lock-keyword-face :foreground "green"))))
 '(font-lock-builtin-face ((t (:foreground "deepskyblue"))))
 '(font-lock-string-face ((t (:foreground "brightmagenta"))))
 '(neo-file-link-face ((t (:foreground "deepskyblue"))))
 '(org-checkbox ((t (:inherit bold :foreground "green"))))
 '(org-code ((t (:inherit shadow :foreground "green"))))
 '(org-default ((t (:inherit default :foreground "deepskyblue"))))
 '(org-property-value ((t (:inherit default :foreground "dodgerblue"))))
 '(org-tag ((t (:background "purple1" :weight bold))))
 '(popup-scroll-bar-foreground-face ((t (:background "blue"))))
 '(shadow ((t (:foreground "brightgreen")))))

;; Set Emacs Revolution
(org-babel-load-file "~/.emacs.d/revolution/emacs-revolution.org")

(provide '.emacs)
;;; .emacs ends here
