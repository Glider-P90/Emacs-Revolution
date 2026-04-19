;;; package --- Summary
;;; Commentary:
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
;; yaml-mode.el for revolution in ~/.emacs.d/revolution/modes/
;; @description: yaml config file.
;; 
;; Started on  Tue Jun  3 03:46:37 2025 @author Glider
;; Last update Fri Apr 17 13:03:43 2026 @author Glider
;; ======================================================================
;;; Code:

(use-package yaml-mode :ensure t)

(use-package lsp-mode
  :ensure t
  :after eglot
  :commands lsp
  :hook ((yaml-mode . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-completion-provider :none
	lsp-completion-enable t
	lsp-completion-default-behaviour :insert
	lsp-enable-snippet t
	lsp-prefer-flymake t
	lsp-dired-mode nil
	lsp-keymap-prefix "C-c l"))

(provide 'yaml-mode)
;;; yaml-mode.el ends here
