;;plantum uml
(setq org-plantuml-jar-path (expand-file-name "/Users/quxq/.emacs.d/jar/plantuml.jar"))

;; python setup
(setq org-babel-python-command "python3")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((awk . t)
   (emacs-lisp . t)
   (shell . t)
   (plantuml . t)))

(provide 'org-setup)

