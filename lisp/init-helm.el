(maybe-require-package 'helm)
(maybe-require-package 'helm-swoop)
(maybe-require-package 'helm-c-yasnippet)
(maybe-require-package 'helm-projectile)

(require 'helm-config)

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)             
(global-set-key (kbd "C-c h") 'helm-mini)          
(global-set-key (kbd "C-h a") 'helm-apropos)       
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)  
(global-set-key (kbd "C-x C-f") 'helm-find-files)    
(global-set-key (kbd "C-x C-r") 'helm-recentf)              
(global-set-key (kbd "C-s") 'helm-occur)                   
         
(setq helm-split-window-in-side-p t) ;; Open helm buffer inside current window, not occupy whole other window
(setq helm-move-to-line-cycle-in-source t) ;; move to end or beginning of source when reaching top or bottom of source.

(helm-mode)

;; this seems to only work after helm-mode enabled
(helm-autoresize-mode)
(setq helm-autoresize-max-height 20)
(setq helm-autoresize-min-height 10)

;; helm-swoop
(global-set-key (kbd "M-i") 'helm-swoop)                    
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)	   
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

(setq helm-multi-swoop-edit-save t)  ;; Save buffer when helm-multi-swoop-edit complete

(setq helm-swoop-split-with-multiple-windows t)   ;; Split window inside the current window
(setq helm-swoop-split-direction 'split-window-horizontally)   ;; Split horizontally

(setq helm-swoop-speed-or-color t)  ;; If nil, you can slightly boost invoke speed in exchange for text color

(setq helm-swoop-move-to-line-cycle t)  ;; Go to the opposite side of line from the end or beginning of line

(setq helm-swoop-use-line-number-face t) ;; Optional face for line numbers Face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-fuzzy-match t)  ;; If you prefer fuzzy matching

;; helm-yas-complete
(global-set-key (kbd "C-c y") 'helm-yas-complete)

;; helm-projectile
(helm-projectile-on)

(provide 'init-helm)
