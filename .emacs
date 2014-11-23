(require 'package)
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(push '("org" . "http://orgmode.org/elpa/")
      package-archives)

(let ((default-directory "~/.emacs.d/elpa"))
    (normal-top-level-add-subdirs-to-load-path))
(require 'evil)
(evil-mode 1)

;color theme
(require 'color-theme)
(require 'color-theme-solarized)
(eval-after-load "color-theme"
  '(progn 
     (color-theme-initialize)
     (color-theme-solarized-dark)))

;font
(set-face-attribute 'default nil :height 140)

;remove bell sound
(setq visible-bell 1)
