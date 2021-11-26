(use-package glsl-mode
  :ensure t)
(use-package shader-mode
  :ensure t)

(use-package company
             :hook((prog-mode) . company-mode)
             :config (setq company-tooltip-align-annotaions t
                           company-idle-delay 0.3
                           company-echo-delay 0.3
                           company-minimum-prefix-length 3
                           company-require-match 0
                           company-show-numbers t)
             :bind (:map company-active-map
                         ("M-n" . nil)
                         ("M-p" . nil)
                         ("C-j" . #'company-select-next)
                         ("C-k" . #'company-select-previous))
             :ensure t
)

(require 'nox)
(add-to-list 'nox-server-programs
			 '(csharp-mode . ("~/.emacs.d/.cache/lsp/omnisharp-roslyn/latest/omnisharp-roslyn/OmniSharp.exe" "-lsp")))
(add-hook 'csharp-mode-hook 'nox)

(use-package lsp-mode
             :init (setq lsp-keymap-prefix "C-c l")
             :hook ((c++-mode      . lsp-deferred))
             ;; :hook ((c++-mode      . lsp-deferred)
                    ;; (csharp-mode   . lsp-deferred))
             :commands lsp
			 :config (setq lsp-enable-symbol-highlighting   nil
					       lsp-headerline-breadcrumb-enable nil)
)

(provide 'init-coding)
