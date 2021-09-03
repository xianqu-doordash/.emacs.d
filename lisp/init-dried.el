(require 'dired-x)

;; allow dired to delete or copy dir
(setq dired-recursive-copies (quote always)) ; “always” means no asking
(setq dired-recursive-deletes (quote top)) ; “top” means ask once

;; allows for split window copying
(setq dired-dwim-target t)

(provide 'init-dried)

