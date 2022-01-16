;; projectile 
(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-global-mode) ;; required to spot the projectile
  (setq projectile-enable-idle-timer 1) ;; enable idle timer to auto generate tags
  ;; Amazon packages
  ;; only consider ordinary packages so far (actually only java is used right now)
  (projectile-register-project-type 'amazon-code '("Config" "src" "tst")
                                    :project-file "Config"
                                    :compile "brazil-build"
                                    :src-dir "src/"
                                    :test "brazil-build test"
                                    :test-dir "tst/"
                                    :test-suffix "Test")

  ;; Amazon smithy mode
  (projectile-register-project-type 'amazon-smithy '("Config" "model")
                                    :project-file "Config"
                                    :compile "brazil-build"
                                    :src-dir "model/")

  :bind-keymap
  ("C-c p" . projectile-command-map))

(defun xq/test-command ()
  "Returns a String representing the test command to run for the given context"
  (cond
   ((eq major-mode 'js-mode) "grunt test") ;; Test the JS of the project, useless now
   ((eq major-mode 'java-mode) (xq/brazil-java-test-command)) ;; Test the current java file/class
   ((eq major-mode 'my-mode) "special-command.sh") ;; Even Special conditions/test-sets can be covered
   )
  )

;TODO: Is that possible to specify the scope of the project? bb test; bb method test etc, with defadvice possibily?
(defun xq/brazil-java-test-command()
  (let ((pkg-cls-name (xq/get-pkg-cls-name-for-test)))
    (if pkg-cls-name
        (concat "brazil-build single-unit-test -DtestClass="
                pkg-cls-name)
      nil))
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

(provide 'init-projectile)
