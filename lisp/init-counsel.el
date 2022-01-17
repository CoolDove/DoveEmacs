(use-package counsel
  :ensure t)

(evil-define-key '(normal visual insert motion emacs) 'global
    (kbd "C-x C-f") #'counsel-find-file
    (kbd "M-x") #'counsel-M-x)

;; counsel, thank you
(evil-define-key '(normal visual emacs) 'global
    (kbd "M-p") 'counsel-yank-pop
    (kbd "/") 'counsel-grep-or-swiper
    (kbd "C-s") 'counsel-grep-or-swiper

    (kbd "<leader>p") 'counsel-rg
    (kbd "<leader>P") 'deadgrep

    (kbd "C-'") 'counsel-evil-registers
    (kbd "<leader> m") 'counsel-evil-marks
)

(evil-define-key '(normal visual) 'global
  (kbd "<leader>v") #'ivy-push-view
  (kbd "<leader>b") #'ivy-switch-view)

(evil-define-key '(normal visual) markdown-mode-map
  (kbd "<leader>t") #'counsel-outline)

(with-eval-after-load 'swiper
  (set-face-attribute 'swiper-line-face nil :underline t))


(provide 'init-counsel)
