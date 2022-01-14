(use-package deadgrep
  :ensure t
  :defer nil
  :config (with-eval-after-load 'evil
			(evil-set-initial-state 'deadgrep-mode 'emacs))
            (defun dove/deadgreap-call ()
	            (interactive)
	            (message "call deadgrep"))
)

(provide 'init-deadgrep)
