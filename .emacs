;stop startup stuff
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

;hide bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;package repos
(require 'package)
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(push '("org" . "http://orgmode.org/elpa/")
      package-archives)

;load all packages 
(let ((default-directory "~/.emacs.d/elpa"))
    (normal-top-level-add-subdirs-to-load-path))

;evil mode
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
(linum-mode)

;remove bell sound
(setq visible-bell 1)

;powershell syntax
(require 'powershell)
