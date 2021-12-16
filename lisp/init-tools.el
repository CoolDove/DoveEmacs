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

(use-package popup-kill-ring
  :ensure t)

(use-package restart-emacs
             :ensure t)

(use-package magit
  :ensure t)

(use-package find-file-rg
  :ensure t)

(require 'dove-web-search)

(setq eww-search-prefix "https://www.bing.com/search?q=")

(use-package org-bullets
  :ensure t
  :hook (org-mode . (lambda () (org-bullets-mode 1))))

(provide 'init-tools)
