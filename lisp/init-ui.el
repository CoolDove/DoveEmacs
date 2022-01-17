(tool-bar-mode   -1)
(scroll-bar-mode -1)
(menu-bar-mode   -1)

;; Chinese font in GUI mode
;; (when (display-graphic-p)
	;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
        ;; (set-fontset-font (frame-parameter nil 'font)
						  ;; charset (font-spec :family "Microsoft Yahei Mono" :size 16))))


(setq display-line-numbers-type 'relative)
;; (add-hook 'prog-mode-hook #'display-line-numbers-mode 1)


(use-package railscasts-theme
  :ensure t
  :init (load-theme 'railscasts))

(use-package smart-mode-line
  :init
	  (if (display-graphic-p)
		  (setq sml/theme 'respectful))
      (setq sml/no-confirm-load-theme  t)
      (sml/setup)
)

(set-face-attribute 'mode-line-inactive nil :underline t)
 
(setq frame-title-format (concat "emacs is almostly shit!!!" (format-time-string "    [%Y-%m-%d, %a]")))

(use-package dimmer
  :ensure t
  :hook (after-init . dimmer-mode)
  :config
  (dimmer-configure-magit)
  (dimmer-configure-posframe))

(with-eval-after-load 'markdown-mode
    (set-face-font 'markdown-inline-code-face "Consolas-13")
    (set-face-foreground 'markdown-inline-code-face "#ea6712")
    (set-face-attribute 'markdown-inline-code-face nil :italic t)

    (set-face-font 'markdown-pre-face "Consolas-14")
    (set-face-foreground 'markdown-pre-face "#67ea12")
    (set-face-attribute 'markdown-pre-face nil :bold t)
)
(require 'zone)
(zone-when-idle 180)

(provide 'init-ui)
