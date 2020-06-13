

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(keyboard-translate ?\C-h ?\C-x )
(keyboard-translate ?\C-x ?\C-h )
(keyboard-translate ?\C-t ?\C-c )
(keyboard-translate ?\C-c ?\C-t )
(define-key key-translation-map [deletechar] (kbd "C-c x") )
(define-key key-translation-map "≈" (kbd "M-x") )

(package-initialize)



(require 'package)
(add-to-list
   'package-archives
   '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
   t)
(add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)

(require 'use-package)

(use-package company
  :ensure t)
(use-package org-roam
  :ensure t)
(use-package helm
  :ensure  t)
(use-package helm-descbinds
  :ensure t)

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
 '(package-selected-packages (quote (org-roam company use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
