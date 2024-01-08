
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
  (dmk--get-targets-in-makefile (dmk--read-project-makefile))
)

(defun dove-counsel-make ()
  "Ivy Makefile targets."
  (interactive)
  (let ((targets (dmk--get-targets-from-project-makefile)) (default-directory (vc-root-dir)))
	(if targets
		(ivy-read "Make:" targets :action (lambda (x) (shell-command (concat "make " x))))
		(message "Invalid Makefile.")
	)
  )
)

(add-hook 'evil-after-load-hook (evil-define-key '(normal) 'global (kbd "C-S-B") 'dove-counsel-make))


(provide 'dove-make)
