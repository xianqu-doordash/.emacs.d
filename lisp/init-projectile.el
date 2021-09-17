(use-package counsel-projectile
  :ensure t
  :config
  (setq projectile-track-known-projects-automatically nil)
  :hook (after-init . counsel-projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map))

(provide 'init-projectile)
