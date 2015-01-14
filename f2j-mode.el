;;; f2j-mode --- An F2J editing mode

;; Copyright (C) 2015 Zhiyuan Shi

;; Author: 2015 Zhiyuan Shi
;; URL: https://github.com/zhiyuanshi/f2j-mode

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

;; All functions/variables start with `f2j-'.

;; http://www.emacswiki.org/emacs/RegularExpression
(defconst f2j-font-lock-defaults
  '(
    ("\\<\\(let\\|type\\|module\\|end\\)\\>" . font-lock-keyword-face)
    ("\\<\\([[:upper:]][[:alnum:]_]*\\)\\>" . font-lock-type-face)
    ("=\\|:\\|->" . font-lock-function-name-face)
    ("^[ \t]*--.*" . font-lock-comment-face)
    ))

;; syntax table
(defvar f2j-mode-syntax-table nil "Syntax table for `f2j-mode'.")

(setq f2j-mode-syntax-table
      (let ((synTable (make-syntax-table)))

        ;; comment style: "-- ..."
        (modify-syntax-entry ?- ". 12b" synTable)
        (modify-syntax-entry ?\n "> b" synTable)

        synTable))

(defun f2j-comment-dwim (arg)
  "Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
  (interactive "*P")
  (require 'newcomment)
  (let (
        (comment-start "--") (comment-end "")
        )
    (comment-dwim arg)))

(defvar f2j-mode-map
  (let ((map (make-keymap)))
    (define-key map [remap comment-dwim] 'f2j-comment-dwim)
    map)
  "Keymap for f2j major mode")

(define-derived-mode f2j-mode prog-mode
  "f2j-mode is a major mode for editing f2j source code."
  (set-syntax-table f2j-mode-syntax-table)
  (use-local-map f2j-mode-map)
  (setq font-lock-defaults '(f2j-font-lock-defaults))
  (setq mode-name "F2J"))


;;;###autoload
(add-to-list 'auto-mode-alist '("\\.sf\\'" . f2j-mode))

(provide 'f2j-mode)

;;; f2j-mode.el ends here
