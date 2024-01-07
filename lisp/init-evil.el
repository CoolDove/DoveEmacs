;; (require 'pulse)
;; (defface dove/evil-yank-flash
  ;; '((t :background "orange"))
  ;; "evil yank flash")

;; (defun dove/evil-yank-advice (orig-fn beg end &rest args)
  ;; (if (not (eq evil-state 'visual))
      ;; (pulse-momentary-highlight-region beg end 'dove/evil-yank-flash))
  ;; (apply orig-fn beg end args))

(use-package evil
  :init   (evil-mode 1)
  :ensure t
  :config (require 'dove-evil-key)
          (setq evil-auto-indent t
		        evil-shift-width 4
				evil-want-C-w-in-emacs-state t
				evil-search-module 'evil-searcho)
		  (add-hook 'evil-insert-state-entry-hook #'(lambda () (setq display-line-numbers-type t)))
		  (add-hook 'evil-insert-state-exit-hook #'(lambda () (setq display-line-numbers-type 'relative)))
		  (evil-set-undo-system 'undo-tree)
          (evil-set-initial-state 'eshell-mode 'emacs))

(use-package undo-tree
  :after (evil)
  :ensure t
  :hook (evil-local-mode . turn-on-undo-tree-mode))

(use-package evil-surround
  :ensure t
  :after  (evil)
  :config (evil-surround-mode 1)
  :hook   (evil-local-mode . evil-surround-mode)
)

(use-package evil-snipe
  :after  (evil)
  :ensure t
  :init (evil-snipe-mode)
          (generate-new-buffer "HelloDove")
          (evil-snipe-override-mode)
          (setq evil-snipe-scope 'buffer)
)

(evil-set-cursor-color "green yellow")

(use-package evil-anzu
  :ensure t
  :after (evil)
  :hook (evil-local-mode . anzu-mode)
  :config (global-anzu-mode 1))

;; Make sure that the bash executable can be found

;; (setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
;; (setq shell-file-name explicit-shell-file-name)
;; (add-to-list 'exec-path "C:/Program Files/Git/bin")


(provide 'init-evil)
