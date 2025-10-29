;;; org-mode.el --- -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;; ======================================================================
;; @license Copyright 2016-2024 Pierre Schebath
;; ---------------------
;; 
;; @brief This file has been written by Pierre Etienne Charles Schebath Cazoulat.
;; 
;; This source code, its related data and algorithms are Pierre Schebath
;; Proprietary Informatichaon and shall be protected in strict confidence by
;; the party who receives it.  It shall not be disclosed nor copied nor
;; duplicated in whole or in part to any third party without Pierre Schebath
;; written prior permission.
;; ======================================================================
;; org-mode.el for lugtech in ~/.emacs.d/config/
;; @description: org-mode
;; 
;; Started on  Tue Jan 30 03:12:24 2024 @author Glider
;; Last update Wed Oct 29 08:19:07 2025 @author Glider
;; ======================================================================
;;; Code:

(message "Org-mode setting...")

(use-package company-org-block
  :ensure t
  :custom
  (company-org-block-edit-style 'auto)
  :hook ((org-mode . (lambda ()
                       (setq-local company-backends '(company-org-block))
                       (company-mode +1)))))

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(defun emacs-revolution-org-installed-p ()
  "Vérifie si le paquet Debian/Ubuntu org mode est installé."
  (eq 0
      (call-process "dpkg-query" nil nil nil "-W" "-f=${Status}" "org-mode-doc")))

(defun emacs-revolution-check-org ()
  "Installe le paquet org mode si non installé."
  (interactive)
  (unless (emacs-revolution-org-installed-p)
    (if (yes-or-no-p "Install org mode ?")
        (progn
          (async-shell-command "sudo apt install -y org-mode org-mode-doc")
          (message "Installation en cours..."))
      (message "Installation annulée ❌"))))

(emacs-revolution-check-org)

(defun emacs-revolution-open-org-manual ()
  "Ouvre la documentation officielle Org dans Info."
  (interactive)
  (info "(org)"))

(global-set-key (kbd "C-c o") 'emacs-revolution-open-org-manual)

(defvar mode-found nil
  "The variable mode-found permet de signaler un changement de mode.")

(defvar mode-src nil
  "The variable mode-src permet de reprendre le mode d'origine.")

(defun update-major-mode ()
  "Set major mode according to the lang block above point."
  (let ((begin-key "^#\\+BEGIN_SRC[ \t]+")
        (end-key "^#\\+END_SRC")
        mode)
    (save-excursion
      (catch 'found
        (while (> (point) (point-min))
          (forward-line -1)
          (let ((line (thing-at-point 'line t)))
            (cond
             ((string-match begin-key line)
              (setq mode (car (split-string (substring line (match-end 0)) "[ \t\n]+")))
              (if (eq mode-found t)
                  (message "already in %s" mode)
                (progn
                  (message "switching to %s" mode)
		  (setq mode-src major-mode)
                  (funcall (intern (concat mode "-mode")))
                  (setq mode-found t)))
              (throw 'found t))
             ((string-match end-key line)
              (message "In org-mode")
              (funcall (intern (symbol-name mode-src)))
              (setq mode-found nil)
              (throw 'found nil)))))))))

(add-hook 'post-command-hook #'update-major-mode)

(provide 'org-mode)
;;; org-mode.el ends here
