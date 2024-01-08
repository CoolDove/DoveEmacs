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
