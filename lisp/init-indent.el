(setq dove-indent-length 4)
(defun dove-indent ()
	   (interactive)
	   (insert-char 32 (- dove-indent-length (mod (current-column) dove-indent-length))))

(setq-default tab-width dove-indent-length)
(defun c-mod-indent-adjust ()
  (setq c-basic-offset dove-indent-length
        c-indent-level dove-indent-length
        c-default-style "user"
        c-toggle-auto-state nil
        c-syntactic-indentation nil
        indent-tabs-mode nil))

(add-hook 'c-mode-common-hook 'c-mod-indent-adjust)

(provide 'init-indent)
