(defun dove-note-highlight ()
  "set dove note highlight for current buffer"
  (font-lock-add-keywords nil '(("\\<\\(FIXME:\\)" 1 '(:foreground "red"     :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(NOTE:\\)"  1 '(:foreground "yellow"  :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(TODO:\\)"  1 '(:foreground "#22dfa0" :box t) t)))
  (font-lock-add-keywords nil '(("\\(@[A-Za-z][A-Za-z]*:\\)"  1 '(:background "#116576" :foreground "grey" :box t) t)))
)

(defun dove-note-highlight-terminal ()
  "set dove note highlight for current buffer"
  (font-lock-add-keywords nil '(("\\<\\(FIXME:\\)" 1 '(:foreground "red"      :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(NOTE:\\)"  1 '(:foreground "lightred" :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(TODO:\\)"  1 '(:foreground "blue"     :box t) t)))
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

(defun dove-highlight-text-terminal ()
    (set-face-foreground font-lock-variable-name-face   "lightgray")
    (set-face-foreground font-lock-string-face          "cyan")
    (set-face-foreground font-lock-keyword-face         "lightred")
    (set-face-foreground font-lock-comment-face         "darkgray")
    (set-face-foreground 'button                        "lightgreen")

    (set-face-foreground 'cursor                        "lightgray")
    (set-face-background 'region                        "green")
    (set-face-foreground 'region                        "black")
    (set-face-foreground 'line-number                   "green")

    (set-face-background 'isearch                       "lightblue")
	(set-face-background 'show-paren-match              "darkgray")
	(set-face-foreground 'show-paren-match              "lightgray")

    (set-face-background 'tty-menu-disabled-face        "darkgray")
    (set-face-foreground 'tty-menu-disabled-face        "yellow")
    (set-face-background 'tty-menu-enabled-face         "darkgray")
    (set-face-foreground 'tty-menu-enabled-face         "lightgray")
    (set-face-background 'tty-menu-selected-face        "green")

    (set-face-background 'header-line                   "white")

	(dove-sml-highlight-terminal)
	(add-hook 'company-mode-hook 'dove-company-highlight-terminal)
	(add-hook 'prog-mode-hook 'dove-note-highlight-terminal)
)

(defun dove-nice-line-number-gui ()
  (interactive)
  ; (set-face-background 'line-number-current-line "green")
  ; (set-face-foreground 'line-number-current-line "black")
)

(defun dove-nice-line-number-terminal ()
  (interactive)
  ; (set-face-background 'line-number-current-line "green")
  ; (set-face-foreground 'line-number-current-line "black")
  ; (add-hook 'evil-insert-state-entry-hook
			; '(lambda ()
			   ; (set-face-background 'line-number-current-line "yellow")
			   ; ()))
  ; (add-hook 'evil-insert-state-exit-hook
			; '(lambda ()
			   ; (set-face-background 'line-number-current-line "green")))
)


(if (display-graphic-p)
	; GUI highlight
	(add-hook 'prog-mode-hook 'dove-note-highlight)
	; terminal highlight
    (dove-highlight-text-terminal)
	(if (display-graphic-p)
		(dove-nice-line-number-gui)
	    (dove-nice-line-number-terminal))
)

(provide 'init-highlight)
