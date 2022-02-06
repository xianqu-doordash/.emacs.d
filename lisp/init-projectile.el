;; projectile 
(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-global-mode) ;; required to spot the projectile
  (setq projectile-enable-idle-timer 1) ;; enable idle timer to auto generate tags
  :bind-keymap
  ("C-c p" . projectile-command-map))

(provide 'init-projectile)
