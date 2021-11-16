(use-package evil
  :init   (evil-mode 1)
  :ensure t
  :config (require 'dove-evil-key)
          (setq evil-auto-indent nil)
)

(use-package evil-surround
  :ensure t
  :after  (evil)
  :config (evil-surround-mode 1)
  :hook   (prog-mode . evil-surround-mode)
)

(use-package evil-anzu
  :ensure t
  :after (evil)
  :hook (prog-mode . anzu-mode)
  :config (global-anzu-mode 1))

(provide 'init-evil)
