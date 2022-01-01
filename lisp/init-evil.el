(require 'pulse)
(defface dove/evil-yank-flash
  '((t :foreground "black"
	   :background "green"
	   :underline t))
  "evil yank flash")

(defun dove/evil-yank-advice (orig-fn beg end &rest args)
  (if (not (eq evil-state 'visual))
      (pulse-momentary-highlight-region beg end 'dove/evil-yank-flash))
  (apply orig-fn beg end args))

(use-package evil
  :init   (evil-mode 1)
  :ensure t
  :config (require 'dove-evil-key)
          (setq evil-auto-indent t
		        evil-shift-width 4
				evil-want-C-w-in-emacs-state t
				evil-search-module 'evil-search)
		  (evil-set-undo-system 'undo-tree)
		  (advice-add 'evil-yank :around 'dove/evil-yank-advice))

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

(use-package evil-visualstar
  :ensure t
  :hook (evil-local-mode . evil-visualstar-mode))

(use-package popup
  :ensure t)
(use-package pos-tip
  :ensure t)

(use-package evil-anzu
  :ensure t
  :after (evil)
  :hook (evil-local-mode . anzu-mode)
  :config (global-anzu-mode 1))

;; Make sure that the bash executable can be found
(setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "C:/Program Files/Git/bin")

(provide 'init-evil)
