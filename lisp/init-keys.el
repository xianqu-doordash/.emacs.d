(use-package which-key
  :ensure t)

;; one line at a time scroll
(global-set-key (kbd "\C-z") 'scroll-up-line)
(global-set-key (kbd "\C-q") 'scroll-down-line)

;; restore split pane config, winner-undo, winner-redo
(winner-mode 1)

;; move cursor by camelCase (also i work a lot with jvm languages)
(global-subword-mode 1)

;; Change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; easy display of keys
(which-key-mode)

;; make ibuffer default which gives color to the buffers
(defalias 'list-buffers 'ibuffer)

(provide 'init-keys)
