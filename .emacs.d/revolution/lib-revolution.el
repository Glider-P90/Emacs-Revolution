;;; lib-revolution.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; lib for Emacs revolution
;;; code:

;;; Permet d'afficher le mode majeur actuel
(defun show-major-mode ()
  "Affiche le mode majeur pendant 5 secondes."
  (interactive)
  (let ((content (format "Mode majeur : %s" major-mode))
        (buffer-name "*Major Mode*"))
    ;; Créer et afficher le buffer
    (with-current-buffer (get-buffer-create buffer-name)
      (erase-buffer)
      (insert content))
    (let ((window (display-buffer buffer-name
  				'((display-buffer-reuse-window
  				   display-buffer-below-selected)
  				  (window-height . 2)))))
      (run-at-time "5 sec" nil #'delete-window window)
      )))

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-dusk)
     (when (display-graphic-p)
       ;; settings for GUI emacs
       (add-to-list 'default-frame-alist '(background-color . "#282B35"))
       (add-to-list 'default-frame-alist '(foreground-color . "White"))
       (set-frame-font "Inconsolata 18" nil t))))

(add-to-list 'load-path "~/.emacs.d/revolution/neotree/")

(use-package neotree
  :bind ([f8] . neotree-toggle)
  :config (setq neo-default-system-application "open"))

;; multiple-cursors
(use-package multiple-cursors
  :bind (("<f2>" . mc/mark-previous-like-this)
	 ("<f3>" . mc/mark-next-like-this)
	 ("C-c <f2>" . mc/mark-all-like-this)
	 ("<ESC> <ESC>" . mc/keyboard-quit))
  :ensure t)

(provide 'lib-revolution)
;;; lib-revolution.el ends here
