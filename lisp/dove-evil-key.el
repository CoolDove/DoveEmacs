(evil-define-key '(insert) 'global (kbd "<tab>") 'dove-indent)
(evil-define-key '(insert) 'global (kbd "C-<backspace>") 'evil-delete-backward-word)

;; (evil-define-key '(normal visual motion) 'global (kbd "RET") 'linum-mode)

(evil-set-leader '(normal visual motion operator) (kbd "<tab>"))

(evil-define-key '(normal visual motion insert operator) 'global (kbd "<leader>r") 'read-only-mode)
(evil-define-key '(normal visual motion insert operator) 'global (kbd "<leader>g") 'magit)
(evil-define-key '(normal visual motion insert operator) 'global (kbd "<leader>a") 'org-agenda)

(evil-define-key '(normal visual motion insert) 'global (kbd "M-p") 'popup-kill-ring)

;; cursor movement and navigation
(evil-define-key '(normal visual motion) 'global
  (kbd "C-l") 'evil-end-of-line
  (kbd "C-h") 'evil-beginning-of-line
  (kbd "C-j") 'evil-scroll-down
  (kbd "C-k") 'evil-scroll-up
  (kbd "M-j") 'evil-scroll-line-down
  (kbd "M-k") 'evil-scroll-line-up
  (kbd "L")   'evil-forward-word-begin
  (kbd "H")   'evil-backward-word-begin
  (kbd "M-l") 'evil-forward-WORD-begin
  (kbd "M-h") 'evil-backward-word-begin
)

; split a new line
(evil-define-key 'normal 'global
  (kbd "K") '(lambda () (interactive) (insert-char 10 1)))

;; split windows
(defun dove-split-window-to-down ()
  (interactive)
  (evil-window-split)
  (evil-window-down 1)
)

(defun dove-split-window-to-right ()
  (interactive)
  (evil-window-vsplit)
  (evil-window-right 1)
)

(evil-define-key '(normal visual) 'global
  (kbd "C-M-j") 'dove-split-window-to-down
  (kbd "C-M-k") 'evil-window-split
  (kbd "C-M-h") 'evil-window-vsplit
  (kbd "C-M-u") 'evil-window-vsplit
  (kbd "C-M-l") 'dove-split-window-to-right
  (kbd "C-M-i") 'dove-split-window-to-right
)

;; bookmark operations
(evil-define-key '(normal visual motion) 'global
  (kbd "M")     'bookmark-set
  (kbd "M-m")   'bookmark-jump
  (kbd "C-M-r") 'bookmark-delete
)

;; window size
(evil-define-key '(normal visual motion) 'global
  (kbd "=") 'evil-window-increase-width
  (kbd "-") 'evil-window-decrease-width
  (kbd "+") 'evil-window-increase-height
  (kbd "_") 'evil-window-decrease-height
)

;; f number
(evil-define-key '(normal visual motion) 'global
  (kbd "<f3>")   'goto-last-change
  (kbd "C-<f3>") 'goto-last-change-reverse
  (kbd "<f5>")   'eval-region
  (kbd "C-<f5>") 'eval-expression
  (kbd "<f7>")   'dove-explorer-here
  (kbd "<f8>")   'shell-command
  (kbd "<S-f8>") '(lambda (cmd) (interactive "sshell command to string:") (insert (shell-command-to-string cmd)))
  (kbd "<f10>")  'toggle-menu-bar-mode-from-frame
  (kbd "<f12>")  'dws-last
)

(evil-define-key '(visual) 'global (kbd "?")   #'youdao-dictionary-search-at-point+)

(evil-define-key '(normal visual motion) 'global (kbd "C-x C-p") 'find-file-rg)

(provide 'dove-evil-key)
