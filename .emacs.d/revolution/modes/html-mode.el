;;; html-mode.el --- -*- lexical-binding: t; -*-
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
;; html-mode.el for Emacs Revolution in ~/Projects/Emacs-Revolution/.emacs.d/revolution/lang-settings/
;; @description: load packages and configure them in convenience of the language file.
;; 
;; Started on  Fri Jan 23 10:57:22 2026 @author Glider
;; Last update Mon Jan 26 13:36:00 2026 @author Glider
;; ======================================================================
;;; Code:


(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((semgrep . lsp) (javascript . lsp) (css . lsp) (html-mode . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snippet t)
  (setq lsp-prefer-flymake t))

(provide 'html-mode)
;;; html-mode.el ends here
