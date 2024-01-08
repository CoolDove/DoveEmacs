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
          (evil-set-initial-state 'eshell-mode 'emacs)
          (evil-set-initial-state 'xref--xref-buffer-mode 'emacs)
          (evil-set-cursor-color "green yellow"))

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
        (evil-snipe-override-mode)
        (setq evil-snipe-scope 'buffer)
)

(use-package evil-anzu
  :ensure t
  :after (evil)
  :hook (evil-local-mode . anzu-mode)
  :config (global-anzu-mode 1))

(use-package undo-tree
  :after (evil)
  :ensure t
  :hook (evil-local-mode . turn-on-undo-tree-mode))

(provide 'init-evil)
