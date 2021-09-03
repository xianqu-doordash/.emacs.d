;; hide start up
(setq inhibit-startup-screen t)

;; default as maximized screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; display time
(display-time-mode 1)

(provide 'init-display)
