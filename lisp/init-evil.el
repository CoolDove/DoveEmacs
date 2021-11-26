(use-package evil
  :init   (evil-mode 1)
  :ensure t
  :config (require 'dove-evil-key)
          (setq evil-auto-indent nil)
)

(use-package evil-surround
  :ensure t
  :after  (evil)
  :config (evil-surround-mode 1)
  :hook   (prog-mode . evil-surround-mode)
)

(require 'popup)
(require 'pos-tip)
(use-package evil-anzu
  :ensure t
  :after (evil)
  :hook (prog-mode . anzu-mode)
  :config (global-anzu-mode 1))

;; powerful evil
(defun dove-shrink-string (input &optional len)
  "shrink a string into one line"
  (when (not len)
	(setq len 20))
  (when (> len 140)
	(setq len 140))
  (let ((string-len (length input)))
	(if (< string-len len)
		input
	    (let ((before "")(after ""))
	      (dotimes (i (/ (- string-len 4) 2))
			(setq before (concat before (char-to-string (elt input i))))
			(setq after (concat after  (char-to-string (elt input (- string-len 1 i))))))
		  (concat before " .. " (reverse after))
		)
  ))
)

(defadvice evil-yank (after notice-yank)
  (when (> (- end beg) 1)
	(let ((output (concat
					(let ((length (- end beg)))
						(if (> length 20)
						(concat (buffer-substring beg (+ beg 10)) " ... " (buffer-substring (- end 10) end))
						(buffer-substring beg end)))
					"\nREG:"
					(if (equal evil-this-register nil)
						"default"
						(char-to-string evil-this-register)))))
	  (message output)
)))
(ad-activate 'evil-yank)

(defun dove-process-evil-mark-peek-string (peek)

)

(defun dove-list-evil-mark ()
  (interactive)
  (let ((output ""))
	(dolist (item evil-markers-alist)
	  (when (and (markerp (cdr item))
				 (dove-mark-char-p (car item)))
		(let ((pos (marker-position (cdr item))))
			  ;; TODO: finish this line, concat a output string
			  (setq output (format "%s#%c\n%d| %s ...\n"
								   output
								   (car item)
								   (line-number-at-pos pos)
								   (buffer-substring pos (min (+ pos 50 ) (point-max))))))
	  )
	)
	(popup-tip output)
))

(defun dove-goto-mark ()
  (interactive)
  (dove-list-evil-mark)
  (command-execute #'evil-goto-mark)
)

(defun dove-goto-markline ()
  (interactive)
  (dove-list-evil-mark)
  (command-execute #'evil-goto-markline)
)

(evil-define-key '(normal visual) 'global
  (kbd "`") #'dove-goto-mark
  (kbd "'") #'dove-goto-markline
)

(provide 'init-evil)
