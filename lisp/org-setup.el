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
     (http . t)
     (python .t))))

(provide 'org-setup)
