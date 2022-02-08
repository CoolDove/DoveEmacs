(use-package emojify
  :ensure t
  :init
  (global-emojify-mode t))

(defvar emojis
  '((":-D" . "😀")
    (";-)" . "😉")
    (":-/" . "😕")
    (":-(" . "🙁")
    (":-*" . "😙")))

(defun emoji-backend (action &optional arg &rest _)
  (pcase action
    ('prefix (and (memq (char-before) '(?: ?\;))
                  (cons (string (char-before)) t)))
    ('candidates (all-completions arg emojis))
    ('annotation (concat " " (cdr (assoc arg emojis))))
    ('post-completion
     (let ((str (buffer-substring (- (point) 3) (point))))
       (delete-region (- (point) 3) (point))
     (insert (cdr (assoc str emojis)))))))

;; Register emoji backend with `completion-at-point'
(setq completion-at-point-functions
      (list (cape-company-to-capf #'emoji-backend)))

;; Register emoji backend with Company.
(setq company-backends '(emoji-backend))

(require 'init-emoji-backend)
