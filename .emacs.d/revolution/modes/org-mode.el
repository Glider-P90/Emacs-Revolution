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
;; Last update Sat Jan 31 13:02:50 2026 @author Glider
;; ======================================================================
;;; Code:

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(defvar er-org-tree-display t
  "Permet de verifier si le tree de org est affiché.")

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

;; Alternative 1: Use the basic completion style
(setq org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps t)

(advice-add #'org-olpath-completing-read :around #'vertico-enforce-basic-completion)

(defun vertico-enforce-basic-completion (&rest args)
  (minibuffer-with-setup-hook
      (:append
       (lambda ()
         (let ((map (make-sparse-keymap)))
           (define-key map [tab] #'minibuffer-complete)
           (use-local-map (make-composed-keymap (list map) (current-local-map))))
         (setq-local completion-styles (cons 'basic completion-styles)
                     vertico-preselect 'prompt)))
    (apply args)))

(add-hook 'completion-at-point-functions #'cape-elisp-block 10 t)

(use-package org-side-tree
  :ensure t
  :init
  (org-side-tree))

(defun er-list-side-windows (&optional frame)
  "Retourne la liste des side windows actives."
  (seq-filter
   (lambda (win)
     (window-parameter win 'window-side))
   (window-list frame 'no-minibuffer)))


(defun resize-side-window (window width)
  "Resize width of any side window."
  (unless (stringp window)
    (error "WINDOW must be a string"))
  (unless (integerp width)
    (error "WIDTH must be an integer"))
  (dolist (win (er-list-side-windows))
    (when (string-match window (buffer-name (window-buffer win)))
        (let ((delta (- width (window-width win))))
	(window-resize win delta t)))))

(resize-side-window "<Tree>" 22)

(defun org-side-tree-toggle-then-resize ()
  "Org side tree toggle then resize."
  (interactive)
  (org-side-tree-toggle)
  (resize-side-window "<Tree>" 22))

(global-set-key (kbd "<f7>") #'org-side-tree-toggle-then-resize)
(global-set-key (kbd "C-c o") 'org-manual)

(provide 'org-mode)
;;; org-mode.el ends here
