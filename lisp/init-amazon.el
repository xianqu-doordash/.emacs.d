(require 'amz-common)
(require 'init-projectile)

(add-to-list 'auto-mode-alist '("\\.smithy\\'" . smithy-mode))
(setq smithy-indent-basic 4)
(projectile-register-project-type 'amazon-smithy '("Config" "model")
                                  :project-file "Config"
                                  :compile "brazil-build"
                                  :src-dir "model/")

(add-to-list 'auto-mode-alist '("Config" . brazil-config-mode))

(projectile-register-project-type 'amazon-code '("Config" "src" "tst")
                                  :project-file "Config"
                                  :compile "brazil-build"
                                  :src-dir "src/"
                                  :test 'xq/test-command
                                  :test-dir "tst/"
                                  :test-suffix "Test")

(defun xq/test-command ()
  "Returns a String representing the test command to run for the given context"
  (cond
   ((eq major-mode 'js-mode) "grunt test") ;; Test the JS of the project, useless now
   ((eq major-mode 'java-mode) (xq/brazil-java-test-command)) ;; Test the current java file/class
   ((eq major-mode 'my-mode) "special-command.sh") ;; Even Special conditions/test-sets can be covered
   )
  )

                                        ;TODO: how to handle search failed?
(defun xq/brazil-java-test-command()
  (let ((pkg-cls-name (xq/get-pkg-cls-name-for-test))
        (method-name (xq/get-method-name-for-test)))
    (if pkg-cls-name
        (let ((cmd (concat
                    "brazil-build single-unit-test -DtestClass="
                    pkg-cls-name
                    " -DtestMethods="
                    method-name
                    )))
          cmd)
      "brazil-build")
    )
  )

(defun xq/get-pkg-cls-name-for-test()
  (save-excursion
    (save-restriction
      (save-match-data
        (widen)
        (goto-char (point-min))
        (if (re-search-forward "package \\([^\\;]*\\)")
            (concat (match-string 1)
                    "."
                    (xq/get-test-file-name(file-name-sans-extension (buffer-name))))
          nil))))
  )

;TODO: Maybe only valid in test buffer?
(defun xq/get-method-name-for-test()
  (save-excursion
    (save-restriction
      (save-match-data
        (widen)
        (if (and (re-search-backward "@Test") ;; usually i am editing the method part and just want to test the method
                 (re-search-forward "public void \\(.*\\)() "))
            (match-string 1)
          nil))))
  )

(defun xq/get-test-file-name (fn)
  (if (string-match ".*Test" fn)
      fn
    (concat fn
            "Test"))
  )

(provide 'init-amazon)
