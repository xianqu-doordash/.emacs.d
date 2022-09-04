(use-package diff-hl
  :ensure t)

(use-package diredfl
  :ensure t)

(use-package dired-subtree
  :ensure t
  :config
  (setq dired-subtree-use-backgrounds nil))

(use-package dired
  :after (diff-hl diredfl dired-subtree)
  :hook diff-hl-dired-mode
  :bind (:map dired-mode-map
         ("<tab>" . dired-subtree-toggle)
         ("<backtab>" . dired-subtree-remove)
         :map ctl-x-map
         ("C-j" . dired-jump-other-window))
  :config
  (setq dired-recursive-deletes 'top) ;; “top” means ask once
  (setq dired-recursive-copies 'always) ;; “always” means no asking
  (setq dired-dwim-target t) ;; allows for split window copying
  (diredfl-global-mode))

(provide 'init-dired)
