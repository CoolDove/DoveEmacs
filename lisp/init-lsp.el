;; (use-package lsp-mode
             ;; :ensure t
             ;; :init (setq lsp-keymap-prefix "C-c l")
             ;; :hook ((c++-mode      . lsp-deferred) (csharp-mode   . lsp-deferred))
             ;; ;; :hook ((c++-mode      . lsp-deferred))
             ;; :commands lsp
			 ;; :config (setq lsp-enable-symbol-highlighting   nil
						   ;; lsp-enable-file-watchers         t
						   ;; lsp-enable-on-type-formatting    nil
						   ;; lsp-eldoc-hook                   nil
	                       ;; lsp-headerline-breadcrumb-enable nil
	                       ;; lsp-log-io                       nil
                           ;; lsp-enable-folding               nil 
                           ;; lsp-enable-snippet               nil
	                       ;; lsp-enable-links                 nil
						   ;; lsp-modeline-diagnostics-enable  nil
						   ;; lsp-diagnostics-provider         :none
						   ;; lsp-eldoc-enable-hover           nil
						   ;; lsp-enable-indentation           nil
						   ;; lsp-modeline-diagnostics-enable  nil
						   ;; lsp-signature-auto-activate      nil
						   ;; lsp-signature-render-documentation nil
						   ;; lsp-completion-show-detail       nil
						   ;; lsp-completion-show-kind         t
						   ;; lsp-lens-auto-enable             nil
	                       ;; lsp-restart                      'auto-restart
						   ;; lsp-idle-delay                   0.1)
			         ;; (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.meta")
                     ;; (setq gc-cons-threshold 10240)
                     ;; (setq read-process-output-max (* 1024 1024))
                     ;; (defvar lsp-on-touch-time 0)
                     ;; (defun my-lsp-on-change-hack (orig-fun &rest args)
                         ;; ;; do NOT run `lsp-on-change' too frequently
                         ;; (when (> (- (float-time (current-time))
                                     ;; lsp-on-touch-time) 30) ;; 2 mins
                         ;; (setq lsp-on-touch-time (float-time (current-time)))
                         ;; (apply orig-fun args)))
                     ;; (advice-add 'lsp-on-change :around #'my-lsp-on-change-hack)
;; )
;; 
;; 
;; (with-eval-after-load 'lsp-mode 
   ;; (add-hook 'lsp-managed-mode-hook 
          ;; (lambda () 
            ;; (when lsp-enable-on-type-formatting (warn "You have lsp-enable-on-type-formatting set to t")))))
;; 
(provide 'init-lsp)
