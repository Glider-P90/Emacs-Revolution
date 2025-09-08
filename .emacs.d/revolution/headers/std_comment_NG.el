;;
;; std_comment.el for emacs in /home/glider/.emacs.d
;; 
;; Made by glider
;; Login   <glider@Pierre Schebath>
;; 
;; Started on  Tue Nov  6 14:13:41 2018 glider
;; Last update Thu May 28 06:14:20 2020 @author pschebat
;;

(global-set-key	(kbd "C-c C-t") 'do_insert_time)
(global-set-key (kbd "C-c C-u") 'update-std-header)
(global-set-key (kbd "C-c C-h") 'std-file-header)

(setq header-part	"======================================================================"
      header-copyright	"@license Copyright 2016-2019"
      header-made-by	"Naval Group"
      header-separator	"---------------------"
      header-licence0	"@brief This file has been written by Pierre Schebath at Naval Group"
      header-licence1	"This source code, its related data and algorithms are Naval Group"
      header-licence2	"Proprietary Information and shall be protected in strict confidence by"
      header-licence3	"the party who receives it. It shall not be disclosed nor copied nor"
      header-licence4	"duplicated in whole or in part to any third party without Naval Group"
      header-licence5	"written prior permission."
      header-login	"Login   "
      header-login-beg	"<"
      header-login-mid	"@"
      header-login-end	">"
      header-started	"Started on  "
      header-last	"Last update "
      header-for	" for "
      header-in		" in "
      domaine-name	"pschebath.exterieur@naval-group.com"
      user-nickname	"@author pschebat")


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
                        ("Perl"                 (begin . "#!/usr/local/bin/perl -w") (mid . "## ")(end . "##"))
                        ("CPerl"                (begin . "#!/usr/local/bin/perl -w") (mid . "## ") (end . "##"))
                        ("xdefault"             (begin . "!! ") (mid . "!!") (end . "!! "))
                        ("java"                 (begin . "/**") (mid . "//") (end . "**/"))
			("JavaScript"           (begin . "/**") (mid . "//") (end . "**/"))
                        ("latex"                (begin . "%% ") (mid . "%%") (end . " %%"))
                        ("Pascal"               (begin . "{  ") (mid . "  ") (end . "}  "))
                        ("Text"                 (begin . "## ") (mid . "##") (end . "## "))
                        ("HTML"                 (begin . "<!--") (mid . "## ") (end . "-->"))
			("PHP/l"		(begin . "<!--") (mid . "## ") (end . "-->"))
                        ("Nroff"                (begin . "\\\"") (mid . "\\\" ") (end . "\\\""))))


(defun std-get (a)
  (interactive)
  (if 
  	mode-name
  	(setq mode-name "HTML"))  	
  (setq ext (cdr (assoc mode-name  std-modes-alist)))
  (format "%s" (cdr (assoc a ext))))

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
                (insert (concat (std-get 'mid) header-last (current-time-string) " " user-nickname)) (message "Last modification header field updated.")))))) nil)


(defun std-file-header ()
  "Puts a standard header at the beginning of the file.\n(According to mode)"
  (interactive)
  (goto-char (point-min))
  (let ((projname "unknow")(location "unknow"))
    (setq projname (read-from-minibuffer
		    (format "Type project name (RETURN to quit) : ")))
    (setq location default-directory)
    (insert (std-get 'begin))
    (newline)
    (insert (concat (std-get 'mid) header-part))
    (newline)
    (insert (concat (std-get 'mid) header-copyright header-made-by))
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
