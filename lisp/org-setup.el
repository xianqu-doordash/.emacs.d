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
  (setq org-todo-keywords
        '((sequence
           "STARTED(s)"
           "TODO(t)"  ; next action
           "WAITING(w@/!)"
           "SOMEDAY(.)" "BLOCKED(k@/!)" "|" "DONE(x!)" "CANCELLED(c)")
          (sequence "PROJECT" "|" "DONE(x)")
          (sequence "LEARN" "TRY" "TEACH" "|" "COMPLETE(x)")
          (sequence "TOSKETCH" "SKETCHED" "|" "POSTED")
          (sequence "TODELEGATE(-)" "DELEGATED(d)" "|" "COMPLETE(x)")))
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "green" :weight bold))
          ("DONE" . (:foreground "cyan" :weight bold))
          ("WAITING" . (:foreground "red" :weight bold))
          ("SOMEDAY" . (:foreground "gray" :weight bold))))
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

(use-package ox-moderncv
    :load-path "/Users/quxq/Downloads/org-cv"
    :init (require 'ox-moderncv))


(defun xq/export-resume ()
  "export current buffer of resume to pdf"
  (interactive)
  (org-export-to-file 'moderncv "XianQuResume.tex")
  (org-latex-compile "XianQuResume.tex"))

(defcustom xq/config-stage ?g
  "Stage to extract configurations."
  :type '(character))

;TODO: considering put this somewhere general
(setq xq/stage-hash-map (make-hash-table :test 'equal))
(puthash ?a "alpha" xq/stage-hash-map)
(puthash ?b "beta" xq/stage-hash-map)
(puthash ?g "gamma" xq/stage-hash-map)
(puthash ?p "prod" xq/stage-hash-map)

;; Still hard coded, but have the potential to generalize
;;TODO: 1. make the src-block more generalized from params
(defun xq/org-babel-refresh-configurations()
  "Refresh the entire configuration of some org file"
  (interactive)
  (save-excursion
    (save-restriction
      (save-match-data)
      (org-babel-goto-named-src-block "roa-configuration-by-stage")
      (if (re-search-forward "stage=\"[[:alpha:]]*\"$" nil t)
          (replace-match (concat "stage=\"" (gethash xq/config-stage xq/stage-hash-map) "\"")))
      (org-babel-execute-subtree))))

(provide 'org-setup)
