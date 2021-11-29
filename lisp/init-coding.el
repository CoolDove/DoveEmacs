(use-package glsl-mode
  :ensure t)
(use-package shader-mode
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

(require 'nox)
(add-to-list 'nox-server-programs
			 '(csharp-mode . ("~/.emacs.d/.cache/lsp/omnisharp-roslyn/latest/omnisharp-roslyn/OmniSharp.exe" "-lsp")))
(setq nox-send-changes-idle-time 2.5)

(use-package lsp-mode
             :init (setq lsp-keymap-prefix "C-c l")
             ;; :hook ((c++-mode      . lsp-deferred) (csharp-mode   . lsp-deferred))
             :hook ((c++-mode      . lsp-deferred))
             :commands lsp
			 :config (setq lsp-enable-symbol-highlighting   nil
	                       lsp-headerline-breadcrumb-enable nil
	                       lsp-log-io nil
                           lsp-enable-folding nil 
                           lsp-diagnostic-package nil
                           lsp-enable-snippet nil
	                       lsp-enable-links nil
	                       lsp-restart 'auto-restart
						   lsp-idle-delay 1.5)
                     (setq gc-cons-threshold 100000000)
                     (setq read-process-output-max (* 1024 1024))
					 (add-hook 'lsp-before-open-hook '(lambda () (flycheck-mode 0) (eldoc-mode 0)))
)

(provide 'init-coding)
