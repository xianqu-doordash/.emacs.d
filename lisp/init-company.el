(use-package company
  :ensure t
  :init
  (setq tab-always-indent 'complete)
  (add-to-list 'completion-styles 'initials t)
  (add-hook 'after-init-hook 'global-company-mode)
  :diminish company-mode
  :bind
  (("M-C-/" . company-complete)
   :map company-mode-map
   ("M-/" . company-complete)
   ([remap completion-at-point] . company-complete)
   ([remap indent-for-tab-command] . company-indent-or-complete-common)
   :map company-active-map
   ("M-/" . company-other-backend)
   ("C-n" . company-select-next)
   ("C-p" . company-select-previous)
   ("C-d" . company-show-doc-buffer)
   ("M-." . company-show-location))
  :custom
  (company-dabbrev-other-buffers 'all)
  (company-tooltip-align-annotations t)
  (company-show-quick-access 'left))

(use-package company-quickhelp
  :ensure t
  :after (company)
  :init
  (add-hook 'after-init-hook 'company-quickhelp-mode))

(provide 'init-company)
;;; init-company.el ends here
