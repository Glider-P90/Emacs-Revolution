;;;  --- -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
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
;; er-php-mode.el for Emacs-revolution in ~/.emacs.d/revolution/modes/
;; @description: php config file.
;; 
;; Started on  Sun Feb  1 22:55:08 2026 @author Glider
;; Last update Fri Apr 10 09:00:13 2026 @author Glider
;; ======================================================================
;;; Code:

(defvar er-phpactor-exist nil
  "Permet de savoir si phpactor est installé.")

(use-package php-mode :ensure t)
(use-package composer :ensure t)



(defun emacs-revolution-install-phpactor ()
  "Clone phpactor, installe les dépendances via Composer et crée le lien symbolique."
  (interactive)
  (let ((default-directory (expand-file-name "modes/php/" emacs-revolution-dir)))
    (shell-command "git clone https://github.com/phpactor/phpactor.git")
    (let ((default-directory (expand-file-name "phpactor/" default-directory)))
      (composer-install)
      (shell-command (concat "sudo ln -s " default-directory " /usr/local/bin/phpactor")))))


(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  ((php-lisp . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-enable-snippet t)
  (setq lsp-prefer-flymake t)
  :init
  (setq lsp-dired-mode t)
  (setq lsp-keymap-prefix "C-c l"))

(use-package flycheck-php-noverify
  :ensure t
  :config
  (progn
    (flycheck-php-noverify-setup)))
;; Excluded checks. 
;; default: '("undefinedConstant" "undefinedClass" "undefinedFunction" 
;;            "undefinedMethod" "undefinedProperty" "undefinedTrait")
(add-to-list 'flycheck-php-noverify-exclude-checks "constCase")

;; Allowed checks. default: nil
(setq flycheck-php-noverify-allow-checks '("unused"))

;; Analyze as PHP 7. default: nil
(setq flycheck-php-noverify-php7 t)

;; additional 'noverify' args
(setq flycheck-php-noverify-args '("--cores" "4"))

(provide 'er-php-mode)
;;; er-php-mode.el ends here
