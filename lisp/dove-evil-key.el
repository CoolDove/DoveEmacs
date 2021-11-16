
; (setq stgroup-movement '(normal visual motion))
; (setq stgroup-insert '(insert))

(evil-define-key '(insert) 'global (kbd "<tab>") 'dove-indent)

(evil-define-key '(normal visual motion) 'global (kbd "RET") 'linum-mode)

;; TODO: leader key here
(evil-set-leader '(normal visual motion operator) (kbd "<tab>"))

;; cursor movement and navigation
(evil-define-key '(normal visual motion) 'global
  (kbd "C-l") 'evil-end-of-line
  (kbd "C-h") 'evil-beginning-of-line
  (kbd "C-j") 'evil-scroll-down
  (kbd "C-k") 'evil-scroll-up
  (kbd "M-j") 'evil-scroll-line-down
  (kbd "M-k") 'evil-scroll-line-up
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

;; f number
(evil-define-key '(normal visual motion) 'global
  (kbd "<f2>")   'lsp-rename
  (kbd "<f3>")   'describe-variable
  (kbd "C-<f3>") 'describe-function
  (kbd "<f4>")   'tab-close
  (kbd "C-<f4>") 'tab-close
  (kbd "<f5>")   'eval-region
  (kbd "C-<f5>") 'eval-expression
  (kbd "<f8>")   'lsp-pind-declaration
  (kbd "<f12>")  'lsp-find-definition
  (kbd "<f10>")  'toggle-menu-bar-mode-from-frame
)

;; file and buffer operations
(evil-define-key '(normal visual motion) 'global
  (kbd "<leader>p") 'find-file
  (kbd "<leader>b") 'switch-to-buffer
)

;; tab control
(evil-define-key '(normal visual operator emacs motion) 'global
  (kbd "<leader>n") 'tab-new
  (kbd "C-i") 'tab-next
  (kbd "C-u") 'tab-previous
  (kbd "<leader>r") 'tab-rename
)

(if (display-graphic-p)
	(evil-define-key '(visual) 'global (kbd "?")   'youdao-dictionary-search-at-point-tooltip)
    ;; else
    (evil-define-key '(visual) 'global (kbd "?")   'youdao-dictionary-search-at-point+)
)

; auto save after exiting from Insert Mode, but it's terribly slow
;(defun dove-auto-save-after-edit ()
  ;(add-hook 'evil-insert-state-exit-hook 'save-buffer)
;)
;(add-hook 'markdown-mode-hook 'dove-auto-save-after-edit)
;(add-hook 'org-mode-hook 'dove-auto-save-after-edit)

(provide 'dove-evil-key)
