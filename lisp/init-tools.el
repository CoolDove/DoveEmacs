(use-package youdao-dictionary
  :defer 2
  :ensure t
  :config(setq url-automatic-caching t)
)

(use-package ivy
             :ensure t
             :diminish ivy-mode
             :hook (after-init . ivy-mode)
)

(use-package restart-emacs
             :ensure t
)

(provide 'init-tools)
