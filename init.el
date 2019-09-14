

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
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'markdown-mode)
(require 'markdown-preview-mode)
(require 'helm)
(require 'helm-descbinds)
(require 'helm-buffers)
(require 'elpy)
(require 'flycheck)
(require 'dired-sidebar)
(require 'hydra)
(require 'arduino-mode)
(require 'company)
(require 'toml)
(require 'magit-mode)
(require 'cl-lib)

(ido-mode t)
(winner-mode 1)
(recentf-mode)
(require 'q-mode)
(electric-pair-mode 1)


(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
(setq help-window-select t)
(require 'smartparens-config)
(define-key ctl-x-map "r" 'helm-recentf)
(define-key ctl-x-map (kbd "C-r") 'helm-recentf)
(define-key global-map (kbd "C-b") 'helm-buffers-list)
(define-key help-map "b" 'helm-descbinds)


(elpy-enable)

(defalias 'yes-or-no-p 'y-or-n-p)


(defun convert-to-hex () (interactive)
  (let (x y)
    (setq x (thing-at-point 'symbol))
    (setq x (cond  (x (substring-no-properties x)) )  )
    (setq x (cond  (x (string-to-int x)) )  )
    (cond (x
	   (progn
	     (backward-word)
	     (kill-word 1)

	     (insert (format "0x%02X" x))
	     
	     )
	   )
	  )
    )
  )

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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(arduino-executable "/Applications/Arduino.app/Contents/MacOS/Arduino")
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "05a4b82c39107308b5c3720fd0c9792c2076e1ff3ebb6670c6f1c98d44227689" default)))
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin/")))
 '(inhibit-startup-screen t)
 '(q-program "/Users/pooja/q/m32/q")
 '(recentf-max-saved-items 100))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'company)
(require 'company-jedi)

(define-key global-map (kbd "C-c o o") 'other-window)
(define-key global-map (kbd "C-o C-o") 'other-window)

(defhydra hydra-buffer-menu (:color pink
                             :hint nil)
  "
^Mark^             ^Unmark^           ^Actions^          ^Search
^^^^^^^^-----------------------------------------------------------------
_m_: mark          _u_: unmark        _x_: execute       _R_: re-isearch
_s_: save          _U_: unmark up     _b_: bury          _I_: isearch
_d_: delete        ^ ^                _g_: refresh       _O_: multi-occur
_D_: delete up     ^ ^                _T_: files only: % -28`Buffer-menu-files-only
_~_: modified
"
  ("m" Buffer-menu-mark)
  ("u" Buffer-menu-unmark)
  ("U" Buffer-menu-backup-unmark)
  ("d" Buffer-menu-delete)
  ("D" Buffer-menu-delete-backwards)
  ("s" Buffer-menu-save)
  ("~" Buffer-menu-not-modified)
  ("x" Buffer-menu-execute)
  ("b" Buffer-menu-bury)
  ("g" revert-buffer)
  ("T" Buffer-menu-toggle-files-only)
  ("O" Buffer-menu-multi-occur :color blue)
  ("I" Buffer-menu-isearch-buffers :color blue)
  ("R" Buffer-menu-isearch-buffers-regexp :color blue)
  ("c" nil "cancel")
  ("v" Buffer-menu-select "select" :color blue)
  ("o" Buffer-menu-other-window "other-window" :color blue)
  ("q" quit-window "quit" :color blue))

(define-key Buffer-menu-mode-map "." 'hydra-buffer-menu/body)


(global-set-key (kbd "M-y") #'hydra-yank-pop/yank-pop)
(global-set-key (kbd "C-y") #'hydra-yank-pop/yank)


(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))


(global-set-key
 (kbd "C-n")
 (defhydra hydra-move
   (:body-pre (next-line))
   "move"
   ("n" next-line)
   ("p" previous-line)
   ("f" forward-char)
   ("b" backward-char)
   ("a" beginning-of-line)
   ("e" move-end-of-line)
   ("v" scroll-up-command)
   ;; Converting M-v to V here by analogy.
   ("V" scroll-down-command)
   ("l" recenter-top-bottom)))

(global-set-key (kbd "C-p") #'hydra-move/previous-line)


(defhydra hydra-goto-line (goto-map ""
                           :pre (linum-mode 1)
                           :post (linum-mode -1))
  "goto-line"
  ("g" goto-line "go")
  ("m" set-mark-command "mark" :bind nil)
  ("q" nil "quit"))

(defhydra hydra-clock (:color blue)
    "    Org-Clock"
    ("q" nil "quit" :column "Clock")
    ("c" org-clock-cancel "cancel" :color pink :column "Do")
    ("d" org-clock-display "display")
    ("e" org-clock-modify-effort-estimate "effort")
    ("i" org-clock-in "in")
    ("j" org-clock-goto "jump")
    ("o" org-clock-out "out")
    ("p" hydra-move/body"report")
    )

(use-package ace-jump-mode
  :commands ace-jump-mode
  :init
  (bind-key "C-." 'ace-jump-mode))

(menu-bar-mode 0)
