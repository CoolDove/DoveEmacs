(use-package deadgrep
  :ensure t
  :defer nil
  :config (with-eval-after-load 'evil
			(evil-set-initial-state 'deadgrep-mode 'emacs))
            (defun dove/deadgreap-call ()
	            (interactive)
	            (message "call deadgrep"))
)

(evil-define-key 'emacs deadgrep-mode-map
  (kbd "j") #'(lambda () (interactive) (deadgrep-forward))
  (kbd "M-j") #'(lambda () (interactive) (deadgrep-forward-filename))
  (kbd "k") #'(lambda () (interactive) (deadgrep-backward))
  (kbd "M-k") #'(lambda () (interactive) (deadgrep-backward-filename)))

(provide 'init-deadgrep)
