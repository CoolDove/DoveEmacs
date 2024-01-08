(defun dove-config-lsp ()
  "Config lsp."
  (setq-default lsp-headerline-breadcrumb-enable nil
                lsp-enable-on-type-formatting    nil
                lsp-completion-show-detail       nil
                lsp-lens-auto-enable             nil
                ;; if you work with Projectile/project.el this will help find the ols.json file.
                lsp-auto-guess-root              t)
  (eval-after-load 'evil
	(evil-define-key '(normal insert visual) 'global
	  (kbd "<f12>")   'lsp-find-definition
	  (kbd "S-<f12>") 'lsp-find-references
	  (kbd "M-<f12>") 'lsp-find-declaration
	  (kbd "C-<f12>") 'lsp-find-implementation))
)
(defun dove-config-lsp-odin ()
  "Config lsp client odin."
  (add-to-list 'lsp-language-id-configuration '(odin-mode . "odin"))
  (lsp-register-client
   (make-lsp-client
	:new-connection (lsp-stdio-connection "D:\\softw\\ols\\ols.exe")
    :major-modes '(odin-mode)
    :server-id 'ols
    :multi-root t)) ;; This is just so lsp-mode sends the "workspaceFolders" param to the server.
  (add-hook 'odin-mode-hook #'lsp)
)

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((odin-mode . lsp) (csharp-mode . lsp))
  :init (setq lsp-keymap-prefix "C-c l")
  :config
    (dove-config-lsp)
	(dove-config-lsp-odin)
)

(use-package lsp-ivy
  :ensure t
  :after (lsp-mode))

(provide 'init-lsp)
