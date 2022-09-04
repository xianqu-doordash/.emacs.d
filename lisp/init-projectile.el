;; projectile
(use-package projectile
  :ensure t
  :config
  ;; required to spot the projectile
  (projectile-global-mode)
  ;; enable idle timer to auto generate tags
  (setq projectile-enable-idle-timer 1)
  ;; amazon specific projects
  (projectile-register-project-type 'amazon-smithy '("Config" "model")
                                    :project-file "Config"
                                    :compile "brazil-build"
                                    :src-dir "model/")
  (projectile-register-project-type 'amazon-code '("Config" "src" "tst")
                                    :project-file "Config"
                                    :compile "brazil-build"
                                    :src-dir "src/"
                                    :test "brazil-build test"
                                    :test-dir "tst/"
                                    :test-suffix "Test")
  (projectile-register-project-type 'amazon-npm '("Config" "package.json")
                                    :project-file "Config"
                                    :compile "brazil-build"
                                    :src-dir "src/")

  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package helm-projectile
  :after (helm projectile)
  :ensure t)

(helm-projectile-on)

(provide 'init-projectile)
