(use-package helm
  :ensure t
  )

;; It seems like helm-swoop + multiple cusor is a good combination to edit multiple places at the same time
;; We will see
(use-package helm-swoop
  :ensure t
  :requires helm
  :bind (("M-i" . helm-swoop)
	 ("M-I" . 'helm-swoop-back-to-last-point)
	 ("C-c M-i" . 'helm-multi-swoop)	   
	 ("C-x M-i" . 'helm-multi-swoop-all))
  :config
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)
  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows nil)

  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-horizontally)

  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color nil)

  ;; ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)

  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t)

  ;; If you prefer fuzzy matching
  (setq helm-swoop-use-fuzzy-match t)  

  )

(provide 'init-helm)
