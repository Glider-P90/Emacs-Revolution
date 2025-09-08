;;; package --- Summary
;;; Commentary:
;; ======================================================================
;; @license Copyright 2016-2025 Pierre Schebath
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
;; gendocs.el for revolution in ~/.emacs.d/revolution/
;; @description: Permet de generer de la documentation a partir du code.
;; 
;; Started on  Mon Jun  2 08:44:33 2025 @author Glider
;; Last update Mon Jun  2 08:45:22 2025 @author Glider
;; ======================================================================
;;; Code:

(defun insert-or-update-function-doc ()
  "Ajoute ou met à jour un bloc de documentation JSDoc-like au-dessus d'une fonction JavaScript."
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (while (> (point) (point-min))
      (beginning-of-line)

      ;; Si on trouve "function" dans la ligne ET qu'aucun bloc doc ne précède
      (when (and (search-forward "function" (line-end-position) t)
                 (not (save-excursion
                        (forward-line -1)
                        (looking-at-p "\\s-*\\/\\*\\*"))))

        ;; Extraire le nom de la fonction et ses arguments
        (save-excursion
          (defvar function-name "")
          (defvar args-list nil)
          (skip-chars-forward " \t")
          (setq start (point))
          (if (search-forward "(" (line-end-position) t)
              (progn
                (backward-char)
                (setq function-name (string-trim (buffer-substring-no-properties start (point))))
                (let ((args-start (point))
                      (args-end (re-search-forward ")" nil t)))
                  (setq args-list (split-string
                                   (buffer-substring-no-properties (1+ args-start) (1- args-end))
                                   "," t "[[:space:]\n]*")))

                ;; Insertion du bloc de documentation
                (forward-line -1)
                (newline)
                (insert "/**")
                (newline)
                (insert " * @desc ")
                (dolist (arg args-list)
                  (newline)
                  (insert (format " * @param %s" (string-trim arg))))
                (newline)
                (insert " * @return ")
                (newline)
                (insert " */"))))))

      (forward-line -1))
    (indent-region (point-min) (point-max))))


(provide 'gendocs.el)
;;; gendocs.el ends here
