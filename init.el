(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp/vendor")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

; set default text coding system
(setq default-buffer-coding-system 'utf-8-with-signature)
(prefer-coding-system 'utf-8)

; disable beeping
(setq ring-bell-function 'ignore)

(when (file-exists-p custom-file)
  (load-file custom-file))

(setq inhibit-compacting-font-caches t)
(setq case-fold-search nil)

(require 'package)

(require 'init-basic)
;; (require 'init-indent)

(require 'init-coding)

(require 'init-evil)

(require 'init-tools)
 
(require 'init-ui)
(require 'init-highlight)

(require 'init-dove)
(require 'dove-cody)
(require 'dove-make)

(server-start)

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
