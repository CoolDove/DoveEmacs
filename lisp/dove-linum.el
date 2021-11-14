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

(defun dove-evil-mode-string ()
  (cond ((evil-insert-state-p)  "@")
		((evil-visual-state-p)  ">")
		((evil-replace-state-p) "=")
		((evil-normal-state-p)  "~")
		(t " "))
)

(defun dove-linum (line-number)
  (let ((distance (- line-number dove-current-line))
		(df-string (format "%%%ds" (+ (length (number-to-string (line-number-at-pos (point-max)))) 1))))
	(if (eql distance 0)
		;; current line
		(propertize
		    (format (concat df-string (dove-evil-mode-string)) (number-to-string dove-current-line))
		    'face (if (evil-insert-state-p) 'linum-highlight-insert
					                        'linum-highlight))
	    ;; other lines
		(propertize
		    (format (concat df-string " ") (number-to-string (cond ((< distance 0) (* -1 distance))
												                   ((> distance 0) distance))))
		    'face 'linum)
	)
))

(if (display-graphic-p)
	;; GUI mode
	(progn
	  (setq display-line-numbers-type 'relative)
	  (global-display-line-numbers-mode t))
    ;; terminal mode
	(defvar dove-current-line 0)
	(defvar dove-line-number-length 0)

    (setq linum-format 'dove-linum)
	(global-linum-mode t)
	(set-face-foreground 'linum "green")

	(defadvice linum-update (around my-linum-update)
	(let ((dove-current-line (line-number-at-pos)))
		ad-do-it))
	(ad-activate 'linum-update)
)

(provide 'dove-linum)
