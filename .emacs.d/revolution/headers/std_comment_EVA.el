
(global-set-key	(kbd "C-c C-t") 'do_insert_time)
;(global-set-key (kbd "C-c C-u") 'update-std-header)
(global-set-key (kbd "C-c C-h") 'std-file-header)

(setq header-part	"---------------------- Copyright notice ---------------------------"
      header-copyright  "This source code is part of the EVASoft project"
      header-made-by	"AKKA Technology"
      header-separator	"It is property of Alain Boute Ingenierie - www.abing.fr and is"
      header-licence0	"distributed under the GNU Public Licence version 2"
      header-licence1	"Commercial use is submited to licencing - contact eva@abing.fr"
      header-licence2	"-------------------------------------------------------------------"
      header-licence3	"       File : "
      header-licence4	""
      header-licence5	""
      header-login	"Login   "
      header-login-beg	"<"
      header-login-mid	"@"
      header-login-end	">"
      header-started	"Started on  "
      header-last	"Last update "
      header-for	" for "
      header-in		" in "
      domaine-name	"pierre.schebath@akka.eu"
      user-nickname	"@author schebath_p")

(setq write-file-hooks (cons 'update-std-header write-file-hooks))

(setq std-modes-alist '(("C"                    (begin . "/*********************************************************************") (mid . "** ") (end . "*********************************************************************/"))
			("C/l"                  (begin . "/**") (mid . " * ") (end . "**/"))
                        ("CSS"                  (begin . "/**") (mid . " * ") (end . " */"))
                        ("PoV"                  (begin . "// ") (mid . "// ") (end . " //"))
                        ("C++"                  (begin . "/**") (mid . " * ") (end . "**/"))
                        ("c++"                  (begin . "/**") (mid . " * ") (end . "**/"))
                        ("C++//l"               (begin . "/**") (mid . " * ") (end . "**/"))
                        ("Lisp"                 (begin . ";; ") (mid . ";; ") (end . ";;"))
                        ("Lisp Interaction"     (begin . ";; ") (mid . ";; ") (end . ";;"))
                        ("Emacs-Lisp"           (begin . ";; ") (mid . ";; ") (end . ";;"))
                        ("Fundamental"          (begin . "## ") (mid . "## ") (end . "##"))
                        ("Shell-script"         (begin . "#!/bin/bash")  (mid . "## ") (end . "##"))
                        ("Makefile.rvm"         (begin . "## ") (mid . "## ") (end . "## "))
                        ("Makefile"             (begin . "## ") (mid . "## ") (end . "## "))
                        ("BSDmakefile"          (begin . "## ") (mid . "## ") (end . "## "))
                        ("GNUmakefile"          (begin . "## ") (mid . "## ") (end . "## "))
                        ("Perl"                 (begin . "#!/usr/local/bin/perl -w")
			 (mid . "## ")(end . "##"))
                        ("CPerl"                (begin . "#!/usr/local/bin/perl -w")
			 (mid . "## ") (end . "##"))
                        ("xdefault"             (begin . "!! ") (mid . "!!") (end . "!! "))
                        ("java"                 (begin . "/**") (mid . "//") (end . "**/"))
			("JavaScript"           (begin . "/**") (mid . "//") (end . "**/"))
                        ("latex"                (begin . "%% ") (mid . "%%") (end . " %%"))
                        ("Pascal"               (begin . "{  ") (mid . "  ") (end . "}  "))
                        ("Text"                 (begin . "## ") (mid . "##") (end . "## "))
                        ("HTML"                 (begin . "<!--") (mid . "  -- ") (end . "-->"))
			("PHP/l"		(begin . "<?php") (mid . "///! ") (end . "?>"))
                        ("Nroff"                (begin . "\\\"") (mid . "\\\" ") (end . "\\\""))))



(defun std-get (a)
  (interactive)
  (setq ext (cdr (assoc mode-name  std-modes-alist)))
  (format "%s" (cdr (assoc a ext)))
  )


(insert (std-get 'begin))
(defun update-std-header ()
  "Updates std header with last modification time & owner.\n(According to mode)"
  (interactive)
  (save-excursion
    (if (buffer-modified-p)
        (progn
          (goto-char (point-min))
          (if (search-forward header-last nil t)
              (progn
               (delete-region (point-at-bol) (point-at-eol))
                (delete-region
                 (progn (beginning-of-line) (point))
                 (progn (end-of-line) (point)))
                (insert (concat (std-get 'mid)
				header-last
				(current-time-string)
				" "
				user-nickname))
                (message "Last modification header field updated."))))))
  nil)


(defun std-file-header ()
  "Puts a standard header at the beginning of the file.\n(According to mode)"
  (interactive)
  (goto-char (point-min))
  (let ((projname "unknow")(location "unknow"))
    (setq projname (read-from-minibuffer
		    (format "Type project name (RETURN to quit) : ")))
    (setq location default-directory)
;    (setq location (replace-regexp-in-string "/home/schebath/Documents/rvm/dev" " " location))
    (insert (std-get 'begin))
    (newline)
    (insert (concat (std-get 'mid)
			   header-part))
    (newline)
    (insert (concat (std-get 'mid)
		    header-copyright
		    header-made-by))
    (newline)
    (insert (concat (std-get 'mid )
		    header-separator))
    (newline)
    (insert (concat (std-get 'mid)
		    header-licence0))
    (newline)
    (insert (std-get 'mid))
    (newline)
    (insert (concat (std-get 'mid)
		    header-licence1))
    (newline)
    (insert (concat (std-get 'mid)
		    header-licence2))
    (newline)
    (insert (concat (std-get 'mid)
		    header-licence3))
    (newline)
    (insert (concat (std-get 'mid)
			   header-licence4))
    (newline)
    (insert (concat (std-get 'mid)
		    header-licence5))
    (newline)
    (insert (concat (std-get 'mid)
		    header-part))
    (newline)
    (insert (concat (std-get 'mid)
		    (buffer-name)
		    header-for
		    projname
		    header-in
		    location))
    (newline)
    (insert (concat (std-get 'mid)
		    header-made-by))
    (newline)
    (insert (std-get 'mid))
    (newline)
    (insert (concat (std-get 'mid)
		    header-started
		    (current-time-string)
		    " "
		    user-nickname))
    (newline)
    (insert (concat (std-get 'mid)
		    header-last
		    (current-time-string)
		    " "
		    user-nickname))
    (newline)
    (insert (concat (std-get 'mid)
		    header-part))
    (newline)
    (insert (std-get 'end))
    (newline)
    )
  )

(defun insert-std-vertical-comments ()
  "Inserts vertical comments (according to mode)."
  (interactive)
  (beginning-of-line)
  (insert (std-get 'begin))
  (newline)
  (let ((ok t)(comment ""))
    (while ok
      (setq comment (read-from-minibuffer
		     (format "Type comment (RETURN to quit) : ")))
      (if (= 0 (length comment))
	  (setq ok nil)
	(progn
	  (insert (concat (std-get 'mid) comment))
	  (newline)))))
  (insert (std-get 'end))
  (newline))

(defun std-toggle-comment ()
  "Toggles line comment on or off (according to mode)."
  (interactive)
  (save-excursion
    (let (beg end)
      (beginning-of-line)
      (setq beg (point))
      (end-of-line)
      (setq end (point))
      (save-restriction
	(if (not (equal beg end))
	    (progn
	      (narrow-to-region beg end)
	      (goto-char beg)
	      (if (search-forward (std-get 'begin) end t)
		  (progn
		    (beginning-of-line)
		    (replace-string (std-get 'begin) "")
		    (replace-string (std-get 'end) ""))
		(progn
		  (beginning-of-line)
		  (insert (std-get 'begin))
		  (end-of-line)
		  (insert (std-get 'end))))))))) 
  ;;  (indent-according-to-mode)
  (indent-for-tab-command)
  (next-line 1))

;;;; Generating local keymaps for exotics modes.

;;; In CPerl mode, C-c C-h is used to do some help.
;;; so it is C-c C-h h
;;; For working, it requires info pages about perl
(add-hook 'cperl-mode-hook
	  '(lambda ()
	     (define-key cperl-mode-map ""
	       'comment-region)
	     (define-key cperl-mode-map "h"
	       'std-file-header)))

;; for perl-mode
(add-hook 'perl-mode-hook
	  '(lambda ()
	     (define-key perl-mode-map ""
	       'comment-region)))

;; for all kind of lisp code
(add-hook 'emacs-lisp-mode-hook
 	  '(lambda ()
 	     (define-key emacs-lisp-mode-map  ""
 	       'comment-region)))

(add-hook 'lisp-mode-hook
 	  '(lambda ()
 	     (define-key lisp-mode-map  ""
 	       'comment-region)))



;; for La(TeX)-mode
(add-hook 'tex-mode-hook
	  '(lambda ()
	     (define-key tex-mode-map ""
	       'comment-region)))
