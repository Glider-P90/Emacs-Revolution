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
;; Last update Thu Apr 23 01:28:32 2026 @author Glider
;; ======================================================================
;;; Code:

;; ================================================================
;; First auto-completion based on user project.
;; ================================================================


;; ================================================================
;; Sewcond auto-completion based PHP then other officials sources
;; ================================================================

(use-package company
    :ensure t
    :config
    (setq company-idle-delay 0.25)
    (setq completion-ignore-case t)
    (global-company-mode t))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  ((php-mode . lsp) (lsp-mode . lsp-enable-which-key-integration))
  (lsp-completion-mode . minad/lsp-mode-setup-completion)
  :init
  (defun minad/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless)) ;; Configure orderless
    (setq-local completion-at-point-functions
                ;; (list (cape-capf-super #'lsp-completion-at-point #'cape-keyword))
                (list (cape-capf-super #'lsp-completion-at-point #'cape-file))
                ))
  :custom
  (setq lsp-completion-provider :none
	lsp-completion-enable t
	lsp-prefer-capf t
	lsp-completion-default-behaviour :insert
	lsp-enable-snippet t
	lsp-prefer-flymake nil
	lsp-dired-mode t
	;;  (setq completion-category-overrides
	;;	'((lsp-capf (style try-completion orderless all-completions doc)))))
	))

(use-package flycheck-phpstan :ensure t :after flycheck)

(with-eval-after-load 'phpstan-hover
  (setopt phpstan-hover-idle-delay 0.5) ;; Show popups more quickly than the default.
  (setopt phpstan-hover-display-backend 'auto) ;; Auto-select from available popup backends.
  (setopt phpstan-hover-message-prefix "🔖 ") ;; Use a shorter emoji prefix instead of "PHPStan: ".
  (setopt phpstan-hover-show-kind-label t)) ;; Set nil to hide syntax labels in popup messages.

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; ================================================================
;; Flycheck PHP Configuration - Checkers personnalisés
;; ================================================================
(setq	flycheck-phpstan-executable "~/.emacs.d/revolution/vendor/bin/phpstan"
	flycheck-php-phpcs-executable "~/.emacs.d/revolution/vendor/bin/phpcs"
	flycheck-phpstan-args '("-c" "phpstan.neon")
	flycheck-php-phpcs-args '("--standard=PSR12"))

(require 'dap-php)
(yas-global-mode)

(define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)

(provide 'er-php-mode)
;;; er-php-mode.el ends here
