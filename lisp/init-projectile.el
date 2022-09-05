;; projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  ;; required to spot the projectile
  (projectile-global-mode)
  ;; enable idle timer to auto generate tags
  (setq projectile-enable-idle-timer 1)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package helm-projectile
  :after (helm projectile)
  :ensure t)

(helm-projectile-on)

(provide 'init-projectile)
