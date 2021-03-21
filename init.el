(keyboard-translate ?\C-h ?\C-x )
(keyboard-translate ?\C-x ?\C-h )
(keyboard-translate ?\C-t ?\C-c )
(keyboard-translate ?\C-c ?\C-t )


(require 'package)
(add-to-list ' package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


(require 'use-package)

(use-package company  :ensure t)
(use-package org-roam  :ensure t)
(use-package helm  :ensure  t)
(use-package helm-descbinds  :ensure t)
(use-package elpy  :ensure t)
(use-package leetcode :ensure t)

(use-package q-mode :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.[kq]\\'" . q-mode))
  :config
  (define-key q-mode-map (kbd "C-r") 'q-eval-line-and-step)
  )
  

(ido-mode t)
(winner-mode 1)
(recentf-mode)
(electric-pair-mode 1)


(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
(setq help-window-select t)
(define-key ctl-x-map "r" 'helm-recentf)
(define-key ctl-x-map (kbd "C-r") 'helm-recentf)
(define-key global-map (kbd "C-b") 'helm-buffers-list)
(define-key help-map "b" 'helm-descbinds)

(defalias 'yes-or-no-p 'y-or-n-p)

(define-key global-map (kbd "C-o") nil)
(setq ctlc-x-map (make-sparse-keymap))
(define-key global-map (kbd "C-c x") ctlc-x-map)

(setq magit-shortcuts-map (make-sparse-keymap))
(setq window-shortcuts-map (make-sparse-keymap))
(setq other-shortcuts-map (make-sparse-keymap))


(define-key ctlc-x-map "m" magit-shortcuts-map)
(define-key ctlc-x-map "w" window-shortcuts-map)
(define-key ctlc-x-map "d" window-shortcuts-map)




(define-key window-shortcuts-map "o" 'other-window)
(define-key window-shortcuts-map (kbd "d d") 'detele-window)
(define-key window-shortcuts-map (kbd "d o") 'detele-other-windows)
(define-key window-shortcuts-map (kbd "d k") 'kill-buffer-and-window)
(define-key other-shortcuts-map "o" 'other-window)
(define-key other-shortcuts-map (kbd "C-o") 'other-window)


(define-key help-map "b" 'helm-descbinds)
(define-key global-map (kbd "M-x") 'helm-M-x)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(leetcode q-mode org-roam company use-package))
 '(q-program "/home/aman/q/l64/q"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




(setq leetcode-save-solutions t)
(setq leetcode-directory "~/leetcode")
