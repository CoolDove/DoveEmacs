;; (defun dove-note-highlight ()
  ;; "set dove note highlight for current buffer"
  ;; (font-lock-add-keywords nil '(("\\<\\(FIXME:\\)" 1 '(:foreground "red"     :box t) t)))
  ;; (font-lock-add-keywords nil '(("\\<\\(NOTE:\\)"  1 '(:foreground "yellow"  :box t) t)))
  ;; (font-lock-add-keywords nil '(("\\<\\(TODO:\\)"  1 '(:foreground "#22dfa0" :box t) t)))
  ;; (font-lock-add-keywords nil '(("\\(@[A-Za-z][A-Za-z]*:\\)"  1 '(:background "#e66735" :foreground "#2d3743" :box t) t)))
;; )

;; (defun dove-company-highlight-terminal ()
  ;; "adjust highlight for company mode in terminal"
  ;; (set-face-background 'company-tooltip "darkgray")
;; )

;; (if (display-graphic-p)
	;; ; GUI highlight
	;; (progn
		;; (add-hook 'prog-mode-hook 'dove-note-highlight)
		;; (evil-set-cursor-color "green yellow")
        ;; (set-face-foreground font-lock-comment-face "DarkSeaGreen4")
		;; (set-face-background 'region "#347846")
		;; (set-face-foreground 'region "#efefdd")
	    ;; (set-face-background 'show-paren-match "#00000000")
	    ;; (set-face-attribute  'show-paren-match nil :underline t)
	    ;; (set-face-foreground 'show-paren-match "#00ea66")
	    ;; ;; (set-face-attribute 'mode-line nil :box t)
	;; )
;; )

(provide 'init-highlight)
