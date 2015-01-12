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
    ("^[ \t]*--.*" . font-lock-comment-face) ;; Why is this not working at the moment?
  ))

(define-derived-mode f2j-mode prog-mode
  (setq font-lock-defaults '(f2j-font-lock-defaults))
  (setq mode-name "F2J"))

(add-to-list 'auto-mode-alist '("\\.sf\\'" . f2j-mode))

(provide 'f2j-mode)

;;; f2j-mode.el ends here
