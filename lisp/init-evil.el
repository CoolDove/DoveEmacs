(use-package evil
  :init   (evil-mode 1)
  :ensure t
  :config (require 'dove-evil-key)
          (setq evil-auto-indent nil)
		  (evil-set-undo-system 'undo-tree))

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
(setq explicit-shell-file-name "F:/softw/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "F:/soft/Git/bin")

(provide 'init-evil)
