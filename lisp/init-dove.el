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


(defun dove-ivy ()
  "Dove Ivy function."
  (interactive)
  (ivy-read "Choose an option: "
            '("Option 1" "Option 2" "Option 3")
            :action (lambda (x)
                      (message "You selected: %s" x))))


(defun dove-lsp-references ()
  "ddd"
  (interactive)
  (lsp-request-async "textDocument/references" (lsp--make-reference-params nil nil)
    (lambda (response)
       (if response
		   (ivy-read "Locations:"
					 (xref-items-to-ivy (lsp--locations-to-xref-items response))
					 :action (lambda (x) (message "You choosed %s" x))
					 )
         (message "No references found."))) )
)

(defun xref-items-to-ivy (xref-items)
  "sss"
    (let ((current xref-items) (result '()))
				(while current
				  (let ((location (xref-item-location (car current))))
					(push (format "%s: %d" (xref-location-group location) (xref-location-line location)) result) )
				  (setq current (cdr current)))
				(nreverse result)
				)
)

(lambda (response)
       (if response
           (message "References: %s" response)
         (message "No references found.")))

(global-set-key (kbd "C-c C-o") 'dove-lsp-references)

(provide 'init-dove)
