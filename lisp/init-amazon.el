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
                                  :test "brazil-build test"
                                  :test-dir "tst/"
                                  :test-suffix "Test")

;TODO: add for workspace cr
;TODO: also possible with pull the buffer and open in firefox?
(defun xq/pkg-cr (&optional is-new)
  "Send a CR with current package either new or revision"
  (interactive "P")
  (if is-new
      (projectile-run-compilation "cr --new" t)
    (projectile-run-compilation "cr")))

(defun xq/sam ()
  (interactive)
  (projectile-run-compilation "brazil-build-tool-exec sam package && brazil-build-tool-exec sam deploy"))

(defun xq/projectile-test-project (arg)
  "Run project test command either with on class level or on method level.
   With prefix argument it will run on class level test."
  (interactive "P")
  (let* ((project-root (projectile-project-root))
         (default-directory (projectile-compilation-dir))
         (command (if arg
                      (xq/brazil-java-test-command arg)
                    (xq/brazil-java-test-command))))
    (projectile-run-compilation command)))

(defun xq/brazil-java-test-command (&optional cls-scope)
  "Generates the java test command according to scope"
  (let ((cmd (concat
              "brazil-build single-unit-test -DtestClass="
              (xq/get-pkg-cls-name-for-test))))
    (if cls-scope
        cmd
      (concat
       cmd
       " -DtestMethods="
       (xq/get-method-name-for-test)))))

(defun xq/get-pkg-cls-name-for-test()
  "Get the package name for testing"
  (save-excursion
    (save-restriction
      (save-match-data
        (widen)
        (goto-char (point-min))
        (if (re-search-forward "package \\([^\\;]*\\)")
            (concat (match-string 1)
                    "."
                    (xq/get-test-file-name(file-name-sans-extension (buffer-name))))
          nil)))))

(defun xq/get-method-name-for-test()
  "Get the method name for test"
  (save-excursion
    (save-restriction
      (save-match-data
        (widen)
        (if (and (re-search-backward "@Test") ;; usually i am editing the method part and just want to test the method
                 (re-search-forward "public void \\(.*\\)() "))
            (match-string 1)
          nil)))))

(defun xq/get-test-file-name (fn)
  "Get the class name with the current file"
  (if (string-match ".*Test" fn)
      fn
    (concat fn
            "Test")))

(provide 'init-amazon)
