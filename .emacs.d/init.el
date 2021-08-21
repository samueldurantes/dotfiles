(setq inhibit-startup-message t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)

(icomplete-mode 1)

(global-linum-mode t)

(set-face-attribute 'default nil :font "Ubuntu Mono" :height 180)

(load-theme 'tango-dark)

;; Packages
(require 'package)
(require 'evil)
(require 'haskell-mode)
(require 'lsp-mode)

(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

(evil-mode 1)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-c <right>") 'evil-window-right)
(global-set-key (kbd "C-c <left>") 'evil-window-left)
(global-set-key (kbd "C-c <up>") 'evil-window-up)
(global-set-key (kbd "C-c <down>") 'evil-window-down)


(defun cwvh:haskell-mode-hook ()
  ;(set (make-local-variable 'require-final-newline) t)
  (turn-on-haskell-decl-scan)
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation)
  (setq tab-width 2
        haskell-indent-offset 2
        haskell-indentation-layout-offset 2
        haskell-indentation-left-offset 2
        haskell-indentation-ifte-offset 2))
(add-hook 'haskell-mode-hook 'cwvh:haskell-mode-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil lsp-mode haskell-mode neotree auto-complete which-key try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
