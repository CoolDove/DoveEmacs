(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(when (file-exists-p custom-file)
  (load-file custom-file))

(require 'package)

(require 'init-basic)
(require 'init-indent)
(require 'init-pkg)
(require 'init-coding)

(require 'init-evil)
(require 'init-tools)
(require 'init-pyim)

(require 'init-highlight)
(require 'init-ui)

(require 'dove)

(if (display-graphic-p)
	(setq ring-bell-function 'ignore))

(server-start)

;;************************
