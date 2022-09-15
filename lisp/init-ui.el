(tool-bar-mode   -1)
(scroll-bar-mode -1)
(menu-bar-mode   -1)

(require 'init-theme)

(setq display-line-numbers-type 'relative)
;; (add-hook 'prog-mode-hook #'display-line-numbers-mode 1)

(use-package smart-mode-line
  :ensure t)

(set-face-background 'mode-line "yellowgreen")
(set-face-background 'mode-line-inactive "system background")
(set-face-foreground 'mode-line-inactive "darkblue")
(set-face-attribute  'mode-line-inactive nil :box t)
(set-face-attribute  'mode-line-inactive nil :underline t)
 
(setq frame-title-format "emacs is shit")

(defun dove/set-title (name)
  (interactive "sSet new title: ")
  "set the stupid emacs title"
  (setq frame-title-format name))

(with-eval-after-load 'evil
  (evil-define-key '(normal visual motion operator) 'global (kbd "<leader>t") #'dove/set-title))

;; (use-package dimmer
  ;; :ensure t
  ;; :hook (after-init . dimmer-mode)
  ;; :config
  ;; (dimmer-configure-magit)
  ;; (dimmer-configure-posframe))

(with-eval-after-load 'markdown-mode
    (set-face-font 'markdown-inline-code-face "Consolas-13")
    (set-face-font 'bold "Unifont")
    (set-face-foreground 'markdown-inline-code-face "#ea6712")
    (set-face-attribute 'markdown-inline-code-face nil :italic t)

    (set-face-font 'markdown-pre-face "Consolas-14")
    (set-face-foreground 'markdown-pre-face "#67ea12")
    (set-face-attribute 'markdown-pre-face nil :bold t)
	(set-face-attribute 'markdown-table-face "Unifont")
)

(require 'zone)
(zone-when-idle 180)

(provide 'init-ui)
