(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init (yas-global-mode)
  :config
  (progn
    (yas-global-mode)))

(use-package helm-c-yasnippet
  :after (helm yasnippet)
  :ensure t
  :bind ("C-c y" . helm-yas-complete))

;; note that the i currently use the yasnippet official snippet installed from melpa
;; personal snippets are under snippets dir anyway, no need to have separate setup for it
(use-package yasnippet-snippets
  :ensure t)

(provide 'init-yasnippet)
