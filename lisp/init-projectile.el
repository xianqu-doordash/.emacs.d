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

;TODO: this is not found to be usable for magit as yet
;; What is really working is the zshell setup from https://stackoverflow.com/questions/23556330/run-nvm-use-automatically-every-time-theres-a-nvmrc-file-on-the-directory
;; (defun xq/maybe-run-nvm-use()
;;   (interactive)
;;   (when (projectile-verify-file ".nvmrc")
;;     (projectile-run-shell-command-in-root "/Users/xian.qu/.nvm/nvm-exec")))

(use-package magit
  :ensure t
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(defun xq-magit-stage-all-and-commit (message)
  (interactive (list (progn (magit-diff-unstaged) (read-string "Commit Message: "))))
  (magit-stage-modified)
  (magit-commit-create (list "-m" message)))

;TODO: is it possible to add this as a new option in the ui?

(provide 'init-projectile)
