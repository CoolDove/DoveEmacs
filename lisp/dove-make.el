(defun dmk--read-project-makefile ()
  "Read makefile by vc."
  (let ((root (vc-root-dir)))
	(if root
      (with-temp-buffer (insert-file-contents (concat root "/Makefile"))
		(buffer-string)
	  )
	  nil
	)
  )
)

(defun dmk--get-targets-in-makefile (source)
  "Extracts all targets from the Makefile source."
  (save-match-data
    (let ((target-regex "^\\([a-zA-Z0-9_.-]+\\):"))
      (with-temp-buffer
        (insert source)
        (goto-char (point-min))
        (cl-loop while (re-search-forward target-regex nil t)
                 collect (match-string 1)))))
)

(defun dmk--get-targets-from-project-makefile ()
  "Get targets."
  (let ((source (dmk--read-project-makefile)))
	(if source
		(dmk--get-targets-in-makefile source)
	    nil
	)
  )
)

(defun dove-counsel-make ()
  "Ivy Makefile targets."
  (interactive)
  (let ((targets (dmk--get-targets-from-project-makefile)))
	(if targets
		(ivy-read "Make:" targets :action (lambda (x) (dove-make (vc-root-dir) x)))
		(message "Invalid Makefile.")
	)
  )
)

(defun dove-make (directory target)
  "Make target"
  (let ((default-directory directory))
	(call-process "make" nil "*make*" nil target)
	(with-current-buffer "*make*"
	  (message (buffer-string))
	)
	(kill-buffer "*make*")
  )
)

(add-hook 'evil-after-load-hook (evil-define-key '(normal) 'global (kbd "C-S-B") 'dove-counsel-make))


(provide 'dove-make)
