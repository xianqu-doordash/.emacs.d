(require 'amz-common)

(add-to-list 'auto-mode-alist '("\\.smithy\\'" . smithy-mode))
(setq smithy-indent-basic 4)


(add-to-list 'auto-mode-alist '("Config" . brazil-config-mode))

(provide 'init-amazon)
