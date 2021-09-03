;; Emacs saves backup files in the current directory. These are the files ending in ~ that are cluttering up your directory lists
;; The following code stashes them all in ~/.config/emacs/backups
(setq backup-directory-alist '(("." . "~/.config/emacs/backups")))

;; Other backup related
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.config/emacs/auto-save-list/" t)))

(provide 'init-backup)
