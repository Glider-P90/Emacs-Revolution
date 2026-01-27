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
;; Last update Tue Jan 27 06:07:57 2026 @author Glider
;; ======================================================================
;;; Code:

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

(defun org-manual ()
  "Ouvre la documentation officielle Org dans Info."
  (interactive)
  (info "(org)"))

(global-set-key (kbd "C-c o") 'org-manual)

(defvar mode-found nil
  "The variable mode-found permet de signaler un changement de mode.")

(defvar mode-src (symbol-name major-mode)
  "The variable mode-src permet de reprendre le mode d'origine.")

(defun update-major-mode ()
  "Set major mode according to the lang block above point."
  (let ((begin-key "^#\\+BEGIN_SRC[ \t]+")
        (end-key "^#\\+END_SRC"))
    (save-excursion
      (catch 'found
        (while (> (point) (point-min))
          (forward-line -1)
          (let ((line (thing-at-point 'line t)))
            (when (stringp line)
              (cond
               ((string-match begin-key line)
                (setq mode-found
                      (car (split-string (substring line (match-end 0)) "[ \t\n]+")))
                (when (and mode-found
                           (not (string= (symbol-name major-mode)
                                         (concat mode-found "-mode"))))
                  (funcall (intern (concat mode-found "-mode"))))
                (throw 'found t))
               ((string-match end-key line)
                (unless (string= (symbol-name major-mode) mode-src)
                  (funcall (intern mode-src))
                  (let ((file (concat lang-settings-dir mode-src ".el")))
                    (if (file-exists-p file)
                        (load-file file)
                      (message "⚠ Fichier de configuration %s introuvable !" file)))
                  (setq mode-found nil))
                (throw 'found nil))))))))))


(defun update-major-mode-reload ()
  "Reset mode after saving."
  (if (and (eq mode-found t) (not (string= "org-mode" major-mode)))
      (setq mode-found nil)))


(add-hook 'post-command-hook #'update-major-mode)
(add-hook 'after-save-hook #'update-major-mode-reload)

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((org . lsp) (emacs-lisp . lsp) (lisp . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snippet t)
  (setq lsp-prefer-flymake t))

(provide 'org-mode)
;;; org-mode.el ends here
