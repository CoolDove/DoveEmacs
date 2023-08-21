;; (use-package obsidian-theme
  ;; :ensure t)

;; (load-theme 'whiteboard)
;; (load-theme 'obsidian)

;; (set-background-color "#efefea")
;; (set-face-background 'region "yellowgreen")
;; (evil-set-cursor-color "darkgreen")
;; 
;; (set-face-attribute 'line-number-current-line nil :bold t)
;; (set-face-attribute 'line-number-current-line nil :underline t)
;; 
;; (set-face-background 'line-number "#e0e2e0")
;; (set-face-background 'line-number-current-line "#efbb23")
;; (set-face-foreground 'line-number-current-line "#1133ef")



;; ====================
;; J Blow's Emacs Theme
;; ====================

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#d3b58d" :background "#041818"))))
 '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(font-lock-builtin-face ((t nil)))
 ; '(font-lock-comment-face ((t (:foreground "yellow"))))
 '(font-lock-comment-face ((t (:foreground "#3fdflf"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white")))) 
 '(font-lock-keyword-face ((t (:foreground "white" ))))
 ; '(font-lock-string-face ((t (:foreground "gray160" :background "gray16"))))
 '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))  
; '(font-lock-warning-face ((t (:foreground "#695a46"))))
 '(font-lock-warning-face ((t (:foreground "#504038"))))
 '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "blue"))))
 '(widget-field-face ((t (:foreground "white"))) t)
 '(widget-single-line-field-face ((t (:background "darkgray"))) t))

(global-font-lock-mode 1)
(set-cursor-color "lightgreen")
(set-background-color "#072626")
(global-set-key [C-return] 'save-buffer)
(set-face-foreground 'font-lock-builtin-face         "lightgreen")

(provide 'init-theme)