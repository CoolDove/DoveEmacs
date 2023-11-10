;; (use-package goto-last-change
  ;; :ensure t)

;; (use-package youdao-dictionary
  ;; :defer 2
  ;; :ensure t
  ;; :config(setq url-automatic-caching t))

(use-package counsel
  :ensure t)

(use-package ivy
             :ensure t
             :diminish ivy-mode
             :hook (after-init . ivy-mode))

;; (use-package restart-emacs
             ;; :ensure t)

(use-package magit
  :ensure t)

(use-package find-file-rg
  :ensure t)

(evil-define-key '(normal visual motion emacs) 'global
  (kbd "C-x C-p") #'find-file-rg)

;; (require 'dove-web-search)
;; (setq eww-search-prefix "https://www.bing.com/search?q=")

(require 'init-deadgrep)

;; (use-package org-bullets
  ;; :ensure t
  ;; :hook (org-mode . (lambda () (org-bullets-mode 1))))

(defun dove-wterminal-here (dir)
  (interactive "Dwterminal at: ")
  (shell-command (concat "wt.exe -w 0 nt --tabColor \"#7ccf32\" -d " dir)))

;; (require 'snipaste)

(evil-set-initial-state 'eshell-mode 'emacs)

(require 'init-counsel)

(use-package ripgrep
  :ensure t)

(use-package nhexl-mode
  :ensure t)

(use-package chess
  :ensure t)

(provide 'init-tools)
