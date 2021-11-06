(use-package company
             :hook((prog-mode) . company-mode)
             :config (setq company-tooltip-align-annotaions t
                           company-idle-delay 0.1
                           company-echo-delay 0
                           company-minimum-prefix-length 2
                           company-require-match 1
                           company-show-numbers t)
             :bind (:map company-active-map
                         ("M-n" . nil)
                         ("M-p" . nil)
                         ("C-j" . #'company-select-next)
                         ("C-k" . #'company-select-previous))
             :ensure t
)

(use-package lsp-mode
             :init (setq lsp-keymap-prefix "C-c l")
             :hook ((c++-mode      . lsp-deferred)
                    (csharp-mode   . lsp-deferred))
             :commands lsp
)

(provide 'init-coding)
