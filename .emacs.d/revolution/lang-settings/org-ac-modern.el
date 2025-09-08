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
;; org-ac-modern.el for revolution in ~/.emacs.d/revolution/lang-settings/
;; @description: 
;; 
;; Started on  Tue Jun  3 01:23:51 2025 @author Glider
;; Last update Tue Jun  3 01:23:53 2025 @author Glider
;; ======================================================================
;;; Code:

(require 'cl-lib)
(require 'org)
(require 'auto-complete)

(defgroup org-ac nil
  "Auto-complete configuration for org-mode."
  :group 'org
  :prefix "org-ac-")

(cl-defun org-ac-config-default ()
  "Enable org-mode auto-completion via auto-complete."
  (add-to-list 'ac-modes 'org-mode)
  (add-hook 'org-mode-hook 'ac-org-mode-setup))

(cl-defun ac-org-mode-setup ()
  "Setup auto-complete for org-mode."
  (setq ac-sources (cl-remove-if (lambda (s) (eq s 'ac-source-words-in-same-mode-buffers))
                                 ac-sources))
  (add-to-list 'ac-sources 'ac-source-org-headline)
  (add-to-list 'ac-sources 'ac-source-words-in-all-buffer))

(ac-define-source org-headline
  '((candidates . (cl-remove-if-not
                   (lambda (c) (string-match "^\\*+ " c))
                   (all-completions "" (org-ac-collect-headlines))))
    (symbol . "h")))

(cl-defun org-ac-collect-headlines ()
  "Collect headlines in current org buffer."
  (let ((headlines '()))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward org-complex-heading-regexp nil t)
        (push (match-string 0) headlines)))
    headlines))

(provide 'org-ac-modern)

;;; org-ac-modern.el ends here
