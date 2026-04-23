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
;; conf-mode.el for revolution in /home/glider/.emacs.d/revolution/modes/
;; @description: Parametre conf-mode
;; 
;; Started on  Mon Jun  2 11:20:32 2025 @author Glider
;; Last update Wed Apr 22 23:28:14 2026 @author Glider
;; ======================================================================
;;; Code:

(setq-default indent-enabled nil)
(setq-default tab-width 0)
(setq-default standard-indent 0)
(add-hook 'text-mode-hook 'visual-line-mode)
(add-to-list 'completion-at-point-functions #'cape-emoji)
(add-to-list 'completion-at-point-functions #'cape-abbrev)

(provide 'conf-mode.el)
;;; conf-mode.el ends here
