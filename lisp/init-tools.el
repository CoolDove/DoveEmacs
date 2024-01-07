(use-package goto-last-change
  :ensure t)

(use-package ivy
             :ensure t
             :diminish ivy-mode
             :hook (after-init . ivy-mode))

(use-package counsel
  :ensure t
  :init (require 'init-counsel)
  :after (ivy))

;; (use-package restart-emacs
             ;; :ensure t)

(use-package magit
  :ensure t)

(use-package find-file-rg
  :ensure t)

(evil-define-key '(normal visual motion emacs) 'global
  (kbd "C-x C-p") #'find-file-rg)

(require 'init-deadgrep)

(use-package ripgrep
  :ensure t)

(use-package nhexl-mode
  :ensure t)

;; (use-package chess
  ;; :ensure t)


(setq explicit-shell-file-name "bash"
	  explicit-bash-args '("--login" "-i"))
(setq shell-file-name explicit-shell-file-name)

(provide 'init-tools)
