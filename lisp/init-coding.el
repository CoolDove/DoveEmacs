(use-package glsl-mode
  :ensure t)
(use-package shader-mode
  :ensure t)
(use-package csharp-mode
  :ensure t)

(use-package company
             :hook((prog-mode) . company-mode)
             :config (setq company-tooltip-align-annotaions t
                           company-idle-delay 0.2
                           company-echo-delay 0.0
                           company-minimum-prefix-length 2
                           company-require-match 0
                           company-show-numbers t)
             :bind (:map company-active-map
                         ("M-n" . nil)
                         ("M-p" . nil)
                         ("C-j" . #'company-select-next)
                         ("C-k" . #'company-select-previous))
             :ensure t
)

(provide 'init-coding)
