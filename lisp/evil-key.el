(evil-define-key '(insert) 'global (kbd "<tab>") 'dove-indent)

;; cursor movement and navigation
(evil-define-key '(normal visual) 'global (kbd "C-l") 'evil-end-of-line)
(evil-define-key '(normal visual) 'global (kbd "C-h") 'evil-beginning-of-line)

(evil-define-key '(normal visual) 'global (kbd "C-j") 'evil-scroll-down)
(evil-define-key '(normal visual) 'global (kbd "C-k") 'evil-scroll-up)

(evil-define-key '(normal visual) 'global (kbd "M-j") 'evil-scroll-line-down)
(evil-define-key '(normal visual) 'global (kbd "M-k") 'evil-scroll-line-up)

;; swtich between windows
(evil-define-key '(normal visual) 'global (kbd "M-w j") 'evil-window-down)
(evil-define-key '(normal visual) 'global (kbd "M-w k") 'evil-window-up)
(evil-define-key '(normal visual) 'global (kbd "M-w h") 'evil-window-left)
(evil-define-key '(normal visual) 'global (kbd "M-w l") 'evil-window-right)

;; split windows
(evil-define-key '(normal visual) 'global (kbd "C-M-j") 'evil-window-split)
(evil-define-key '(normal visual) 'global (kbd "C-M-k") 'evil-window-split)
(evil-define-key '(normal visual) 'global (kbd "C-M-h") 'evil-window-vsplit)
(evil-define-key '(normal visual) 'global (kbd "C-M-l") 'evil-window-vsplit)

;; bookmark operations
(evil-define-key '(normal visual operator) 'global (kbd "C-m") 'bookmark-set)
(evil-define-key '(normal visual operator) 'global (kbd "M-m") 'bookmark-jump)
(evil-define-key '(normal visual operator) 'global (kbd "C-M-r") 'bookmark-delete)

;; window size
(evil-define-key '(normal visual) 'global (kbd "=") 'evil-window-increase-width)
(evil-define-key '(normal visual) 'global (kbd "-") 'evil-window-decrease-width)
(evil-define-key '(normal visual) 'global (kbd "+") 'evil-window-increase-height)
(evil-define-key '(normal visual) 'global (kbd "_") 'evil-window-decrease-height)

;; f number
(evil-define-key '(normal visual) 'global (kbd "<f2>")  'lsp-rename)
(evil-define-key '(normal visual) 'global (kbd "<f3>")  'describe-variable)  ;@Temp
(evil-define-key '(normal visual) 'global (kbd "C-<f3>")  'describe-function);@Temp
(evil-define-key '(normal visual) 'global (kbd "<f4>")  'eshell)

(evil-define-key '(normal visual) 'global (kbd "<f5>")  'eval-region)

(evil-define-key '(normal visual) 'global (kbd "<f8>")  'lsp-pind-declaration)
(evil-define-key '(normal visual) 'global (kbd "<f12>") 'lsp-find-definition)
(evil-define-key '(normal visual) 'global (kbd "<f10>") 'toggle-menu-bar-mode-from-frame)

;; other
(evil-define-key '(normal visual) 'global (kbd "C-p") 'find-file)
(evil-define-key '(normal visual) 'global (kbd "C-b") 'switch-to-buffer)
(evil-define-key '(normal visual) 'global (kbd "C-u") 'switch-to-prev-buffer)
(evil-define-key '(normal visual) 'global (kbd "C-i") 'switch-to-next-buffer)
(evil-define-key '(normal visual) 'global (kbd "?")   'youdao-dictionary-search-at-point-tooltip)

;(defun dove-auto-save-after-edit ()
  ;(add-hook 'evil-insert-state-exit-hook 'save-buffer)
;)
;(add-hook 'markdown-mode-hook 'dove-auto-save-after-edit)
;(add-hook 'org-mode-hook 'dove-auto-save-after-edit)

(provide 'evil-key)
