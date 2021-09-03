(progn
  ;; make buffer switch command do suggestions, also for find-file command
  (require 'ido)
  (ido-mode 1)

  ;; show choices vertically
  (if (version< emacs-version "25")
      (progn
        (make-local-variable 'ido-separator)
        (setq ido-separator "\n"))
    (progn
      (make-local-variable 'ido-decorations)
      (setf (nth 2 ido-decorations) "\n")))

  ;; show any name that has the chars you typed
  (setq ido-enable-flex-matching t)

  ;; use current pane for newly opened file
  (setq ido-default-file-method 'selected-window)

  ;; use current pane for newly switched buffer
  (setq ido-default-buffer-method 'selected-window)

  ;; stop ido from suggesting when naming new file
  (define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil))
;; big minibuffer height, for ido to show choices vertically
(setq max-mini-window-height 0.5)

(provide 'init-ido)

