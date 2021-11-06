(defun dove-note-highlight ()
  "set dove note highlight for current buffer"
  (font-lock-add-keywords nil '(("\\<\\(FIXME:\\)" 1 '(:foreground "red"     :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(NOTE:\\)"  1 '(:foreground "yellow"  :box t) t)))
  (font-lock-add-keywords nil '(("\\<\\(TODO:\\)"  1 '(:foreground "#22dfa0" :box t) t)))
  (font-lock-add-keywords nil '(("\\(@[A-Za-z][A-Za-z]*:\\)"  1 '(:background "#116576" :foreground "grey" :box t) t)))
)

(add-hook 'prog-mode-hook 'dove-note-highlight)

(provide 'init-highlight)
