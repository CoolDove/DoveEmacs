(tool-bar-mode   -1)
(scroll-bar-mode -1)
(menu-bar-mode   -1)

;; Chinese font in GUI mode
(when (display-graphic-p)
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
						  charset (font-spec :family "Microsoft Yahei Mono" :size 16))))

(use-package smart-mode-line
  :init
	  (if (display-graphic-p)
		  (setq sml/theme 'respectful)
		  (setq sml/theme 'light))
      (setq sml/no-confirm-load-theme  t)
      (sml/setup)
)

(use-package dimmer
  :ensure t
  :hook (after-init . dimmer-mode)
  :config
  (dimmer-configure-magit)
  (dimmer-configure-posframe))

(require 'zone)
(zone-when-idle 180)

(provide 'init-ui)
