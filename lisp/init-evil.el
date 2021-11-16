(use-package evil
  :init   (evil-mode 1)
  :ensure t
  :config (require 'dove-evil-key)
          (setq evil-auto-indent nil)
)

(use-package evil-surround
  :ensure t
  :after  (evil)
  :config (evil-surround-mode)
  :hook   (prog-mode . evil-surround-mode)
)

(provide 'init-evil)
