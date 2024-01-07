(defun remove-terminal-control-characters (input-string)
  "Remove terminal control characters from the given INPUT-STRING."
  (replace-regexp-in-string "\e\\[[][0-9;]*[a-zA-Z]" "" input-string))

(defun dove-cody ()
  "Cody current directory."
  (interactive)
  (let ((cody-arg (assoc major-mode dove-cody-alist)))
    (message (remove-terminal-control-characters (shell-command-to-string
	 (if cody-arg
		 (concat "cody " (cdr cody-arg))
		 "cody -q"))))))

(setq dove-cody-alist
	  '(
		(odin-mode . "-ext .odin -q")
		(emacs-lisp-mode . "-ext .el -q")))

(add-to-list 'dove-cody-alist '(c-mode . "-ext .c .h -q"))
(add-to-list 'dove-cody-alist '(c++-mode . "-ext .c .cpp .h -q"))
(add-to-list 'dove-cody-alist '(csharp-mode . "-ext .cs -q"))

(defun dove-cody-setup-buffer ()
  "Cody setup buffer"
  (setq-local dove-cody-type (concat (buffer-name) (symbol-name major-mode))))

(add-hook 'odin-mode-hook 'dove-cody-setup-buffer)

(provide 'init-dove)
