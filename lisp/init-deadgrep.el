(use-package deadgrep
  :ensure t
  :defer nil
  :config (with-eval-after-load 'evil
			(evil-set-initial-state 'deadgrep-mode 'emacs))
)

(provide 'init-deadgrep)
