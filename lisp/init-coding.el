
;; (use-package glsl-mode
  ;; :ensure t)

(global-auto-revert-mode t)

(use-package markdown-mode
  :ensure t
  :defer t)

(use-package yaml-mode
  :ensure t
  :defer t)

(use-package shader-mode
  :ensure t
  :defer t
  :init
  (push (cons "\\.hlsl\\'" 'shader-mode) auto-mode-alist)
  (push (cons "\\.shader\\'" 'shader-mode) auto-mode-alist)
  (push (cons "\\.compute\\'" 'shader-mode) auto-mode-alist)
  (push (cons "\\.hlsl\\'" 'shader-mode) auto-mode-alist)
  (push (cons "\\.glsl\\'" 'shader-mode) auto-mode-alist)

  (push (cons "\\.vert\\'" 'shader-mode) auto-mode-alist)
  (push (cons "\\.frag\\'" 'shader-mode) auto-mode-alist)
)


(global-auto-revert-mode t)


(require 'odin-mode)
(use-package zig-mode
  :ensure t
  :defer t
  :config (setq zig-format-on-save nil))


(use-package csharp-mode
  :ensure t
  :defer t)
(use-package gdscript-mode
  :ensure t
  :defer t)
(use-package python-mode
  :ensure t
  :defer t)

(use-package company
             :hook((prog-mode) . company-mode)
             :config (setq company-tooltip-align-annotaions t
                           company-idle-defer 0.1
                           company-echo-defer 0.0
                           company-minimum-prefix-length 1
                           company-require-match 0
                           company-show-numbers t)
             :bind (:map company-active-map
                         ("M-n" . nil)
                         ("M-p" . nil)
                         ("C-j" . #'company-select-next)
                         ("C-k" . #'company-select-previous))
             :ensure t
)

;; (require 'init-corfu)

(require 'init-lsp)


(provide 'init-coding)
