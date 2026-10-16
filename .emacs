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
;; Last update Sat Jan 31 11:06:52 2026 @author Glider
;; ======================================================================
;;; Code:


;;;;;;;;;****************************;;;;;;;;;
;;;;;;;;;**     EMACS SETUP        **;;;;;;;;;
;;;;;;;;;****************************;;;;;;;;;

(require 'package)
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("gnu"    . "https://elpa.gnu.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; Set Emacs Revolution
(org-babel-load-file "~/.emacs.d/revolution/emacs-revolution.org")
(org-babel-load-file "~/.emacs.d/revolution/installer.org")
