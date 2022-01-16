;; hide start up
(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)

;; default as maximized screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; display time
(display-time-mode 1)

;; show the line number
(global-linum-mode 1)

;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)

;; no toolbar
(tool-bar-mode -1)

;; highlight brackets if visible, else entire expression
(setq show-paren-style 'mixed)

(setq tags-add-tables nil)

(provide 'init-display)
