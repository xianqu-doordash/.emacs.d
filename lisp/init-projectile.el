(projectile-mode +1)
(setq projectile-track-known-projects-automatically nil)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'init-projectile)
