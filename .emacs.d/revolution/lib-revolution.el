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

(org-babel-load-file "~/.emacs.d/revolution/headers/std_comment.org")

(defun std-get (position)
    "Function std-get get string from array."
    (let* ((mode-name (symbol-name major-mode))
	    (mode-entry (assoc mode-name std-modes-alist)))
      (if mode-entry
	(cdr (assoc position (cdr mode-entry)))
	nil)))

  (defun update-std-header ()
    "Function updates-std-header update time & owner to header."
    (interactive)
    (when (not (equal (buffer-name) "std_comment.el"))
      (save-excursion
	(when (buffer-modified-p)
    (let ((limit (point-max)))
    	 (goto-char (point-min))
    	 (when (re-search-forward (regexp-quote header-last) limit t)
        (let ((beg (line-beginning-position))
              (end (line-end-position)))
          (delete-region beg end)
          (goto-char beg)
          (insert (concat (std-get 'mid) header-last (current-time-string) " " user-nickname))
	    (message "Last modification header field updated."))))
    nil))))

  (defun std-file-header ()
    "Function std-file-header insert a header, according to mode."
    (interactive)
    (goto-char (point-min))
    (let ((projname (read-from-minibuffer "Type project name (RETURN to quit): "))
	   (projdescription (read-from-minibuffer "Type short file description (RETURN to quit): "))
	   (location default-directory))
      (insert (concat
	       (string-replace "FILE_NAME_EXT" (buffer-name) (std-get 'begin)) "\n"
	       (std-get 'begin) "\n"
	       (std-get 'mid) header-part "\n"
	       (std-get 'mid) header-copyright
	       (format-time-string "%Y " (current-time)) header-made-by "\n"
	       (std-get 'mid) header-separator "\n"
	       (std-get 'mid) "\n"
	       (std-get 'mid) header-licence0 "\n"
	       (std-get 'mid) "\n"
	       (std-get 'mid) header-licence1 "\n"
	       (std-get 'mid) header-licence2 "\n"
	       (std-get 'mid) header-licence3 "\n"
	       (std-get 'mid) header-licence4 "\n"
	       (std-get 'mid) header-licence5 "\n"
	       (std-get 'mid) header-part "\n"
	       (std-get 'mid) (buffer-name) header-for projname header-in location "\n"
	       (std-get 'mid) header-desc projdescription ".\n"
	       (std-get 'mid) "\n"
	       (std-get 'mid) header-started (current-time-string) " " user-nickname "\n"
	       (std-get 'mid) header-last (current-time-string) " " user-nickname "\n"
	       (std-get 'mid) header-part "\n"
	       (string-replace "FILE_NAME" (file-name-base (buffer-name)) (string-replace "FILE_NAME_EXT" (buffer-name) (std-get 'end)))
	  ))
    ))

  (setq write-file-functions (cons 'update-std-header write-file-functions))

(provide 'lib-revolution)
;;; lib-revolution.el ends here
