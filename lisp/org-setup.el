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
     (python .t)
     (java .t)))
  ;; disable prompt when executing code block in org mode
  (setq org-confirm-babel-evaluate nil)
  :hook
  (org-mode . visual-line-mode))

(use-package helm-org-rifle
  :ensure t
  :after (helm org)
  :bind
  ("M-g r r" . helm-org-rifle)
  ("M-g r o" . helm-org-rifle-org-directory))

;; self-defined extractor for json file, copied from
;; https://isamert.net/2022/01/04/dealing-with-apis-jsons-and-databases-in-org-mode.html
(defun org-babel-execute:json (body params)
  (let ((jq (cdr (assoc :jq params)))
        (node (cdr (assoc :node params))))
    (cond
     (jq
      (with-temp-buffer
        ;; Insert the JSON into the temp buffer
        (insert body)
        ;; Run jq command on the whole buffer, and replace the buffer
        ;; contents with the result returned from jq
        (shell-command-on-region (point-min) (point-max) (format "jq -r \"%s\"" jq) nil 't)
        ;; Return the contents of the temp buffer as the result
        (buffer-string)))
     (node
      (with-temp-buffer
        (insert (format "const it = %s;" body))
        (insert node)
        (shell-command-on-region (point-min) (point-max) "node -p" nil 't)
        (buffer-string))))))

(provide 'org-setup)
