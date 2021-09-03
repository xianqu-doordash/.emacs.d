(setq twitter-source-prefix "/Users/xqu/workspace/source/")

(defun pants-test(&optional target-dir) 
  "pants test for a specific target."
  (interactive "D")
  (let ((target (string-remove-prefix twitter-source-prefix target-dir))
	)
    (shell-command (concat "cd " twitter-source-prefix "  && ./pants test " target))
    )
  )

(pants-test "/Users/xqu/workspace/source/timelinescorer/server/src/test/scala/com/twitter/timelinescorer/services")





