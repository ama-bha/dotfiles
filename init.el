
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'markdown-mode)
(require 'markdown-preview-mode)
(require 'helm)
(require 'helm-descbinds)
(require 'helm-buffers)
(require 'toml)
(ido-mode t)
(winner-mode 1)
(recentf-mode)
(require 'q-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
(setq help-window-select t)
(require 'smartparens-config)
(define-key ctl-x-map "r" 'helm-recentf)
(define-key ctl-x-map (kbd "C-r") 'helm-recentf)
(define-key global-map (kbd "C-b") 'helm-buffers-list)
(define-key help-map "b" 'helm-descbinds)
(define-key mode-specific-map (kbd "a t") 'company-mode)
(define-key global-map (kbd "C-l") 'hhhhh)

(defun hhhhh() (interactive) (message (prin1 (company-grab-symbol))))


(require 'cl-lib)


    '((pine . cones)
      (oak . acorns)
      (maple . seeds))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("05a4b82c39107308b5c3720fd0c9792c2076e1ff3ebb6670c6f1c98d44227689" default)))
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin/")))
 '(inhibit-startup-screen t)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (zenburn-theme toml smartparens s markdown-mode markdown-mode+ markdown-preview-eww markdown-preview-mode company ess helm helm-descbinds helm-describe-modes magit r-autoyas yasnippet yasnippet-snippets)))
 '(q-program "/Users/pooja/q/m32/q")
 '(recentf-max-saved-items 100))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'dash)
(-map 'length
      (car
       '(("p" ("p" "name" "color" "weight" "city")) ("s" ("s" "name" "status" "city")) ("sp" ("s" "p" "qty")))
       )
      )


(menu-bar-mode -1) 

