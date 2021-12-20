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

(use-package magit
  :ensure t)

(use-package find-file-rg
  :ensure t)

(require 'dove-web-search)

(setq eww-search-prefix "https://www.bing.com/search?q=")

(use-package org-bullets
  :ensure t
  :hook (org-mode . (lambda () (org-bullets-mode 1))))

(use-package back-button
  :ensure t
  :config (back-button-mode 1))

(defun dove-wterminal-here (dir)
  (interactive "Dwterminal at: ")
  (shell-command (concat "wt.exe -w 0 nt --tabColor \"#34ff00\" -d " dir)))

(require 'snipaste)


(provide 'init-tools)
