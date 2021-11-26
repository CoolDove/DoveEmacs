(tool-bar-mode   -1)
(scroll-bar-mode -1)
(menu-bar-mode   -1)

;; Chinese font in GUI mode
(when (display-graphic-p)
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
						  charset (font-spec :family "Microsoft Yahei Mono" :size 16))))

;; theme things
(when (display-graphic-p)
	(use-package gruvbox-theme
		:init   (load-theme 'gruvbox-dark-soft t)
		:ensure t)
	(use-package ivy-posframe
	:ensure t
	:after  (ivy)
	:hook   (prog-mode . ivy-posframe-mode)
	:config (setq ivy-posframe-display-function-alist '((t . ivy-posframe-display-at-frame-center)))
	)
)

(use-package smart-mode-line
  :init
	  (if (display-graphic-p)
		  (setq sml/theme 'respectful)
		  (setq sml/theme 'light))
      (setq sml/no-confirm-load-theme  t)
      (sml/setup)
)

(require 'dove-linum)
(dove-linum-mode-on)
(when (display-graphic-p)
    (set-face-foreground 'linum "#b8bb28")
    (set-face-foreground 'linum-highlight "#32302f")
    (set-face-foreground 'linum-highlight-evil-register "#b8bb28")
    (set-face-foreground 'linum-highlight-evil-marker "#d3869b")

    (set-face-background 'linum-highlight "#b8bb28")
    (set-face-background 'linum-highlight-evil-register "#dc3c30")
    (set-face-background 'linum-highlight-evil-marker "#32302f")
)
(unless (display-graphic-p)
	(set-face-background 'linum-highlight-evil-marker "black")
	(set-face-foreground 'linum-highlight-evil-marker "blue")
	(set-face-background 'linum-highlight-evil-register "cyan")
)

(provide 'init-ui)
