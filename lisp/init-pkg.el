(use-package ivy
             :ensure t
             :diminish ivy-mode
             :hook (after-init . ivy-mode)
)

(use-package restart-emacs
             :ensure t
)

(use-package smooth-scroll
             :ensure t
)

(provide 'init-pkg)
