(use-package ido
  :ensure t
  :init
  (ido-mode 1)
  :config
  ;; big minibuffer height, for ido to show choices vertically
  (setq max-mini-window-height 0.5)
  
  ;; show choices vertically
  (make-local-variable 'ido-decorations)
  (setf (nth 2 ido-decorations) "\n")

  ;; show any name that has the chars you typed
  (setq ido-enable-flex-matching t)

  ;; use current pane for newly opened file
  (setq ido-default-file-method 'selected-window)

  ;; use current pane for newly switched buffer
  (setq ido-default-buffer-method 'selected-window)

  ;; stop ido from suggesting when naming new file
  (define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil)
)

(provide 'init-ido)

