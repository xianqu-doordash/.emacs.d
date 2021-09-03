;; one line at a time scroll
(global-set-key (kbd "\C-z") 'scroll-up-line)
(global-set-key (kbd "\C-q") 'scroll-down-line)

;; brackets related tricks inspired by xah
;; Here are commands to move cursor to any open/close brackets.
;; They are extremely useful when working with computer language source code such as lisp, Java, Python, JavaScript, etc.
(defvar xah-brackets nil "string of left/right brackets pairs.")
(setq xah-brackets "()[]{}<>（）［］｛｝⦅⦆〚〛⦃⦄“”‘’‹›«»「」〈〉《》【】〔〕⦗⦘『』〖〗〘〙｢｣⟦⟧⟨⟩⟪⟫⟮⟯⟬⟭⌈⌉⌊⌋⦇⦈⦉⦊❛❜❝❞❨❩❪❫❴❵❬❭❮❯❰❱❲❳〈〉⦑⦒⧼⧽﹙﹚﹛﹜﹝﹞⁽⁾₍₎⦋⦌⦍⦎⦏⦐⁅⁆⸢⸣⸤⸥⟅⟆⦓⦔⦕⦖⸦⸧⸨⸩｟｠⧘⧙⧚⧛⸜⸝⸌⸍⸂⸃⸄⸅⸉⸊᚛᚜༺༻༼༽⏜⏝⎴⎵⏞⏟⏠⏡﹁﹂﹃﹄︹︺︻︼︗︘︿﹀︽︾﹇﹈︷︸")

(defvar xah-left-brackets '()
  "List of left bracket chars.")
(progn
;; make xah-left-brackets based on xah-brackets
  (setq xah-left-brackets '())
  (dotimes ($x (- (length xah-brackets) 1))
    (when (= (% $x 2) 0)
      (push (char-to-string (elt xah-brackets $x))
            xah-left-brackets)))
  (setq xah-left-brackets (reverse xah-left-brackets)))

(defvar xah-right-brackets '()
  "list of right bracket chars.")
(progn
  (setq xah-right-brackets '())
  (dotimes ($x (- (length xah-brackets) 1))
    (when (= (% $x 2) 1)
      (push (char-to-string (elt xah-brackets $x))
            xah-right-brackets)))
  (setq xah-right-brackets (reverse xah-right-brackets)))

(defun xah-backward-left-bracket ()
  "Move cursor to the previous occurrence of left bracket.
The list of brackets to jump to is defined by `xah-left-brackets'.
URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
Version 2015-10-01"
  (interactive)
  (re-search-backward (regexp-opt xah-left-brackets) nil t))

(defun xah-forward-right-bracket ()
  "Move cursor to the next occurrence of right bracket.
The list of brackets to jump to is defined by `xah-right-brackets'.
URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
Version 2015-10-01"
  (interactive)
  (re-search-forward (regexp-opt xah-right-brackets) nil t))

(global-set-key (kbd "<M-up>") 'xah-backward-left-bracket)
(global-set-key (kbd "<M-down>") 'xah-forward-right-bracket)

;; window-move bindings
(windmove-default-keybindings)

;; restore split pane config, winner-undo, winner-redo
(winner-mode 1)

;; move cursor by camelCase (also i work a lot with jvm languages)
(global-subword-mode 1)

;; Change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; easy display of keys
(which-key-mode)

;; show the line number
(global-linum-mode 1)

;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
;; highlight brackets if visible, else entire expression
(setq show-paren-style 'mixed)

;; make ibuffer default which gives color to the buffers
(defalias 'list-buffers 'ibuffer)

(provide 'init-keys)
