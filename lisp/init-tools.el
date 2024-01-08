(use-package goto-last-change
  :ensure t)

(use-package ivy
             :ensure t
             :diminish ivy-mode
             :hook (after-init . ivy-mode))

(use-package ivy-xref
            :ensure t
			:init
				;; xref initialization is different in Emacs 27 - there are two different
				;; variables which can be set rather than just one
				(when (>= emacs-major-version 27)
					(setq xref-show-definitions-function #'ivy-xref-show-defs))
				;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
				;; commands other than xref-find-definitions (e.g. project-find-regexp)
				;; as well
				(setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
            :after (ivy))

(use-package counsel
  :ensure t
  :init (require 'init-counsel)
  :after (ivy))

;; (use-package restart-emacs
             ;; :ensure t)

(use-package magit
  :ensure t)

(use-package find-file-rg
  :ensure t)

(evil-define-key '(normal visual motion emacs) 'global
  (kbd "C-x C-p") #'find-file-rg)

(require 'init-deadgrep)

(use-package ripgrep
  :ensure t)

(use-package nhexl-mode
  :ensure t)

;; (use-package chess
  ;; :ensure t)

(setq explicit-shell-file-name "bash"
	  explicit-bash-args '("--login" "-i"))
(setq shell-file-name explicit-shell-file-name)

(provide 'init-tools)
