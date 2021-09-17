;; window-move bindings
(windmove-default-keybindings)

(use-package ace-window
  :ensure t
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind (("s-o" . ace-window)))

(provide 'init-window)
