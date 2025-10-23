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
;; Last update Thu Oct 23 23:13:40 2025 @author Glider
;; ======================================================================
;;; Code:

(defvar user-home (getenv "HOME") "Chemin du répertoire home de l'utilisateur.")
(defvar user-name (user-login-name) "Nom de l'utilisateur courant.")

(load-file (concat user-home (concat user-name "yaml-mode/yaml-mode.el")))

(provide 'yaml-mode)
;;; yaml-mode.el ends here
