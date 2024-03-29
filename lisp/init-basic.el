(setq inhibit-startup-screen t)
(setq make-backup-files nil)

(setq package-archives '(
  ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
  ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

(setq package-check-signature nil)

(unless (bound-and-true-p package--initialized)
        (package-initialize))

(unless package-archive-contents
        (package-refresh-contents))

(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))

(setq use-package-always-ensure    t
      use-package-always-defer     t
      use-package-always-demand    t
      use-package-expand-minimally t
      use-package-verbose          t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default scroll-step 1
			  scroll-margin 1 
			  scroll-preserve-screen-position t
			  scroll-up-aggressively 0.01
			  scroll-down-aggressively 0.01
			  redisplay-dont-pause t
			  auto-window-vscroll nil
 
			  mouse-wheel-scroll-amount '(5 ((meta) . 1))
			  mouse-wheel-progressive-speed nil
			  mouse-wheel-follow-mouse 't
			  fast-but-imprecise-scrolling nil

			  tab-always-indent nil
			  tab-width         4
)

(setq w32-use-native-image-API t)
(setq undo-tree-auto-save-history nil)

(global-unset-key (kbd "<f1> h")) ;; Why do you have this shit.

(add-to-list 'exec-path "D:/softw/toolkit")
(add-to-list 'exec-path "E:/softw/msys2/usr/bin")
(add-to-list 'exec-path "D:/softw/msys2/usr/bin")


(defun dove--scratch-buffer-replace ()
  "EMACS YOU DESTROIED MY LIFE"
  (with-current-buffer "*scratch*"
	    (erase-buffer)
	    (insert "EMACS, YOU DESTROIED MY LIFE."))
)

(add-hook 'after-init-hook 'dove--scratch-buffer-replace)

(provide 'init-basic)
