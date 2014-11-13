;; -*- lexical-binding: t -*-


(install-package 'projectile)
(install-package 'flx-ido)
(projectile-global-mode)
(setq projectile-project-root-files
      (quote
       ("rebar.config" "project.clj" "pom.xml" "build.sbt" "build.gradle" "Gemfile" "requirements.txt" "package.json" "gulpfile.js" "Gruntfile.js" "bower.json" "composer.json" "Cargo.toml" "mix.exs" ".git")))
(setq projectile-project-root-files-bottom-up (quote (".projectile" ".hg" ".fslckout" ".bzr" "_darcs")))
(setq projectile-file-exists-remote-cache-expire (* 10 60))

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)


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
