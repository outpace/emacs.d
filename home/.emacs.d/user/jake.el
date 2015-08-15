;; -*- lexical-binding: t -*-



(install-package 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

(install-package 'projectile)
(install-package 'flx-ido)
(projectile-global-mode)
(setq projectile-project-root-files
      (quote
       ("rebar.config" "project.clj" "pom.xml" "build.sbt" "build.gradle" "Gemfile" "requirements.txt" "package.json" "gulpfile.js" "Gruntfile.js" "bower.json" "composer.json" "Cargo.toml" "mix.exs" ".git" ".projectile_root")))
(setq projectile-project-root-files-bottom-up (quote (".projectile" ".hg" ".fslckout" ".bzr" "_darcs")))
(setq projectile-file-exists-remote-cache-expire (* 10 60))

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; magit configuration
(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-push-always-verify nil)

(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

(install-package 'color-theme-sanityinc-tomorrow)
(setq user-specific-color-theme 'sanityinc-tomorrow-eighties)

(defun o/scratch ()
  (interactive)
  (find-file "~/Copy/outpace/ideas.org"))

(defun o/log ()
  (interactive)
  (find-file "~/Copy/outpace/log.org"))

(defun b/insert-clojure-code (arg)
  (interactive "p")
  (insert "``` clojure
```")
  (beginning-of-line)
  (open-line arg))

(defun b/insert-console-code (arg)
  (interactive "p")
  (insert "``` console
```")
  (beginning-of-line)
  (open-line arg))


(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the reverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000))
    (fill-paragraph nil)))

(install-package 'org-present)
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))
