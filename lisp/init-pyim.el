(use-package pyim
  :ensure t
  :config (pyim-default-scheme 'microsoft-shuangpin)
          (setq pyim-indicator-cursor-color "blue"))

(setq default-input-method "pyim")
(provide 'init-pyim)
