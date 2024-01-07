(evil-define-key '(insert) 'global (kbd "<tab>") 'dove-indent)

(evil-define-key '(insert) 'global (kbd "C-<backspace>") 'evil-delete-backward-word)

(evil-define-key '(insert) 'global (kbd "C-<return>") #'(lambda () (interactive) (evil-insert-newline-above)))
(evil-define-key '(insert) 'global (kbd "C-S-<return>") #'(lambda () (interactive) (evil-insert-newline-below)))

(evil-define-key '(normal visual) prog-mode-map (kbd "C-S-l") 'display-line-numbers-mode)

(evil-set-leader '(normal visual motion operator) (kbd "<tab>"))

(evil-define-key '(normal visual motion insert operator) 'global
  (kbd "<leader>r") #'read-only-mode
  (kbd "<leader>g") #'magit)

(evil-define-key 'emacs occur-mode-map
  (kbd "j") #'(lambda () (interactive) (occur-next))
  (kbd "k") #'(lambda () (interactive) (occur-prev)))

;; cursor movement and navigation
(evil-define-key '(normal visual motion) 'global
  (kbd "C-l") 'evil-end-of-line
  (kbd "C-h") 'evil-beginning-of-line
  (kbd "C-d") 'evil-scroll-down
  (kbd "C-u") 'evil-scroll-up
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

(evil-define-key '(normal visual emacs) 'global
  (kbd "C-M-j") 'dove-split-window-to-down
  (kbd "C-M-k") 'evil-window-split
  (kbd "C-M-h") 'evil-window-vsplit
  (kbd "C-M-l") 'dove-split-window-to-right
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

;; edit
(evil-define-key '(normal visual) 'global
  (kbd "M-p") 'yank-from-kill-ring
)

(evil-define-key '(normal visual operator motion) 'global (kbd "M-u") 'evil-redo)

;; f number
(evil-define-key '(normal visual motion) 'global
  (kbd "<f2>")   'dove-paste-post
  (kbd "C-<f2>") 'dove-snip-save
  (kbd "<f3>")   'goto-last-change
  (kbd "C-<f3>") 'goto-last-change-reverse
  (kbd "<f4>")   'eval-region
  (kbd "<f5>")   'eval-region
  (kbd "C-<f5>") 'eval-expression
  (kbd "<f7>")   'dove-wterminal-here
  (kbd "<f8>")   'shell-command
  (kbd "<S-f8>") '(lambda (cmd) (interactive "sshell command to string:") (insert (shell-command-to-string cmd)))
  (kbd "<f10>")  'toggle-menu-bar-mode-from-frame
  ;; (kbd "<f12>")  'dws-last
  (kbd "<f12>")  'lsp-describe-thing-at-point
)

;; 
(evil-define-key '(normal visual motion ) 'global
  (kbd "M-i") #'lsp-ivy-workspace-symbol)

;; keybindings for specific mode
(evil-define-key '(normal visual motion) markdown-mode-map
  (kbd "C-k") #'outline-previous-heading
  (kbd "C-j") #'outline-next-heading
  (kbd "<leader>h") #'outline-toggle-children
  (kbd "<leader>l") #'(lambda () (interactive) (insert "$$") (backward-char) (evil-insert-state))
)

(evil-define-key '(normal visual) 'global
  (kbd "M-r") #'anzu-query-replace-regexp)

(provide 'dove-evil-key)
