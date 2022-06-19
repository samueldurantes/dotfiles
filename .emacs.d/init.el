;; Interface cleanup
(setq initial-scratch-message "Hi, Samuel!"
      inhibit-splash-screen t
      use-dialog-box nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

(set-face-attribute 'default nil :font "SF Mono" :height 180)

;; Disable backups and lockfiles
(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

(load-theme 'doom-gruvbox t)

;; Set only one confirmation prompt
(fset 'yes-or-no-p 'y-or-n-p)

;; Disable backups and lockfiles
(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

;; Indent with spaces
(setq-default indent-tabs-mode nil
              tab-width 2)

(setq js-indent-level 2)

;; Setup package.el
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package evil)
(use-package vterm)
(use-package haskell-mode)
(use-package gruvbox-theme)
(use-package rescript-mode)
(use-package doom-themes)

(evil-mode 1)

(global-set-key (kbd "\C-c w") #'evil-window-map)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "6f4421bf31387397f6710b6f6381c448d1a71944d9e9da4e0057b3fe5d6f2fad" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "22ce392ec78cd5e512169f8960edf5cbbad70e01d3ed0284ea62ab813d4ff250" "c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(package-selected-packages '(evil evil-mode gruvbox-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
