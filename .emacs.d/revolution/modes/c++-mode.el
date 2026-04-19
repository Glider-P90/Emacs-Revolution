;;; cpp-mode.el --- -*- lexical-binding: t; -*-
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
;; cpp-mode.el for revolution in /home/glider/.emacs.d/revolution/modes/
;; @description: Configuration pour le mode c++.
;; 
;; Started on  Mon Jun  2 14:50:20 2025 @author Glider
;; Last update Fri Apr 17 11:16:40 2026 @author Glider
;; ======================================================================
;;; Code:

;;(add-hook 'completion-at-point-functions #'cape-elisp-block 10 t)
;;(add-hook 'completion-at-point-functions #'cape-dabbrev 90 t)

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((cpp . lsp) (clang . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snippet t)
  (setq lsp-prefer-flymake t))

(use-package dap-gdb :ensure t)
(use-package dap-lldb :ensure t)

(provide 'cpp-mode)
;;; cpp-mode.el ends here
