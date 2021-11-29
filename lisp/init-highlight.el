(defun dove-note-highlight ()
  "set dove note highlight for current buffer"
  (font-lock-add-keywords nil '(("\\<\\(FIXME:\\)" 1 '(:foreground "red"     :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(NOTE:\\)"  1 '(:foreground "yellow"  :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(TODO:\\)"  1 '(:foreground "#22dfa0" :box t) t)))
  (font-lock-add-keywords nil '(("\\(@[A-Za-z][A-Za-z]*:\\)"  1 '(:background "#e66735" :foreground "#2d3743" :box t) t)))
)

(defun dove-note-highlight-terminal ()
  "set dove note highlight for current buffer"
  (font-lock-add-keywords nil '(("\\<\\(FIXME:\\)" 1 '(:background "red"      :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(NOTE:\\)"  1 '(:foreground "lightred" :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(TODO:\\)"  1 '(:foreground "blue"     :box t) t)))
  (font-lock-add-keywords nil '(("\\(@[A-Za-z][A-Za-z]*:\\)"  1 '(:background "yellow" :foreground "black" :box t) t)))
)

(defun dove-company-highlight-terminal ()
  "adjust highlight for company mode in terminal"
  (set-face-background 'company-tooltip "darkgray")
)

(defun dove-sml-highlight-terminal ()
  "adjust highlight for sml in terminal"
    (set-face-foreground 'sml/git                       "cyan")
	(set-face-foreground 'sml/client                    "gray")
	(set-face-foreground 'sml/col-number                "gray")
	(set-face-foreground 'sml/filename                  "gray")
	(set-face-foreground 'sml/folder                    "gray")
	(set-face-foreground 'sml/global                    "gray")
	(set-face-foreground 'sml/minor-modes               "gray")
	(set-face-foreground 'sml/mule-info                 "gray")
	(set-face-foreground 'sml/outside-modified          "gray")
	(set-face-foreground 'sml/not-modified              "gray")
	(set-face-foreground 'sml/remote                    "gray")
	(set-face-foreground 'sml/sudo                      "gray")
	(set-face-foreground 'sml/line-number               "gray")
	(set-face-foreground 'sml/read-only                 "cyan")
)

(defun dove-highlight-text-terminal ()
    (set-face-foreground font-lock-variable-name-face   "lightgray")
    (set-face-foreground font-lock-string-face          "lightcyan")
    (set-face-foreground font-lock-keyword-face         "green")
    (set-face-foreground font-lock-function-name-face   "cyan")
    (set-face-foreground font-lock-comment-face         "darkgray")
    (set-face-foreground font-lock-type-face            "yellow")
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

    (set-face-background 'mode-line                     "white")
    (set-face-foreground 'mode-line                     "yellow")
    (set-face-background 'mode-line-inactive            "black")
    (set-face-foreground 'mode-line-inactive            "lightgray")

	(dove-sml-highlight-terminal)
	(add-hook 'flycheck-mode '(lambda ((set-face-foreground 'flycheck-error "red"))))
	(add-hook 'company-mode-hook 'dove-company-highlight-terminal)
	(add-hook 'prog-mode-hook 'dove-note-highlight-terminal)
)

(if (display-graphic-p)
	; GUI highlight
	(progn
		(add-hook 'prog-mode-hook 'dove-note-highlight)
		(evil-set-cursor-color "green")
		(set-face-background 'region "#5daf68")
		(set-face-foreground 'region "#2d3743")
	)
	; Terminal highlight
    (dove-highlight-text-terminal)
)

(provide 'init-highlight)
