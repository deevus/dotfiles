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
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/"))

;packages
(setq el-get-sources
      '(
        (:name powershell :type elpa)
        (:name color-theme-cobalt
               :type git
               :url "git@github.com:nickewing/color-theme-cobalt"
               :load "color-theme-cobalt.el"
               :compile ("color-theme-cobalt.el")
               :features color-theme-cobalt)
        (:name xresources-theme
               :type git
               :url "git@github.com:cqql/xresources-theme"
               :load "xresources-theme.el"))
)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dap-mode flycheck lsp-clangd lsp-css lsp-html lsp-javascript-typescript lsp-php lsp-ui php-mode lsp-mode ## powershell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
