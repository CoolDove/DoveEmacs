(defface linum-highlight
  '((t (:background "green" :foreground "black")))
  "linum highlight face"
  :group 'char-face
)
(defface linum-highlight-insert
  '((t (:background "yellow" :foreground "black")))
  "linum highlight face"
  :group 'char-face
)
(defface linum-highlight-evil-register
  '((t (:background "blue" :foreground "black")))
  "linum highlight face"
  :group 'char-face
)
(defface linum-highlight-evil-marker
  '((t (:background "yellow" :foreground "black")))
  "linum highlight face"
  :group 'char-face
)

(defun dove-evil-mode-string ()
  (cond ((evil-insert-state-p)  "!")
		((evil-visual-state-p)  "~")
		((evil-replace-state-p) "#")
		((evil-normal-state-p)  ">")
		(t " "))
)
 
(defun dove-evil-register-string ()
  (let ((num-len         (length (number-to-string (line-number-at-pos (point-max)))))
		(register-prefix (make-string (- (length (number-to-string (line-number-at-pos (point-max)))) 1) ?~)))
	(if evil-this-register
	    (concat register-prefix (format "~%s" (char-to-string evil-this-register)))
		"-")
  )
)

(defun dove-mark-char-p (char)
  (and (>= char ?a) (<= char ?z))
)

(defun dove-line-evil-mark-string (lnum)
  "get the line marker string"
  (let ((output ""))
	(dolist (item evil-markers-alist)
		(let ((mchar  (car item))
			  (marker (cdr item)))
		  (when (dove-mark-char-p mchar)
			(cond ((and (markerp marker) (eql lnum (line-number-at-pos (marker-position marker))))
				   ;; markers in current buffer
		            (setq output (format "%s." (char-to-string mchar)))
				  )
                  ((and (markerp marker) (eql lnum (line-number-at-pos (marker-position marker))))
				   ;; markers in current buffer
				  ) 
            )
		  )
	    )
	)
	(when (not (equal output ""))
	  (let ((mark-prefix (make-string (- (length (number-to-string (line-number-at-pos (point-max)))) 1) ?=)))
		(setq output (concat mark-prefix output))
	  )
	)
	output
  )
)

(defun dove-linum (line-number)
  (let ((distance  (- line-number dove-current-line))
		(df-string (format "%%%ds" (length (number-to-string (line-number-at-pos (point-max)))))))
	(if (eql distance 0)
		;; current line
		(cond (evil-this-register ;; register mode
					(propertize
						(dove-evil-register-string)
						'face 'linum-highlight-evil-register))

			  (t                  ;; default, current line number
					(propertize
						(format (concat df-string (dove-evil-mode-string)) (number-to-string dove-current-line))
						'face (if (evil-insert-state-p)
									'linum-highlight-insert
									'linum-highlight))))
		;; other lines
		(let ((mark-string (dove-line-evil-mark-string line-number)))
		  (cond ((equal mark-string "")
				  (propertize
					  (format (concat df-string " ")
						  (number-to-string (cond ((< distance 0) (* -1 distance))
												  ((> distance 0) distance))))
							  'face 'linum))
				  ((not (equal mark-string ""))
					  (propertize
						  mark-string 'face 'linum-highlight-evil-marker))))
	)
  )
)

(defvar dove-linum-mode-p nil
  "is dove linum mode enabled for now?")

(defun dove-linum-mode-on ()
  "init the dove linum mode"
    (defvar dove-current-line 0)
  
    (setq linum-format 'dove-linum)
    (global-linum-mode t)
	(linum-mode 1)
    (set-face-foreground 'linum "green")

    (defadvice linum-update (around my-linum-update)
    (let ((dove-current-line (line-number-at-pos)))
        ad-do-it))
    (ad-activate 'linum-update)
	(setq dove-linum-mode-p t)

    (global-linum-mode -1)
	(linum-mode -1)
)

(defun dove-linum-mode-off ()
  "close the dove linum mode"
  (global-linum-mode nil)
  (setq dove-linum-mode-p nil)
)

(provide 'dove-linum)
