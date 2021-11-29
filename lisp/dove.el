(defun hello-dove ()
       "a test hello function"
       (interactive)
       (message "hello dove"))

(defun dove-open-file (file)
	   "a dove excutor"
	   (interactive "Fchoose a file: ")
	   (find-file-noselect file t))

(add-hook 'evil-operator-state-entry-hook 'hello-dove)

(defadvice evil-use-register (around evil-pop-registers)
  (popup-tip "hello")
)
(ad-activate #'evil-use-register)

;; a simple peek lib
(use-package quick-peek
  :ensure t)
(quick-peek-hide "hello this is a test")

(provide 'dove)
