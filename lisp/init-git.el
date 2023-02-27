(use-package magit
  :ensure t
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(defun xq-magit-stage-all-and-commit (message)
  (interactive (list (progn (magit-diff-unstaged) (read-string "Commit Message: "))))
  (magit-stage-modified)
  (magit-commit-create (list "-m" message)))

;TODO: is it possible to add this as a new option in the ui?

(provide 'init-git)
