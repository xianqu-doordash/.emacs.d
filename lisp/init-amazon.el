(use-package amz-common
  :after(projectile)
  :init
  (add-to-list 'auto-mode-alist '("\\.smithy\\'" . smithy-mode))
  (add-to-list 'auto-mode-alist '("Config" . brazil-config-mode))
  (add-to-list 'compilation-finish-functions 'xq/amz-open-cr-link)
  :config
  (projectile-register-project-type 'amazon-smithy '("Config" "model")
                                    :project-file "Config"
                                    :compile "brazil-build"
                                    :src-dir "model/")
  (projectile-register-project-type 'amazon-code '("Config" "src" "tst")
                                    :project-file "Config"
                                    :compile "brazil-build"
                                    :src-dir "src/"
                                    :test "brazil-build test"
                                    :test-dir "tst/"
                                    :test-suffix "Test")
  (projectile-register-project-type 'amazon-npm '("Config" "package.json")
                                    :project-file "Config"
                                    :compile "brazil-build"
                                    :src-dir "src/")
  :custom
  (smithy-indent-basic 4 "Indentation for smithy mode")
  (amz-workspace-review-use-comint t "Always use comint bufer for amazon workspace cr"))

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

(defadvice amz-workspace-review (before mw-activation-before-amz-workspace-cr activate)
  (amz-mw-maybe-refresh-cookie))

(defun xq/pkg-cr (&optional is-new)
  "Send a CR with current package either new or revision"
  (interactive "P")
  (let ((compilation-buffer-name-function #'(lambda (_mode) "*Workspace cr*")))
    (if is-new
        (projectile-run-compilation "cr --new" t)
      (projectile-run-compilation "cr"))))

(defadvice xq/pkg-cr (before mw-activation-before-xq/pkg-cr activate)
  (amz-mw-maybe-refresh-cookie))

(defun xq/amz-open-cr-link(buffer msg)
  "Open cr link automatically after CR commands"
  (let ((cr-regex "https://code.amazon.com/reviews/CR-[0-9]+")
        (amz-ws-cr-buffer-name "*Workspace cr*"))
    (when (string= amz-ws-cr-buffer-name (buffer-name buffer))
      (switch-to-buffer buffer)
      (goto-char (point-min))
      (when (re-search-forward cr-regex nil t)
        (xah-html-open-link-in-firefox (match-string 0))))))

(provide 'init-amazon)
