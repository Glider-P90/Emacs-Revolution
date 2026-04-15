;;; sh-mode.el --- -*- lexical-binding: t; -*-
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
;; sh-mode.el for Emacs Revolution in ~/.emacs.d/revolution/modes/
;; @description: Configuration pour le mode Bash.
;; 
;; Started on  Wed Apr 15 16:00:11 2026 @author Glider
;; Last update Wed Apr 15 16:54:48 2026 @author Glider
;; ======================================================================
;;; Code:

(use-package lsp-mode
  :ensure t
  :after eglot
  :commands lsp
  :hook ((sh-lisp . lsp) (bash-ts-mode . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snippet t)
  (setq lsp-prefer-flymake t))

(provide 'sh-mode)
;;; sh-mode.el ends here
