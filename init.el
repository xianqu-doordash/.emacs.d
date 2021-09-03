;; elpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-babel-load-languages '((awk . t) (emacs-lisp . t) (shell . t)))
 '(package-selected-packages
   '(multiple-cursors helm-c-yasnippet yasnippet-classic-snippets yasnippet-snippets yasnippet which-key projectile helm-swoop use-package keyfreq graphql-mode rjsx-mode thrift scala-mode yaml-mode treemacs magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; use scala mode for strato files
;; TODO: actually write a strato mode and corresponding yasnippet
(add-to-list 'auto-mode-alist '("\\.strato\\'" . scala-mode))

;; rjsx mode for js files
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

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

;; yasnippet
(require 'init-yasnippet)

;; dried
(require 'init-dried)
