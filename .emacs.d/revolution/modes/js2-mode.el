;;; js2-mode.el --- -*- lexical-binding: t; -*-
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
;; js2-mode.el for Emacs-revolution in /home/glider/.emacs.d/revolution/modes/
;; @description: php/html/css/javascript config file.
;; 
;; Started on  Sun Feb  1 23:01:27 2026 @author Glider
;; Last update Fri Apr 17 13:02:39 2026 @author Glider
;; ======================================================================
;;; Code:

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((javascript . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-completion-provider :none
	lsp-completion-enable t
	lsp-completion-default-behaviour :insert
	lsp-enable-snippet t
	lsp-prefer-flymake t
	lsp-dired-mode nil
	lsp-keymap-prefix "C-c l"))

(require 'dap-firefox)
(dap-firefox-setup)

(provide 'js2-mode)
;;; js2-mode.el ends here
