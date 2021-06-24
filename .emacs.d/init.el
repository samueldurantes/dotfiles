(setq inhibit-startup-message t)
(setq package-enable-at-startup nil)

;; Appareance
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(load-theme 'vs-dark t)

(set-face-attribute 'default nil :font "Ubuntu Mono" :height 160)

;; Packages
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)

(require 'rust-mode)

;; Backups
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Keybinds
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(vs-dark-theme ## rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
