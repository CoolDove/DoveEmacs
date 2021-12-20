(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

; set default text coding system
(setq default-buffer-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

; disable beeping
(setq ring-bell-function 'ignore)

(when (file-exists-p custom-file)
  (load-file custom-file))

(require 'package)

(require 'init-basic)
(require 'init-indent)
(require 'init-coding)

(require 'init-evil)
(require 'init-tools)

(require 'init-ui)
(require 'init-highlight)

(require 'dove-org-gtd)

(server-start)

