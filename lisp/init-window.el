;; window-move bindings
(windmove-default-keybindings)

(use-package ace-window
  :ensure t
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (aw-dispatch-always t)
  (aw-dispatch-alist
   '((?2 aw-split-window-vert)
     (?3 aw-split-window-horz)))
  :bind (("s-o" . ace-window)))

(provide 'init-window)
