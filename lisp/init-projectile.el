(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (setq projectile-track-known-projects-automatically nil)
  )

(projectile-mode +1)

(provide 'init-projectile)
