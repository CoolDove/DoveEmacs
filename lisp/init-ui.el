(tool-bar-mode   -1)
(scroll-bar-mode -1)
(menu-bar-mode   -1)

;; Chinese font in GUI mode
(if (display-graphic-p)
(dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
					charset (font-spec :family "Microsoft Yahei Mono" :size 16))))

;; theme things
(use-package gruvbox-theme
  :init   (load-theme 'gruvbox-dark-soft t)
  :ensure t
)

(use-package smart-mode-line
  :init
	  (if (display-graphic-p)
		  (setq sml/theme 'respectful)
		  (setq sml/theme 'dark))
      (setq sml/no-confirm-load-theme  t)
      (sml/setup)
)

;(use-package indent-guide
  ;:after  prog-mode
  ;:ensure t
  ;:hook   (prog-mode . indent-guide-mode)
  ;:config
          ;(setq indent-guide-delay      0.1)
          ;(setq indent-guide-resursive  t  )
;)

(use-package ivy-posframe
  :ensure t
  :after  (ivy)
  :hook   (prog-mode . ivy-posframe-mode)
  :config
          (setq ivy-posframe-display-function-alist '((t . ivy-posframe-display-at-frame-center)))
)

(use-package emacs
  :config (setq display-line-numbers-type    'relative)
          (global-display-line-numbers-mode  t)
)

(provide 'init-ui)
