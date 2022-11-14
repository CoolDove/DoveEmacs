(use-package obsidian-theme
  :ensure t)

(load-theme 'whiteboard)
;; (load-theme 'obsidian)

(set-background-color "#efefea")
(set-face-background 'region "yellowgreen")
(evil-set-cursor-color "darkgreen")

(set-face-attribute 'line-number-current-line nil :bold t)
(set-face-attribute 'line-number-current-line nil :underline t)

(set-face-background 'line-number "#e0e2e0")
(set-face-background 'line-number-current-line "#efbb23")
(set-face-foreground 'line-number-current-line "#1133ef")

(provide 'init-theme)
