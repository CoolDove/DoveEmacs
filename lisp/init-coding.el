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

;; (use-package lsp-mode
             ;; :ensure t
             ;; :init (setq lsp-keymap-prefix "C-c l")
             ;; :hook ((c++-mode      . lsp-deferred) (csharp-mode   . lsp-deferred))
             ;; :commands lsp
			 ;; :config (setq lsp-enable-symbol-highlighting   nil
						   ;; lsp-enable-file-watchers         nil
						   ;; lsp-eldoc-hook                   nil
	                       ;; lsp-headerline-breadcrumb-enable nil
	                       ;; lsp-log-io nil
                           ;; lsp-enable-folding nil 
                           ;; lsp-diagnostic-package nil
                           ;; lsp-enable-snippet nil
	                       ;; lsp-enable-links nil
	                       ;; lsp-restart 'auto-restart
						   ;; lsp-idle-delay 0.5)
                     ;; (setq gc-cons-threshold 100000000)
                     ;; (setq read-process-output-max (* 1024 1024))
;; )


(provide 'init-coding)
