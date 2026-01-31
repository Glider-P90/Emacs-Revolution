;;; emacs-lisp-mode.el --- -*- lexical-binding: t; -*-
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
;; emacs-lisp-mode.el for revolution in /home/glider/.emacs.d/revolution/lang-settings/
;; @description: Configuration pour le mode elisp.
;; 
;; Started on  Mon Jun  2 14:50:20 2025 @author Glider
;; Last update Wed Jan 28 12:27:12 2026 @author Glider
;; ======================================================================
;;; Code:

(add-hook 'completion-at-point-functions #'cape-elisp-block 10 t)
(add-hook 'completion-at-point-functions #'cape-dabbrev 90 t)

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((emacs-lisp . lsp) (lisp . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snippet t)
  (setq lsp-prefer-flymake t))

(provide 'emacs-lisp-mode)
;;; emacs-lisp-mode.el ends here
