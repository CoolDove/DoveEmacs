;; (require 'pulse)
;; (defface dove/evil-yank-flash
  ;; '((t :background "orange"))
  ;; "evil yank flash")

;; (defun dove/evil-yank-advice (orig-fn beg end &rest args)
  ;; (if (not (eq evil-state 'visual))
      ;; (pulse-momentary-highlight-region beg end 'dove/evil-yank-flash))
  ;; (apply orig-fn beg end args))

(use-package evil
  :init   (evil-mode 1)
  :ensure t
  :config (require 'dove-evil-key)
          (setq evil-auto-indent t
		        evil-shift-width 4
				evil-want-C-w-in-emacs-state t
				evil-search-module 'evil-search)
		  (evil-set-undo-system 'undo-tree))
		  ;; (advice-add 'evil-yank :around 'dove/evil-yank-advice))

(use-package undo-tree
  :after (evil)
  :ensure t
  :hook (evil-local-mode . turn-on-undo-tree-mode))

(use-package evil-surround
  :ensure t
  :after  (evil)
  :config (evil-surround-mode 1)
  :hook   (evil-local-mode . evil-surround-mode)
)

(evil-set-cursor-color "green yellow")

;; (setq
 ;; evil-normal-state-tag (propertize "[Normal]" 'face '((:background nil :forground "black")))
 ;; evil-visual-state-tag (propertize "[Visual]" 'face '((:background "medium purple" :forground "black")))
 ;; evil-insert-state-tag (propertize "[Insert]" 'face '((:background "dark orange" :forground "black")))
 ;; evil-replace-state-tag (propertize "[Replace]" 'face '((:background "SteelBlue" :forground "black")))
 ;; evil-motion-state-tag (propertize "[Motion]" 'face '((:background "yellow" :forground "black")))
 ;; evil-operator-state-tag (propertize "[Operator]" 'face '((:background "gray" :forground "black")))
 ;; evil-emacs-state-tag (propertize "[Emacs]" 'face '((:background "black" :forground "white"))))

(use-package evil-anzu
  :ensure t
  :after (evil)
  :hook (evil-local-mode . anzu-mode)
  :config (global-anzu-mode 1))

;; Make sure that the bash executable can be found
(setq explicit-shell-file-name "F:/softw/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "F:/soft/Git/bin")

(provide 'init-evil)
