(use-package org
  :mode (("\\.org$" . org-mode))
  :ensure t
  :custom
  (org-plantuml-jar-path (expand-file-name "/Users/quxq/.emacs.d/jar/plantuml.jar"))
  :config
  ;;plantum uml
  (setq plantuml-default-exec-mode 'jar)
  ;; python setup
  (setq org-babel-python-command "python3")
  ;; languages supports
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((awk . t)
     (emacs-lisp . t)
     (shell . t)
     (plantuml . t)
     (python .t)))
  ;; disable prompt when executing code block in org mode
  (setq org-confirm-babel-evaluate nil))

(use-package helm-org-rifle
  :ensure t
  :after (helm org)
  :bind
  ("M-g r r" . helm-org-rifle)
  ("M-g r o" . helm-org-rifle-org-directory))

(provide 'org-setup)
