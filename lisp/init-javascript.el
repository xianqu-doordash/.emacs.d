;;; init-javascript.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'typescript-mode)
;; typescript hook for tsx
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(maybe-require-package 'rjsx-mode)

(provide 'init-javascript)
;;; init-javascript.el ends here
