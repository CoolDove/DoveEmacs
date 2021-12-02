(use-package goto-last-change
  :ensure t)

(use-package youdao-dictionary
  :defer 2
  :ensure t
  :config(setq url-automatic-caching t))

(use-package ivy
             :ensure t
             :diminish ivy-mode
             :hook (after-init . ivy-mode))

(use-package restart-emacs
             :ensure t)

(use-package deadgrep
  :ensure t)

(use-package pyim
  :ensure t
  :config (setq pyim-indicator-cursor-color "blue")
          (pyim-default-scheme 'microsoft-shuangpin))

(setq default-input-method "pyim")

(use-package magit
  :ensure t)

(require 'dove-web-search)

(provide 'init-tools)
