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
;; Last update Fri Apr 17 13:23:53 2026 @author Glider
;; ======================================================================
;;; Code:


(add-to-list 'completion-at-point-functions #'cape-elisp-symbol)
(add-to-list 'completion-at-point-functions #'cape-elisp-block)
(add-to-list 'completion-at-point-functions #'cape-elisp-symbol-wrapper)

(provide 'emacs-lisp-mode)
;;; emacs-lisp-mode.el ends here
