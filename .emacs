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
(let ((default-directory "~/.emacs.d/elpa/"))
    (normal-top-level-add-subdirs-to-load-path))
(let ((user-package-directory "~/.emacs.d/lisp/"))
    (normal-top-level-add-subdirs-to-load-path))

;evil mode
(require 'evil)
(evil-mode 1)

;color theme
(require 'color-theme)
(require 'color-theme-cobalt)
(eval-after-load "color-theme"
  '(progn 
     (color-theme-initialize)
     (color-theme-cobalt)))

;font
(set-face-attribute 'default nil :height 150)

;line numbers
(linum-mode 1)

;remove bell sound
(setq visible-bell 1)

;powershell syntax
(require 'powershell)
