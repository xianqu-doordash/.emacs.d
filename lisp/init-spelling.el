(require 'ispell)

(when (executable-find ispell-program-name)
  (add-hook 'markdown-mode-hook 'flyspell-mode))

;; the personal dictionary is stored at ~/.ispell_english

;; NO spell check for embedded snippets
(defadvice org-mode-flyspell-verify (after org-mode-flyspell-verify-hack activate)
  (let* ((rlt ad-return-value)
         (begin-regexp "^[ \t]*#\\+begin_\\(src\\|html\\|latex\\|example\\|quote\\)")
         (end-regexp "^[ \t]*#\\+end_\\(src\\|html\\|latex\\|example\\|quote\\)")
         (case-fold-search t)
         b e)
    (when ad-return-value
      (save-excursion
        (setq b (re-search-backward begin-regexp nil t))
        (if b (setq e (re-search-forward end-regexp nil t))))
      (if (and b e (< (point) e)) (setq rlt nil)))
    (setq ad-return-value rlt)))

(provide 'init-spelling)
