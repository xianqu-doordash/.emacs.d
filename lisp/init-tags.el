(use-package counsel-etags
  :ensure t
  :bind (("C-]" . counsel-etags-find-tag-at-point))
  :init
  ;; Don't ask before rereading the TAGS files if they have changed
  (setq tags-revert-without-query t)
  (add-hook 'prog-mode-hook
        (lambda ()
          (add-hook 'after-save-hook
            'counsel-etags-virtual-update-tags 'append 'local)))
  :config
  (setq counsel-etags-update-interval 60)
  (push "build" counsel-etags-ignore-directories))

(provide 'init-tags)
