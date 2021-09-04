(use-package yasnippet
  :ensure t)

(use-package helm-c-yasnippet
  :ensure t)

(require 'yasnippet)

;; helm yasnippet
(require 'helm-c-yasnippet)

;; this one just gives the advantage when there are too many snippets that you can not remeber
;; complements this together with "TAB" provided by IDO probably faster
(global-set-key (kbd "C-c y") 'helm-yas-complete)

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

;; note that the i currently use the yasnippet official snippet installed from melpa
;; personal snippets are under snippets dir anyway, no need to have separate setup for it

;; TODO: is it possible to know if a key word is completable based on cursor color? see some implementation, but seems not working

(provide 'init-yasnippet)
