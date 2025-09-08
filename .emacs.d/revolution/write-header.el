(add-to-list 'load-path "~/.emacs.d/revolution/headers/")
(require 'std_comment)

(defun std-get (position)
  "Function std-get takes POSITION to get comment delimiter (begin, mid, or end)."
  (let* ((mode-name (symbol-name major-mode))
	  (mode-entry (assoc mode-name std-modes-alist)))
    (if mode-entry
      (cdr (assoc position (cdr mode-entry)))
      nil)))

(defun update-std-header ()
  "Function updates-std-header update time & owner to header."
  (interactive)
  (message "updated mode[" buffer-name "].")
  (when (not (equal (buffer-name) "std_comment.el"))
    (save-excursion
      (when (buffer-modified-p)
	(goto-char (point-min))
	  (delete-region (line-beginning-position) (line-end-position))
	  (delete-region (progn (beginning-of-line) (point))
	    (progn (end-of-line) (point)))
	  (insert (concat (std-get 'mid) header-last (current-time-string) " " user-nickname))
	  (message "Last modification header field updated."))))
  nil)

(defun std-file-header ()
  "Function std-file-header insert a header, according to mode."
  (interactive)
  (goto-char (point-min))
  (let ((projname (read-from-minibuffer "Type project name (RETURN to quit): "))
	 (projdescription (read-from-minibuffer "Type short file description (RETURN to quit): "))
	 (location default-directory))
    (insert (concat (std-get 'begin) "\n"
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
	      (std-get 'mid) header-desc projdescription "\n"
	      (std-get 'mid) "\n"
	      (std-get 'mid) header-started (current-time-string) " " user-nickname "\n"
	      (std-get 'mid) header-last (current-time-string) " " user-nickname "\n"
	      (std-get 'mid) header-part "\n"
	      (std-get 'end) "\n"))))

(setq write-file-functions (cons 'update-std-header write-file-functions))

(provide 'write-header)
