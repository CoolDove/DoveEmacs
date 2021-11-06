(defun hello-dove ()
       "a test hello function"
       (interactive)
       (message-box "hello dove"))

(defun dove-open-file (file)
	   "a dove excutor"
	   (interactive "Fchoose a file: ")
	   (find-file-noselect file t))

;(add-hook 'evil-insert-state-entry-hook 'line-number-current-line)
;(add-hook 'evil-insert-state-exit-hook 'hello-dove)

(provide 'dove)
