(use-package glsl-mode
  :ensure t)
(use-package shader-mode
  :ensure t)
(use-package csharp-mode
  :ensure t)
(use-package gdscript-mode
  :ensure t)

(use-package company
             :hook((prog-mode) . company-mode)
             :config (setq company-tooltip-align-annotaions t
                           company-idle-delay 0.1
                           company-echo-delay 0.0
                           company-minimum-prefix-length 1
                           company-require-match 0
                           company-show-numbers t)
             :bind (:map company-active-map
                         ("M-n" . nil)
                         ("M-p" . nil)
                         ("C-j" . #'company-select-next)
                         ("C-k" . #'company-select-previous))
             :ensure t
)

(require 'lsp-ivy)

(use-package lsp-mode
             :ensure t
             :init (setq lsp-keymap-prefix "C-c l")
             :hook ((c++-mode      . lsp-deferred) (csharp-mode   . lsp-deferred))
             ;; :hook ((c++-mode      . lsp-deferred))
             :commands lsp
			 :config (setq lsp-enable-symbol-highlighting   nil
						   lsp-enable-file-watchers         nil
						   lsp-enable-on-type-formatting    nil
						   lsp-eldoc-hook                   nil
	                       lsp-headerline-breadcrumb-enable nil
	                       lsp-log-io                       nil
                           lsp-enable-folding               nil 
                           lsp-enable-snippet               nil
	                       lsp-enable-links                 nil
						   lsp-modeline-diagnostics-enable  nil
						   lsp-diagnostics-provider         :none
						   lsp-eldoc-enable-hover           nil
						   lsp-enable-indentation           nil
						   lsp-modeline-diagnostics-enable  nil
						   lsp-signature-auto-activate      nil
						   lsp-signature-render-documentation nil
						   lsp-completion-show-detail       nil
						   lsp-completion-show-kind         t
						   lsp-lens-auto-enable             nil
	                       lsp-restart                      'auto-restart
						   lsp-idle-delay                   0.1)
			         (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.meta")
			         (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\Packages\\")
			         (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\Temp\\")
			         (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\UserSettings\\")
			         (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\Logs\\")
			         (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\ProjectSettings\\")
			         (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\Resources\\")
			         (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\GameRes\\")
                     (setq gc-cons-threshold 10240)
                     (setq read-process-output-max (* 1024 1024)
						   )
)


(with-eval-after-load 'lsp-mode 
   (add-hook 'lsp-managed-mode-hook 
          (lambda () 
            (when lsp-enable-on-type-formatting (warn "You have lsp-enable-on-type-formatting set to t")))))

(provide 'init-coding)
