;;; init-javascript.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package typescript-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode)))

(use-package rjsx-mode
  :ensure t)

(provide 'init-javascript)
;;; init-javascript.el ends here
