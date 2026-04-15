;;; css-mode.el --- -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
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
;; css-mode.el for Emacs-Revolution in ~/.emacs.d/revolution/modes/
;; @description: mode for css/scss.
;; 
;; Started on  Mon Feb  2 01:22:21 2026 @author Glider
;; Last update Thu Apr  9 10:29:12 2026 @author Glider
;; ======================================================================
;;; Code:

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((css . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snippet t)
  (setq lsp-prefer-flymake t))

;; (use-package js2-mode :ensure t)
;; (use-package simple-httpd
;;   :ensure t
;;   :init
;;   (setq httpd-root "/var/www")
;;   (httpd-start))

;; (use-package skewer-mode
;;   :ensure t
;;   :init
;;   (httpd-start))
  
;; (add-hook 'js2-mode-hook 'skewer-mode)
;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)
  
(provide 'css-mode)
;;; css-mode.el ends here
