(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c c" . 'mc/edit-lines)
         ("C-S-c n" . 'mc/mark-next-like-this)
         ("C-S-c a" . 'mc/mark-all-like-this)))

(provide 'init-multiplecursor)
