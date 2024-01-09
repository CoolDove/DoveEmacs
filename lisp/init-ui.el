(tool-bar-mode   -1)
(scroll-bar-mode -1)
(menu-bar-mode   -1)

(setq display-line-numbers-type 'relative)
;; (add-hook 'prog-mode-hook #'display-line-numbers-mode 1)

(add-hook 'dired-mode-hook (lambda () (hl-line-mode) (set-face-background 'hl-line "magenta")))


;; (use-package smart-mode-line
  ;; :ensure t
  ;; :config 
  ;; (if (display-graphic-p)
	;; (progn
	  ;; (set-face-background 'mode-line "darkblue")
	  ;; (set-face-background 'mode-line-inactive "system background")
	  ;; (set-face-foreground 'mode-line-inactive "darkblue")
	  ;; (set-face-attribute  'mode-line-inactive nil :box t)
	  ;; (set-face-attribute  'mode-line-inactive nil :underline t)
	;; )
	;; (progn
	  ;; (set-face-background 'mode-line "lightred")
	  ;; (set-face-foreground 'mode-line-emphasis "green")
	  ;; (set-face-foreground 'mode-line-inactive "darkgray")
	  ;; (set-face-background 'mode-line-inactive "yellow")
	;; )
  ;; )
;; )

(setq frame-title-format "emacs is shit")

(defun dove/set-title (name)
  (interactive "sSet new title: ")
  "set the stupid emacs title"
  (setq frame-title-format name))

(with-eval-after-load 'evil
  (evil-define-key '(normal visual motion operator) 'global (kbd "<leader>t") #'dove/set-title))


(require 'zone)
(zone-when-idle 180)


(setq mode-line-format (list
  " "
 '(:eval (concat (file-name-nondirectory (buffer-file-name)) (if (buffer-modified-p) "* " "  ") ))
 '(:eval (evil-generate-mode-line-tag evil-state))
))

;; (defun dove-modeline ()
;; "A simplized modeline."
	;; (setq mode-line-format (list
		;; '(:eval (evil-generate-mode-line-tag evil-state))
		;; '(:eval (concat (file-name-nondirectory (buffer-file-name)) (if (buffer-modified-p) "* " "  ") ))
		;; '(:eval (if lsp-mode (concat "LSP:" (lsp-server-info?))"LSP-on" " "))
	;; ))
	;; nil
;; )

(provide 'init-ui)
