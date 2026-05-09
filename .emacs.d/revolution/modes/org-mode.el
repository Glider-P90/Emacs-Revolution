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
;; org-mode.el for lugtech in ~/.emacs.d/revolution/modes/
;; @description: org-mode
;; 
;; Started on  Tue Jan 30 03:12:24 2024 @author Glider
;; Last update Thu Apr 23 01:03:53 2026 @author Glider
;; ======================================================================
;;; Code:

;; ===============================
;; Installation
;; ===============================

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

;; ===============================
;; Initialisation
;; ===============================

(setq org-provide-todo-statistics t
      org-hierarchical-todo-statistics t
      org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-log-done 'time
;;      org-startup-indented t
  ;;    org-startup-truncated nil;; wrap around
      org-log-into-drawer t)

;; Do not ask for confirmation when evaluation a block
(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (lisp . t)
   (shell . t)
   (sed . t)
   (awk . t)
   (python . t)
   (R . t)
   (sqlite . t)
   (lilypond . t)
   (scheme . t)
   ))

(setq org-todo-keywords
      '(
	(sequence "TODO" "DRAFT" "PROJECT" "SUBJECT" "|" "DONE(d!)" "DELEGATED" "CLOSED" "CLOSES" "CLOSE" "FIX" "FIXES" "FIXED" "RESOLVE" "RESOLVES" "RESOLVED" "PENDING" "BLOCKED" "PAUSED" "TESTING" "VALIDATION" "INACTIVE" "ACTIVE" "WAITING" "HOLDING" "REJECTED" "REOPENED" "FIXED" "MERGED" "DEPLOYED" "STANDBY" "MONITORED" "OBSOLETE" "RETIRED" "LOCKED" "UNLOCKED" "AT-RISK" "ONHOLD" "READY" "NA" "NOT-APPLICABLE")
	(sequence "FEEDBACK" "VERIFY" "TESTING" "|" "CHECKED" "CHECK" "CLOSED" "CLOSES" "CLOSE" "PENDING" "TESTED" "VALIDATE" "INACTIVE" "ACTIVE" "WAITING" "HOLDING" "REJECTED" "MONITORED" "OBSOLETE" "RETIRED" "LOCKED" "UNLOCKED" "AT-RISK" "ONHOLD" "NA" "NOT-APPLICABLE")
	(sequence "MONITOR" "|" "ENABLE" "DISABLE" "VALIDATE" "INACTIVE" "ACTIVE" "WAITING" "HOLDING" "REJECTED" "MONITORED" "OBSOLETE" "RETIRED" "LOCKED" "UNLOCKED" "AT-RISK" "ONHOLD" "NA" "NOT-APPLICABLE")
        (sequence "GIT" "GITHUB" "|" "CLOSED" "CLOSES" "CLOSE" "FIX" "FIXES" "FIXED" "RESOLVE" "RESOLVES" "RESOLVED")
        (sequence "VERSION" "STEP" "REPORT" "BUG" "ISSUE" "|" "DONE" "COMPLETED" "APPROVED" "RESOLVED" "CLOSED" "CANCELLED" "DELETED" "ARCHIVED" "FAILED")
	(type "BLUE" "RED" "GREEN" "GREY" "WHITE" "BLACK" "YELLOW" "ORANGE" "PURPLE" "|" "DONE(d!)" "DELEGATED" "CHECKED" "CHECK" "CLOSED" "CLOSES" "CLOSE" "FIX" "FIXES" "FIXED" "RESOLVE" "RESOLVES" "RESOLVED" "PENDING" "BLOCKED" "PAUSED" "TESTING" "VALIDATION" "INACTIVE" "ACTIVE" "WAITING" "HOLDING" "REJECTED" "REOPENED" "FIXED" "MERGED" "DEPLOYED" "STANDBY" "MONITORED" "OBSOLETE" "RETIRED" "LOCKED" "UNLOCKED" "AT-RISK" "ONHOLD" "READY")))

(setq org-todo-keyword-faces
      '(("MONITORING" . "orange") ("PENDING" . "orange") ("WAITING" . "orange") ("HOLDING" . "orange") ("ONHOLD" . "orange") ("TESTING" . "orange") ("PAUSED" . "orange")
	("BLOCKED" . "red") ("INACTIVE" . "red") ("REJECTED" . "red") ("OBSOLETE" . (:foreground "brown" :distant-foreground "grey")) ("RETIRED" . (:foreground "brown" :distant-foreground "grey")) ("LOCKED" . (:foreground "brown" :distant-foreground "grey"))
        ("CANCELED" . (:foreground "red" :weight bold))))


;; ===============================
;; Operations
;; ===============================

(defun org-manual ()
  "Ouvre la documentation officielle Org dans Info."
  (interactive)
  (info "(org)"))

(use-package lsp-mode
  :ensure t
  :after eglot
  :commands lsp
  :hook ((emacs-lisp . lsp) (lisp . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-snippet t)
  (setq lsp-prefer-flymake t))


(defcustom org-side-tree-status t
  "State of org-side-tree if enable or disable."
  :type 'boolean
  :group 'emacs-revolution)

(use-package org-side-tree
  :ensure t
  :init
  (when org-side-tree-status
    (org-side-tree)))

(resize-side-window "<Tree>" 22)

(defun org-side-tree-toggle-usable ()
  "Toggle the usabillity of org-side-tree, not just toggle display."
  (interactive)
  (org-side-tree-toggle)
  (if org-side-tree-status
      (progn
	(setq org-side-tree-status nil)
	(setq org-side-tree-enable-folding nil))
    (progn
      (setq org-side-tree-status t)
      (setq org-side-tree-enable-folding t)))
  )

(defun org-side-tree-toggle-then-resize ()
  "Org side tree toggle then resize."
  (interactive)
  (org-side-tree-toggle)
  (resize-side-window "<Tree>" 22))

;; =============================================
;; Alternative 1: Use the basic completion style
;; =============================================

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

;; ********        WARNING        ********
;; Script need to stay a end of file
;; ********         BEGIN         ********

(defun update-major-mode-in-org-file ()
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
                (setq er-mode-found
                      (car (split-string (substring line (match-end 0)) "[ \t\n]+")))
                (when (and er-mode-found
                           (not (string= (symbol-name major-mode)
                                         (concat er-mode-found "-mode"))))
                  (funcall (intern (concat er-mode-found "-mode"))))
                (throw 'found t))
               ((string-match end-key line)
                (unless (string= (symbol-name major-mode) (symbol-name er-major-mode-origin))
                  (funcall (intern (symbol-name er-major-mode-origin)))
                  (let ((file (concat lang-settings-dir (symbol-name er-major-mode-origin) ".el")))
                    (if (file-exists-p file)
                        (load-file file)
                      (message "⚠ Fichier de configuration %s introuvable !" file)))
                  (setq er-mode-found nil))
                (throw 'found nil))))))))))


(defun update-major-mode-in-org-file-reload ()
  "Reset mode after saving."
  (if (and (eq er-mode-found t) (not (string= "org-mode" major-mode)))
      (setq er-mode-found nil)))

(add-hook 'post-command-hook #'update-major-mode-in-org-file)
(add-hook 'after-save-hook #'update-major-mode-in-org-file-reload)
(add-hook 'org-mode 'visual-line-mode)

(use-package org-present :ensure t)

(unless (package-installed-p 'visual-fill-column)
  (package-install 'visual-fill-column))

(setq visual-fill-column-width 110
      visual-fill-column-center-text t)

(global-set-key (kbd "<f7>") #'org-side-tree-toggle-then-resize)
(global-set-key (kbd "<f6>") 'org-manual)
(global-set-key (kbd "<f5>") 'org-present)

;; ********        WARNING        ********
;; Script need to stay a end of file
;; ********          END          ********


(provide 'org-mode)
;;; org-mode.el ends here
