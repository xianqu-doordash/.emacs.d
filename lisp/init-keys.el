;; easy display of keys
(use-package which-key
  :ensure t
  :init (which-key-mode 1))

;; key frequency
(use-package keyfreq
  :ensure t
  :init
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

;; one line at a time scroll
(global-set-key (kbd "\C-z") 'scroll-up-line)
(global-set-key (kbd "\C-q") 'scroll-down-line)

;; restore scrolling
(put 'scroll-down 'unscrollable t)
(put 'scroll-up 'unscrollable t)
(put 'scroll-left 'unscrollable t)
(put 'scroll-right 'unscrollable t)
(put 'end-of-buffer 'unscrollable t)
(put 'beginning-of-buffer 'unscrollable t)

(defvar unscroll-pos (make-marker)
  "the position to unscrolled ")

(defvar unscroll-window-start (make-marker)
  "window start to unscroll")

(defvar unscroll-hscroll nil
  "hscroll to unscroll")

(defun maybe-remember-unscrollpos ()
  (if (not (get last-command 'unscrollable))
  (progn
    (set-marker unscroll-pos (point))
    (set-marker unscroll-window-start (window-start))
    (setq unscroll-hscroll (window-hscroll)))))

(defadvice scroll-up (before remember-for-unscroll activate compile)
  "remember where to unscroll"
  (maybe-remember-unscrollpos))

(defadvice scroll-down (before remember-for-unscroll activate compile)
  "remember where to unscroll"
  (maybe-remember-unscrollpos))

(defadvice scroll-left (before remember-for-unscroll activate compile)
  "remember where to unscroll"
  (maybe-remember-unscrollpos))

(defadvice scroll-right (before remember-for-unscroll activate compile)
  "remember where to unscroll"
  (maybe-remember-unscrollpos))

(defadvice end-of-buffer (before remember-for-unscroll activate compile)
  "remember where to unscroll"
  (maybe-remember-unscrollpos))

(defadvice beginning-of-buffer (before remember-for-unscroll activate compile)
  "remember where to unscroll"
  (maybe-remember-unscrollpos))

(defun unscroll ()
  "revert to unscroll-pos"
  (interactive)
  (goto-char unscroll-pos)
  (set-window-start nil unscroll-window-start)
  (set-window-hscroll nil unscroll-hscroll))

;; restore split pane config, winner-undo, winner-redo
(winner-mode 1)

;; move cursor by camelCase (also i work a lot with jvm languages)
(global-subword-mode 1)

;; Change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; make ibuffer default which gives color to the buffers
(defalias 'list-buffers 'ibuffer)

(provide 'init-keys)
