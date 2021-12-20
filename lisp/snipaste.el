(defun dove-paste-post ()
  (interactive)
  (shell-command "Snipaste.exe paste"))

(defvar dove-snip-dir nil
  "the target dir that snip will be saved to")
(defvar dove-snip-name nil
  "the file that snip will be saved to")

(defun dove-set-snip-dir (dir)
  (interactive "Dsnip dir: ")
  (setq dove-snip-dir dir))
(defun dove-set-snip-name (file)
  (interactive "ssnip target: ")
  (setq dove-snip-target file))

(defun dove-snip-save-to-target ()
  (interactive)
  (suspend-frame)
  (shell-command (concat "Snipaste.exe snip -o " dove-snip-dir dove-snip-target ".png")))

(defun dove-snip-save ()
 (interactive)
  (suspend-frame)
  (shell-command "Snipaste.exe snip"))

(defun dove-whiteboard ()
  (interactive)
  (suspend-frame)
  (shell-command "Snipaste.exe whiteboard"))

(provide 'snipaste)
