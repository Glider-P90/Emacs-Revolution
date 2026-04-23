;;; markdown-mode.el --- -*- lexical-binding: t; -*-
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
;; markdown-mode.el for Emacs Revolution in ~/.emacs.d/revolution/modes/
;; @description: config file for markdown files.
;; 
;; Started on  Wed Apr 22 23:31:37 2026 @author Glider
;; Last update Wed Apr 22 23:31:54 2026 @author Glider
;; ======================================================================
;;; Code:

(use-package markdown-mode
    :ensure t
    :commands (markdown-mode gfm-mode)
    :mode (("README\\.md\\'" . gfm-mode)
           ("\\.md\\'" . markdown-mode)
           ("\\.markdown\\'" . markdown-mode))
    :init (setq markdown-command "multimarkdown")
    :config (setq markdown-open-command "/usr/local/bin/mark")
    :hook ((markdown-mode . flyspell-mode)
           (gfm-mode . flyspell-mode)))

(provide 'markdown-mode)
;;; markdown-mode.el ends here
