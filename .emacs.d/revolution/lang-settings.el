;;; lang-settings.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Set config following the major mode
;;; code:

(defvar mode-associations
  '(("\\.jsx?\\'"       . web-mode)
    ("\\.tsx?\\'"       . web-mode)
    ("\\.[agj]sp\\'"    . web-mode)
    ("\\.as[cp]x\\'"    . web-mode)
    ("\\.erb\\'"        . web-mode)
    ("\\.mustache\\'"   . web-mode)
    ("\\.djhtml\\'"     . html-mode)
    ("\\.html?\\'"      . html-mode)
    ("\\.phtml\\'"      . html-mode)
    ("\\.php\\'"        . php-mode)
    ("\\.js\\'"         . js2-mode)
    ("\\.json\\'"       . json-mode)
    ("\\.yaml\\'"       . yaml-mode)
    ("\\.yml\\'"        . yaml-mode)
    ("\\.conf\\'"       . conf-mode)
    ("\\.cfg\\'"        . conf-mode)
    ("\\.env\\'"        . conf-mode)
    ("\\.gitignore\\'"  . conf-mode)
    ("\\.htaccess\\'"   . conf-mode)
    ("\\.c\\'"          . c-mode)
    ("\\.h\\'"          . c-mode)
    ("\\.cpp\\'"        . c++-mode)
    ("\\.cc\\'"         . c++-mode)
    ("\\.cxx\\'"        . c++-mode)
    ("\\.hpp\\'"        . c++-mode)
    ("\\.glsl\\'"       . glsl-mode)
    ("\\.el\\'"         . emacs-lisp-mode)
    ("\\.lisp\\'"       . lisp-mode)
    ("\\.scm\\'"        . scheme-mode)
    ("\\.css\\'"        . css-mode)
    ("\\.org\\'"        . org-mode)
    ("\\.xml\\'"        . nxml-mode)))

(defun register-auto-modes ()
  "Ajoute les associations une seule fois à `auto-mode-alist`."
  (dolist (entry mode-associations)
    (let ((pattern (car entry))
          (mode    (cdr entry)))
      (add-to-list 'auto-mode-alist (cons pattern mode)))))

(defvar lang-settings-dir
  (expand-file-name "revolution/lang-settings/" user-emacs-directory)
  "Dossier contenant les fichiers de configuration par langage.")

(defun load-lang-settings ()
  "Charge dynamiquement le fichier de configuration associé au major mode courant."
  (when buffer-file-name
    (let* ((mode-symbol major-mode)
           (mode-name (symbol-name mode-symbol))
           (file-mode (expand-file-name (concat mode-name ".el") lang-settings-dir)))
      (if (file-exists-p file-mode)
          (progn
            (load-file file-mode)
            (message " [Emacs Revolution] Charge la configuration %s" mode-symbol))
        (message " [Emacs Revolution] Pas de config pour %s" mode-name)))))


(defun lang-settings-init ()
  "Initialise les réglages de langage pour Emacs Revolution."
  (register-auto-modes)
  (load-lang-settings)
  (add-hook 'after-change-major-mode-hook 'load-lang-settings)
  (add-hook 'after-init-hook #'load-lang-settings)
  )

(lang-settings-init)

(provide 'lang-settings)
;;; lang-settings.el ends here
