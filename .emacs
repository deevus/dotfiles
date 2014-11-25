;stop startup stuff
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

;hide bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;package repos
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/"))

;packages
(setq el-get-sources
      '((:name powershell :type elpa)
	(:name color-theme-cobalt
	       :type git
	       :url "git@github.com:nickewing/color-theme-cobalt"
	       :load "color-theme-cobalt.el"
	       :compile ("color-theme-cobalt.el")
	       :features color-theme-cobalt)))

(setq my:el-get-packages
      (append
       '(color-theme git-commit-mode evil)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my:el-get-packages)

;load extra packages 
;(let ((default-directory "~/.emacs.d/lisp/"))
;    (normal-top-level-add-subdirs-to-load-path))

;(when (not package-archive-contents)
;  (package-refresh-contents))

;(dolist (pkg my:elpa-packages)
;  (when (and (not (package-installed-p pkg))
;	     (assoc pkg package-archive-contents))
;    (package-install pkg)))

;evil mode
(require 'evil)
(evil-mode t)

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
(linum-mode t)

;remove bell sound
(setq visible-bell 1)

;powershell syntax
(require 'powershell)

(require 'git-commit)
(add-hook 'git-commit-mode-hook 'turn-on-flyspell)
(add-hook 'git-commit-mode-hook (lambda () (toggle-save-place 0)))
