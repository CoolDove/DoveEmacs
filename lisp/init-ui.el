(tool-bar-mode   -1)
(scroll-bar-mode -1)
(menu-bar-mode   -1)

(require 'init-theme)

(setq display-line-numbers-type 'relative)
;; (add-hook 'prog-mode-hook #'display-line-numbers-mode 1)

(use-package smart-mode-line
  :ensure t)

(set-face-background 'mode-line "darkblue")
(set-face-background 'mode-line-inactive "system background")
(set-face-foreground 'mode-line-inactive "darkblue")
(set-face-attribute  'mode-line-inactive nil :box t)
(set-face-attribute  'mode-line-inactive nil :underline t)

(set-face-foreground font-lock-comment-face "DarkOliveGreen4")

(setq frame-title-format "emacs is shit")

(defun dove/set-title (name)
  (interactive "sSet new title: ")
  "set the stupid emacs title"
  (setq frame-title-format name))

(with-eval-after-load 'evil
  (evil-define-key '(normal visual motion operator) 'global (kbd "<leader>t") #'dove/set-title))

(with-eval-after-load 'markdown-mode
    ;; (set-face-font 'markdown-inline-code-face "Consolas-13")
    (set-face-font 'bold "Unifont")
    ;; (set-face-foreground 'markdown-inline-code-face "#ea6712")
    ;;(set-face-attribute 'markdown-inline-code-face nil :italic t)

    (set-face-attribute 'markdown-pre-face nil :bold t)
    (set-face-font 'markdown-inline-code-face "Unifont-16")
    (set-face-font 'markdown-pre-face "Unifont-16")
    (set-face-font 'markdown-language-keyword-face "Unifont-16")

    (set-face-attribute 'markdown-header-face nil :bold t)
    (set-face-font 'markdown-header-face "Consolas-16")
    (set-face-font 'markdown-header-face-1 "Consolas-24")
    (set-face-font 'markdown-header-face-2 "Consolas-20")
    (set-face-font 'markdown-header-face-4 "Consolas-18")

    (set-face-foreground 'markdown-pre-face "#67ea12")
    (set-face-attribute 'markdown-pre-face nil :bold t)
	(set-face-attribute 'markdown-table-face "Unifont")
)

(require 'zone)
(zone-when-idle 180)

(provide 'init-ui)
