(defvar dove-dotodo-path "~/.emacs.d/.dotodo")
(defvar dove-welcome-buffer nil)

(if (display-graphic-p)
(defface dove-button-face
  '((t (:foreground "green")))
  "linum high-light face"
  :group 'char-face
)
(defface dove-button-face
  '((t (:background "black" :foreground "green")))
  "linum high-light face"
  :group 'char-face
)
)


(if (display-graphic-p)
	(defface dove-button-face-highlight
	'((t (:box t :foreground "lightblue")))
	"linum highlight face"
	:group 'char-face
	)
	(defface dove-button-face-highlight
	'((t (:background "yellow" :foreground "black")))
	"linum highlight face"
	:group 'char-face
	)
)

(defface dove-button-face-highlight
  '((t (:background "yellow" :foreground "black")))
  "linum highlight face"
  :group 'char-face
)

(define-button-type 'dove-button
  'face 'dove-button-face
  'mouse-face 'dove-button-face-highlight
  'keymap (let ((map (make-sparse-keymap)))
			(define-key map (kbd "RET") 'push-button)
			(define-key map [mouse-1] 'push-button)
			(define-key map [mode-line mouse-1] 'push-button)
			(define-key map [header-line mouse-1] 'push-button)
			map)
  'help-echo "mouse-1/RET to push the button"
  'action #'ignore
)

(defun dove-welcome-buffer-create ()
  (generate-new-buffer "*DovWv*"))

(defun dove-get-welcome-buffer ()
  (if (or (equal dove-welcome-buffer nil) (and (equal (buffer-name dove-welcome-buffer) nil)))
	  (progn
		(setq dove-welcome-buffer (dove-welcome-buffer-create))
		(dove-welcome-init)
	  )
	  dove-welcome-buffer)
)

(defun dove-open-mark (button)
  (bookmark-jump (button-get button 'mark-name)))

(defun dove-welcome ()
  (interactive)
  (switch-to-buffer (dove-get-welcome-buffer))
)

(defun dove-welcdraw-logo ()
    (insert (propertize (concat
	"+-----------------------------------------------------------------------+\n"
	"+ oooooooooooo ooo        ooooo       .o.         .oooooo.   .oooooo..o +\n"
	"+ `888'     `8 `88.       .888'      .888.       d8P'  `Y8b d8P'    `Y8 +\n"
	"+  888          888b     d'888      .8'888.     888         Y88bo.      +\n"
	"+  888oooo8     8 Y88. .P  888     .8' `888.    888          `'Y8888o.  +\n"
	"+  888    '     8  `888'   888    .88ooo8888.   888              `'Y88b +\n"
	"+  888       o  8    Y     888   .8'     `888.  `88b    ooo oo     .d8P +\n"
	"+ o888ooooood8 o8o        o888o o88o     o8888o  `Y8bood8P' 8''88888P'  +\n"
	"+-----------------------------------------------------------------------+\n"
	"|                              .i:::::::::..                            |\n"
	"|                         ..:::|bo;::::::::::::..                       |\n"
	"|                      .:::::::\\&&aaooc::::::::::::.                    |\n"
	"|                    .::::::::::)88d88888888b::::::::.                  |\n"
	"|                  .::::::::::::d88888888888888b:::::::.                |\n"
	"|                 :::::::::::::d88ooa8b8d8coo8888::::::::               |\n"
	"|                :::::::::::::d888' '88888' '88888::::::::              |\n"
	"|               ::::::::::::::888| @ |888| @ |8888:::::::::             |\n"
	"|              .:::::::::::::d8888. .88888. .88888:::::::::.            |\n"
	"|              ::::::::::::::888888888888888888888::::::::::            |\n"
	"|              :::::::::::;-'  '\\88888888888888888::::::::::            |\n"
	"|              ::::::::::/_,-----)8888888888888888::::::::::            |\n"
	"|              '::::::::::::\\__ /88888888888888888:::::::::'            |\n"
	"|               ::::::::::::::q8888888888888888888:::::::::             |\n"
	"|                ::::::::::::::88888888888888888888:::::::              |\n"
	"|                 :::::::::::::888888888888888888888:::::               |\n"
	"|                  ':::::::::::8888888888888888888888b:'                |\n"
	"|                    ':::::::::d88888888888888888888b'                  |\n"
	"|                      ':::::::88888888888888888888'                    |\n"
	"|                         ''::8888888888888888p''                       |\n"
	"|a dove, happy coding dove.    '9888888888:'                            |\n"
	"+-----------------------------------------------------------------------+\n"
	)
	'face 'linum))
)

(defun dove-welcdraw-bookmarks ()
	(dove-welcdraw-title "Bookmarks")
	(require 'bookmark)
	(bookmark-maybe-load-default-file)
	(dolist (mark bookmark-alist)
	  (insert-button (concat " |> [ " (car mark) " ] (" (alist-get 'filename (cdr mark)) ")") 
	       'action 'dove-open-mark
		   'mark-name (car mark)
		   'type 'dove-button)
	  (insert-char 10 1)
	)
)


(defun dove-welcdraw-title (tname)
  (when (stringp tname)
	(insert (propertize
		(concat
			"==>\n"
			tname "\n" 
			(make-string (length tname) ?-)
			"\n")
		'face 'font-lock-keyword-face
))))

(defun dove-edit-dotodo (button)
    (switch-to-buffer (find-file-noselect dove-dotodo-path))
)

(defun dove-welcdraw-todo ()
  (dove-welcdraw-title "Todo")
  (let ((point-todo-start (point))
		(dotodo-exists-p (file-exists-p dove-dotodo-path)))
	(when dotodo-exists-p
	  (insert-file-contents dove-dotodo-path)
	  (let ((point-todo-end (point-max)))
		(message (format "%d to %d" point-todo-start point-todo-end))
		(if (eql point-todo-start point-todo-end)   ; .dotodo exsits, but it is empty
			(insert-button "todo is empty, click to edit\n" 'action 'dove-edit-dotodo 'type 'dove-button)
			(make-button point-todo-start point-todo-end
						'action 'dove-edit-dotodo 'type 'dove-button)
		)
	  )
	)
	(unless dotodo-exists-p
		(insert-button "todo is empty, click to edit\n" 'action 'dove-edit-dotodo 'type 'dove-button)
	)
  )
)

(defun dove-welcome-update ()
  (interactive)
  (dove-welcome-draw (dove-get-welcome-buffer))
)

(defun dove-welcome-draw (buf)
	(with-current-buffer (dove-get-welcome-buffer)
	    (setq buffer-read-only nil)

		(delete-region (point-min) (point-max))

		(dove-welcdraw-logo)
		(insert "\n")
		(dove-welcdraw-bookmarks)
		(insert "\n")
		(dove-welcdraw-todo)
		(beginning-of-buffer)

	    (setq buffer-read-only t))
	buf
)

(defun dove-welcome-init ()
  (let ((buf (dove-get-welcome-buffer)))
	(dove-welcome-draw buf)
	(with-current-buffer buf
        (toggle-truncate-lines 1))
  )
  (dove-get-welcome-buffer)
)

(setq-default initial-buffer-choice 'dove-get-welcome-buffer)

(add-hook 'after-save-hook
	'(lambda ()
	   (when (equal (buffer-name (current-buffer)) ".dotodo")
		 (dove-welcome-update))
))

(provide 'dove-welcome)

; |                              ..:::::::::..                            |
; |                         ..:::aad8888888baa:::..                       |
; |                      .::::d:?88888888888?::8b::::.                    |
; |                    .:::d8888:?88888888??a888888b:::.                  |
; |                  .:::d8888888a8888888aa8888888888b:::.                |
; |                 ::::dP::::::::88888888888::::::::Yb::::               |
; |                ::::dP:::::::::Y888888888P:::::::::Yb::::              |
; |               ::::d8:::::::::::Y8888888P:::::::::::8b::::             |
; |              .::::88::::::::::::Y88888P::::::::::::88::::.            |
; |              :::::Y8baaaaaaaaaa88P:T:Y88aaaaaaaaaad8P:::::            |
; |              :::::::Y88888888888P::|::Y88888888888P:::::::            |
; |              ::::::::::::::::888:::|:::888::::::::::::::::            |
; |              ':::::::::::::::8888888888888b::::::::::::::'            |
; |               :::::::::::::::88888888888888::::::::::::::             |
; |                :::::::::::::d88888888888888:::::::::::::              |
; |                 ::::::::::::88::88::88:::88::::::::::::               |
; |                  '::::::::::88::88::88:::88::::::::::'                |
; |                    '::::::::88::88::P::::88::::::::'                  |
; |                      '::::::88::88:::::::88::::::'                    |
; |                         '~:::::::::::::::::::''                       |
; |                              '':::::::::''                            |
; |                                                                       |
