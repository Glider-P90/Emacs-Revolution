;;; header comment

(global-set-key   (kbd "C-c C-h") 'std-file-header)
(eval-when-compile
  (defvar header-etna)
  (defvar header-description)
  )

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(setq header-description  "File description:"
      header-part	"======================================================================"
      header-copyright	"@license Copyright 2016-2019 "
      header-made-by	"Pierre Schebath "
      header-separator	"---------------------"
      header-licence0	"@brief This file has been written by Pierre Etienne Charles Schebath Cazoulat."
      header-licence1	"This source code, its related data and algorithms are Pierre SChebath"
      header-licence2	"Proprietary Informatichaon and shall be protected in strict confidence by"
      header-licence3	"the party who receives it. It shall not be disclosed nor copied nor"
      header-licence4	"duplicated in whole or in part to any third party without Pierre Schebath"
      header-licence5	"written prior permission."
      header-description	"Description: "
      header-login	"Login   "
      header-login-beg	"<"
      header-login-mid	"@"
      header-login-end	">"
      header-started	"Started on  "
      header-last	"Last update "
      header-for	" for "
      header-in		" in "
      domaine-name	"pierre.schebath@lilo.org"
      user-nickname	"@author glider")

(defvar std-c-alist           '( (begin . "/*") (mid . "** ") (end . "*/") ))
(defvar std-css-alist         '( (begin . "/*") (mid . "** ") (end . "*/") ))
(defvar std-cpp-alist         '( (begin . "/*") (mid . "** ") (end . "*/") ))
(defvar std-pov-alist         '( (begin . "//") (mid . "// ") (end . "//") ))
(defvar std-java-alist        '( (begin . "//") (mid . "// ") (end . "//") ))
(defvar std-latex-alist       '( (begin . "%%") (mid . "%% ") (end . "%%") ))
(defvar std-lisp-alist        '( (begin . ";;") (mid . ";; ") (end . ";;") ))
(defvar std-xdefault-alist    '( (begin . "!!") (mid . "!! ") (end . "!!") ))
(defvar std-pascal-alist      '( (begin . "{ ") (mid . "   ") (end . "}" ) ))
(defvar std-makefile-alist    '( (begin . "##") (mid . "## ") (end . "##") ))
(defvar std-text-alist        '( (begin . "##") (mid . "## ") (end . "##") ))
(defvar std-fundamental-alist '( (begin . "  ") (mid . "   ") (end . "  ") ))
(defvar std-html-alist        '( (begin . "<!--") (mid . "  -- ") (end . "-->")))
(defvar std-php-alist         '( (begin . "//") (mid . "// ")(end . "//")))
(defvar std-nroff-alist       '( (begin . "\\\"") (mid . "\\\" ") (end . "\\\"")))
(defvar std-sscript-alist     '( (begin . "#!/usr/bin/env bash")  (mid . "## ") (end . "##")))
(defvar std-perl-alist        '( (begin . "#!/usr/local/bin/perl -w")  (mid . "## ")(end . "##")))
(defvar std-cperl-alist       '( (begin . "#!/usr/local/bin/perl -w")  (mid . "## ")(end . "##")))

(defvar std-modes-alist '(
        ("C"                    . std-c-alist)
        ("CSS"                  . std-c-alist)
        ("PoV"                  . std-pov-alist)
        ("C++"                  . std-cpp-alist)
        ("Lisp"                 . std-lisp-alist)
        ("Lisp Interaction"     . std-lisp-alist)
        ("Emacs-Lisp"           . std-lisp-alist)
        ("Fundamental"          . std-fundamental-alist)
        ("Shell-script"         . std-sscript-alist)
        ("Makefile"             . std-makefile-alist)
        ("BSDmakefile"          . std-makefile-alist)
        ("GNUmakefile"          . std-makefile-alist)
        ("Perl"                 . std-cperl-alist)
        ("CPerl"                . std-cperl-alist)
        ("xdefault"             . std-xdefault-alist)
        ("Java"                 . std-java-alist)
        ("latex"                . std-latex-alist)
        ("Pascal"               . stdp-ascal-alist)
        ("Text"                 . std-text-alist)
        ("HTML"                 . std-html-alist)
        ("PHP"                  . std-php-alist)
        ("Nroff"                . std-nroff-alist)
        ("TeX"                  . std-latex-alist)
        ("LaTeX"                . std-latex-alist))
  )

(defun std-get (type)
  "Get the right comment characters for the right mode, TYPE the type of comment.\nComment start (cs), comment middle (cc), comment end (ce)."
  (interactive)
  (cdr (assoc type (eval (cdr (assoc (car (split-string mode-name "/")) std-modes-alist)))))
  )


(defun std-file-header ()
  "Puts an standard header at the beginning of the file.\n(According to mode)."
  (interactive)
  (goto-char (point-min))
  (let ((projlogin "[...]")(projname "[...]")(projdescription "[...]"))
    (if (boundp 'user-nickname)
        (setq projlogin user-nickname)
      (setq projlogin (read-from-minibuffer
                       (format "Type your login (RETURN to quit) : "))))
    (setq projname (read-from-minibuffer
                    (format "Type project name (RETURN to quit) : ")))
    (setq projdescription (read-from-minibuffer
                           (format "Type short file description (RETURN to quit) : ")))
    (if (string= "" user-nickname)
        (setq projlogin "Unknow"))
    (if (string= "" projname)
        (setq projname "Missing"))
    (if (string= "" projdescription)
        (setq projdescription "none"))
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
                    header-description
		            projdescription))
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
