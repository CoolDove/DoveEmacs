(defvar dove-welcome-buffer nil)

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

(defun dove-welcome-init ()
  (let ((buf (dove-get-welcome-buffer)))
	(set-buffer buf)
	(delete-region (point-min) (point-max))
	(insert "+-----------------------------------------------------------------------+\n")
	(insert "+ oooooooooooo ooo        ooooo       .o.         .oooooo.   .oooooo..o +\n")
	(insert "+ `888'     `8 `88.       .888'      .888.       d8P'  `Y8b d8P'    `Y8 +\n")
	(insert "+  888          888b     d'888      .8'888.     888         Y88bo.      +\n")
	(insert "+  888oooo8     8 Y88. .P  888     .8' `888.    888          `'Y8888o.  +\n")
	(insert "+  888    '     8  `888'   888    .88ooo8888.   888              `'Y88b +\n")
	(insert "+  888       o  8    Y     888   .8'     `888.  `88b    ooo oo     .d8P +\n")
	(insert "+ o888ooooood8 o8o        o888o o88o     o8888o  `Y8bood8P' 8''88888P'  +\n")
	(insert "+-----------------------------------------------------------------------+\n")
	(insert "|                              ..:::::::::..                            |\n")
	(insert "|                         ..:::|b::::::::::::::..                       |\n")
	(insert "|                      .:::::::\\&&8bobo::::::::::::.                    |\n")
	(insert "|                    .::::::::::>88d88888888b::::::::.                  |\n")
	(insert "|                  .::::::::::::d888888aa888888b:::::::.                |\n")
	(insert "|                 :::::::::::::d88888888888888888::::::::               |\n")
	(insert "|                :::::::::::::d888' '88888' '88888::::::::              |\n")
	(insert "|               ::::::::::::::888| O |888| O |8888:::::::::             |\n")
	(insert "|              .:::::::::::::d8888. .88888. .88888:::::::::.            |\n")
	(insert "|              ::::::::::::::888888888888888888888::::::::::            |\n")
	(insert "|              ::::::::::::-'  '\\88888888888888888::::::::::            |\n")
	(insert "|              ::::::::::/_~-----)8888888888888888::::::::::            |\n")
	(insert "|              '::::::::::::\\__ /88888888888888888:::::::::'            |\n")
	(insert "|               ::::::::::::::q8888888888888888888:::::::::             |\n")
	(insert "|                ::::::::::::::88888888888888888888:::::::              |\n")
	(insert "|                 :::::::::::::888888888888888888888:::::               |\n")
	(insert "|                  ':::::::::::8888888888888888888888b:'                |\n")
	(insert "|                    ':::::::::d88888888888888888888b'                  |\n")
	(insert "|                      ':::::::88888888888888888888'                    |\n")
	(insert "|                         ''::8888888888888888p''                       |\n")
	(insert "|                              '9888888888:'                            |\n")
	(insert "|                                                                       |\n")
	(insert "+-----------------------------------------------------------------------+\n")

	(insert "==>\n")
	(insert "Bookmarks\n")
	(insert "---------\n")

	(require 'bookmark)
	(bookmark-maybe-load-default-file)
	(dolist (mark bookmark-alist)
	  (insert-button (concat " +> [" (car mark) "] (" (alist-get 'filename (cdr mark)) ")\n") 
	       'action 'dove-open-mark
		   'mark-name (car mark))
	)

	(read-only-mode))
    dove-welcome-buffer
)


(setq-default initial-buffer-choice 'dove-get-welcome-buffer)

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
