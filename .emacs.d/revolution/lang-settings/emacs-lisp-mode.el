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
;; @description: 
;; 
;; Started on  Mon Jun  2 14:50:20 2025 @author Glider
;; Last update Mon Jun  2 23:04:10 2025 @author Glider
;; ======================================================================
;;; Code:

;;; GLOBALS ;;;
(setq shortcut-debug "C-c d")        ; Debugging code
(setq shortcut-compilation "C-c c")  ; Compilation
(setq shortcut-search "C-c s")       ; Search function/Macro/keywords

(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)))

(setq tab-always-indent 'complete)

(use-package auto-complete
  :ensure t
  :init
  (ac-config-default)
  :config
  (setq ac-auto-start 2
        ac-ignore-case nil)
  (global-auto-complete-mode t))

(use-package flycheck
    :ensure t
    :init (global-flycheck-mode)
    :config
    (add-hook 'after-init-hook #'global-flycheck-mode))

;; Raccourci debugger
(global-set-key (kbd shortcut-debug) 'bug-hunter-file)

(provide 'emacs-lisp-mode)
;;; emacs-lisp-mode.el ends here

