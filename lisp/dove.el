(defun hello-dove ()
       "a test hello function"
       (interactive)
       (message-box "hello dove"))

(defun dove-open-file (file)
	   "a dove excutor"
	   (interactive "Fchoose a file: ")
	   (find-file-noselect file t))

(provide 'dove)
