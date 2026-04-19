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
;; Last update Sun Apr 19 18:10:43 2026 @author Glider
;; ======================================================================
;;; Code:

;; ================================================================
;; First auto-completion based on user project.
;; ================================================================

(auto-complete-mode t)
(use-package ac-php
  :ensure t
  :config
  (setq ac-sources '(ac-source-php)))

;; ================================================================
;; Sewcond auto-completion based PHP then other officials sources
;; ================================================================

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  ((php-mode . lsp) (lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-completion-provider :none
	lsp-completion-enable t
	lsp-completion-default-behaviour :insert
	lsp-enable-snippet t
	lsp-prefer-flymake t
	lsp-dired-mode nil
	lsp-keymap-prefix "C-c l"))

(setq completion-category-overrides
      '((lsp-capf (style try-completion orderless all-completions doc))))

(use-package flycheck-phpstan :ensure t)

(defun my-php-mode-setup ()
  "My PHP-mode hook."
  (require 'flycheck-phpstan)
  (flycheck-mode t))

(add-hook 'php-mode-hook 'my-php-mode-setup)
(with-eval-after-load 'phpstan-hover
  (setopt phpstan-hover-idle-delay 0.5) ;; Show popups more quickly than the default.
  (setopt phpstan-hover-display-backend 'auto) ;; Auto-select from available popup backends.
  (setopt phpstan-hover-message-prefix "🔖 ") ;; Use a shorter emoji prefix instead of "PHPStan: ".
  (setopt phpstan-hover-show-kind-label t)) ;; Set nil to hide syntax labels in popup messages.

;; ================================================================
;; Flycheck PHP Configuration - Checkers personnalisés
;; ================================================================
(use-package flycheck
  :ensure t
  :after php-mode
  :config
  (setq	flycheck-phpstan-executable "~/.emacs.d/revolution/vendor/bin/phpstan"
	flycheck-php-phpcs-executable "~/.emacs.d/revolution/vendor/bin/phpcs"
	flycheck-phpstan-args '("-c" "phpstan.neon")
	flycheck-php-phpcs-args '("--standard=PSR12"))
  (add-hook 'php-mode-hook
            (lambda ()
              (when (executable-find flycheck-php-phpcs-executable)
                (flycheck-select-checker 'php-phpcs)))))


(provide 'er-php-mode)
;;; er-php-mode.el ends here
