(defun dove-note-highlight ()
  "set dove note highlight for current buffer"
  (font-lock-add-keywords nil '(("\\<\\(FIXME:\\)" 1 '(:foreground "red"     :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(NOTE:\\)"  1 '(:foreground "yellow"  :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(TODO:\\)"  1 '(:foreground "#22dfa0" :box t) t)))
  (font-lock-add-keywords nil '(("\\(@[A-Za-z][A-Za-z]*:\\)"  1 '(:background "#116576" :foreground "grey" :box t) t)))
)

(defun dove-note-highlight-terminal ()
  "set dove note highlight for current buffer"
  (font-lock-add-keywords nil '(("\\<\\(FIXME:\\)" 1 '(:foreground "red"     :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(NOTE:\\)"  1 '(:foreground "yellow"  :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(TODO:\\)"  1 '(:foreground "blue" :box t) t)))
  (font-lock-add-keywords nil '(("\\(@[A-Za-z][A-Za-z]*:\\)"  1 '(:background "cyan" :foreground "grey" :box t) t)))
)

(defun dove-company-highlight-terminal ()
  "adjust highlight for company mode in terminal"
  (set-face-background 'company-tooltip "darkgray")
)
(defun dove-sml-highlight-terminal ()
  "adjust highlight for sml in terminal"
    (set-face-foreground 'sml/client         "black")
    (set-face-foreground 'sml/filename       "black")
    (set-face-foreground 'sml/modes          "cyan")
    (set-face-foreground 'sml/prefix         "cyan")
    (set-face-foreground 'sml/git            "cyan")
)


(if (display-graphic-p)
	; GUI highlight
	(add-hook 'prog-mode-hook 'dove-note-highlight)
	; terminal highlight
    (set-face-foreground font-lock-variable-name-face   "white")
    (set-face-foreground font-lock-string-face          "lightcyan")
    (set-face-foreground font-lock-keyword-face         "yellow")
    (set-face-foreground font-lock-comment-face         "darkgray")

    (set-face-background 'region                        "green")
    (set-face-foreground 'region                        "lightwhite")
    (set-face-foreground 'line-number                   "green")

    (set-face-background 'isearch                       "lightblue")

    (set-face-background 'tty-menu-disabled-face        "darkgray")
    (set-face-foreground 'tty-menu-disabled-face        "white")
    (set-face-background 'tty-menu-enabled-face         "darkgray")
    (set-face-foreground 'tty-menu-enabled-face         "lightgray")
    (set-face-background 'tty-menu-selected-face        "lightgray")

    (set-face-background 'header-line                   "white")

	(dove-sml-highlight-terminal)
	(add-hook 'company-mode-hook 'dove-company-highlight-terminal)
	(add-hook 'prog-mode-hook 'dove-note-highlight-terminal)
)

(provide 'init-highlight)
