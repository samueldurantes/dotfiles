(setq inhibit-startup-message t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(global-linum-mode t)
(global-set-key [f8] 'neotree-toggle)
;; Font
(set-face-attribute 'default nil :height 110)

;; Theme
(load-theme 'tango-dark)

;; Packages
(require 'package)

(setq package-enable-at-startup nil)

;; MELPA 
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;; MELPA Stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(neotree auto-complete which-key try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
