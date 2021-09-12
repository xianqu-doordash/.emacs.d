;; one line at a time scroll
(global-set-key (kbd "\C-z") 'scroll-up-line)
(global-set-key (kbd "\C-q") 'scroll-down-line)

;; window-move bindings
(windmove-default-keybindings)

;; restore split pane config, winner-undo, winner-redo
(winner-mode 1)

;; move cursor by camelCase (also i work a lot with jvm languages)
(global-subword-mode 1)

;; Change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; easy display of keys
(which-key-mode)

;; show the line number
(global-linum-mode 1)

;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
;; highlight brackets if visible, else entire expression
(setq show-paren-style 'mixed)

;; make ibuffer default which gives color to the buffers
(defalias 'list-buffers 'ibuffer)

(provide 'init-keys)
