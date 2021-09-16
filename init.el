;; elpa
(require 'package)

;; package achives to retrieve package
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the use-package to provide dependency for others
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-babel-load-languages (quote ((awk . t) (emacs-lisp . t) (shell . t))))
 '(package-selected-packages
   (quote
    (smex counsel-etags helm multiple-cursors helm-c-yasnippet yasnippet-classic-snippets yasnippet-snippets yasnippet which-key projectile helm-swoop use-package keyfreq graphql-mode rjsx-mode thrift scala-mode yaml-mode treemacs magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; add load paths for personalization
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; backup file setup
(require 'init-backup)

;; personal key bindings
(require 'init-keys)

;; helm
(require 'init-helm)

;; display
(require 'init-display)

;; ido setups
(require 'init-ido)

;; git
(require 'init-git)

;; file related settings
(require 'init-file)

;; projectile
(require 'init-projectile)

;; tags
(require 'init-tags)

;; yasnippet
(require 'init-yasnippet)

;; dried
(require 'init-dried)

;; point-undo
(require 'point-undo)

;; smex
(require 'smex)
