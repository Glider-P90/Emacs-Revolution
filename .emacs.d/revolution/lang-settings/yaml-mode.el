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
;; yaml-mode.el for revolution in ~/.emacs.d/revolution/lang-settings/
;; @description: 
;; 
;; Started on  Tue Jun  3 03:46:37 2025 @author Glider
;; Last update Tue Jun  3 03:57:48 2025 @author Glider
;; ======================================================================
;;; Code:

;; Utilise use-package pour charger yaml-mode
;;(use-package yaml-mode)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
	  '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(provide 'yaml-mode)
;;; yaml-mode.el ends here
