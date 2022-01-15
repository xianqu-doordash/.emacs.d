;;plantum uml
(setq org-plantuml-jar-path (expand-file-name "/Users/quxq/.emacs.d/jar/plantuml.jar"))
(setq plantuml-default-exec-mode 'jar)


;; python setup
(setq org-babel-python-command "python3")

;; ob-http
(maybe-require-package 'ob-http)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((awk . t)
   (emacs-lisp . t)
   (shell . t)
   (plantuml . t)
   (http . t)))

(provide 'org-setup)

