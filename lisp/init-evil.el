(use-package evil
  :init   (evil-mode 1)
  :ensure t
  :config (require 'evil-key)
          (add-hook 'evil-yank-hook 'dove-msg-yank)
)

(use-package evil-surround
  :ensure t
  :after  (evil)
  :config (evil-surround-mode)(evil-set-cursor-color "Green")
  :hook   (prog-mode . evil-surround-mode)
)

(add-hook 'evil-insert-repeat-hook 'dove-msg-yank)

(provide 'init-evil)
