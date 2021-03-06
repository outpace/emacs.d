
(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(progn
     (define-key paredit-mode-map (kbd "\C-w") 'paredit-backward-kill-word)))



(define-clojure-indent
  (POST 'defun)
  (GET 'defun)
  (DELETE 'defun)
  (PUT 'defun)
  (ANY 'defun)
  (context 'defun))


(setq ring-bell-function 'ignore)
