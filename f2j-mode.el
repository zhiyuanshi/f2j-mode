;;; f2j-mode --- An F2J editing mode

;; Copyright (C) 2015 Zhiyuan Shi

;; Package-Requires: ((emacs "24") (quickrun "2.2.1"))

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
    ("\\<\\(import\\|case\\|def\\|let\\|rec\\|and\\|data\\|type\\|module\\|end\\|then\\|else\\|if\\|in\\)\\>" . font-lock-keyword-face)
    ("\\<\\('?[[:upper:]][[:alnum:]_]*\\)\\>" . font-lock-type-face)
    ("=\\|:\\|->" . font-lock-function-name-face)
    ("^[ \t]*--.*" . font-lock-comment-face)
    ))

(defvar f2j-mode-map (make-sparse-keymap)
  "Keymap for f2j major mode.")

;; syntax table
;; some copied from idris-mode.el
(defconst f2j-mode-syntax-table
  (let ((st (make-syntax-table)))

    ;; Matching parens
    (modify-syntax-entry ?\( "()" st)
    (modify-syntax-entry ?\) ")(" st)
    (modify-syntax-entry ?\[ "(]" st)
    (modify-syntax-entry ?\] ")[" st)

    ;; comment style: "-- ..."
    (modify-syntax-entry ?- ". 12b" st)
    (modify-syntax-entry ?\n "> b" st)

    ;; ' and _ can be names
    (modify-syntax-entry ?' "w" st)
    (modify-syntax-entry ?_ "w" st)

    ;; Whitespace is whitespace
    (modify-syntax-entry ?\  " " st)
    (modify-syntax-entry ?\t " " st)

    ;; ;; Strings
    (modify-syntax-entry ?\" "\"" st)
    (modify-syntax-entry ?\\ "/" st)

    st)
  "Syntax table for `f2j-mode'.")

(define-derived-mode f2j-mode prog-mode "F2J"
  "f2j-mode is a major mode for editing f2j source code."
  :syntax-table f2j-mode-syntax-table
  :group 'f2j
  (use-local-map f2j-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(f2j-font-lock-defaults))
  (set (make-local-variable 'comment-start) "--"))


(eval-after-load 'quickrun
  '(progn
     (quickrun-add-command "f2j"
                           '((:command . "f2j")
                             (:exec . "%c -r %s %a")
                             (:compile-only . "%c %s")
                             (:description . "Compile f2j source file with f2j and execute"))
                           :mode 'f2j-mode)
     (define-key f2j-mode-map (kbd "C-c C-r") 'quickrun)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.sf\\'" . f2j-mode))

(provide 'f2j-mode)

;;; f2j-mode.el ends here
