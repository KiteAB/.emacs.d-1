;;;; Mirror Config
(require 'package)
(require 'cl) ; The Lisp Extension
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;;;; Plugins Statement
;;; Third-party
;; Emacs Application Framework
(add-to-list 'load-path "~/.emacs.d/third-party/emacs-application-framework")
(require 'eaf)
;; Atom-One
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
(load-theme 'atom-one-dark t)

;;;; Other config files
;;; GitHub
(load-file "~/.emacs.d/token.el")
(require 'github-token)
;;; Other files
(add-to-list 'load-path "~/.emacs.d/etc/")
;; UI
(require 'init-ui)
;; Keymaps
(require 'init-keymaps)
;; Other mode settings
(require 'init-modes)
;; Require Packages
(require 'init-require-package)


;;;; Basic things
;;; Functions
(fset 'yes-or-no-p 'y-or-n-p) ; Change the asking's answer way
(delete-selection-mode 1) ; Delete the seleceted text
(show-paren-mode 1) ; Highlight the ()
(setq make-backup-files nil ; Don't let Emacs make up backup file
      create-lockfiles nil ;Don't make lockfile
      auto-save-default nil ; Don't auto save the file
      )
(setq default-tab-width 2) ; The tab width
(setq user-emacs-directory "~/.emacs.d/var")
;; Open the configuration quickly (Function)
(defun open-config-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-etc-config(file)
  (interactive "sEnter the filename: ")
  (pcase file
    ("ui" (find-file "~/.emacs.d/etc/init-ui.el"))
    ("org" (find-file "~/.emacs.d/etc/init-org.el"))
    ("keymap" (find-file "~/.emacs.d/etc/init-keymaps.el"))
    ("mode" (find-file "~/.emacs.d/etc/init-modes.el"))
    ("package" (find-file "~/.emacs.d/etc/init-require-package.el"))))

(defun open-vterm()
  (interactive)
  (vterm)
  (linum-mode -1))

(defun open-gtd-dir()
  (interactive)
  (find-file "~/.emacs.d/gtd"))

(defun set-alpha(var)
  (interactive "sAlpha or not(y-or-n): ")
  (pcase var
    ("y" (set-frame-parameter nil 'alpha '(90 . 100)))
    ("n" (set-frame-parameter nil 'alpha '(100 . 100)))))

(defun window-move(way)
  (interactive "sEnter the way(n-e-u-i): ")
  (let ((current-window-buffer (window-buffer))
	(current-window (get-buffer-window)))
    (pcase way
      ("n" (windmove-left))
      ("e" (windmove-down))
      ("u" (windmove-up))
      ("i" (windmove-right)))
    (setq another-window-buffer (get-buffer-window))
    (if (not (eql current-window-buffer another-window-buffer))
	(progn
	  (set-window-buffer current-window (window-buffer))
	  (set-window-buffer (get-buffer-window) current-window-buffer))))) ; Move the window


;;; Third Party's config
;;; Emacs Application Framework
(eaf-setq eaf-browser-remember-history "true")
;; (setq eaf-browser-default-search-engine 'Bing)
(eaf-setq eaf-browser-default-zoom "1.0")
(eaf-setq eaf-browse-blank-page-url "https://cn.bing.com/")
(eaf-setq eaf-browser-dark-mode "true")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(js2-mode hungry-delete dashboard cal-china-x ace-window which-key bongo spaceline all-the-icons counsel vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; Plugin requires
;;; Org
(package-require
 'org
 '(
   ("C-z g" org-agenda)
   ("C-z C-c c" org-capture))
 (progn
   (setq org-src-fontify-natively t)
   (require 'init-org)))
;; Vterm
(package-require
 'vterm
 '(("C-z C-t" open-vterm)))
;; Counsel
(package-require
 'counsel
 '(
   ("M-x" counsel-M-x)
   ("C-x C-f" counsel-find-file)
   ("C-z a" counsel-linux-app)))
;; Icons
(package-require 'all-the-icons)
;; Spaceline
(package-require
 'spaceline-config
 :keymaps
 (spaceline-spacemacs-theme))
;; ivy
(package-require
 'ivy
 :keymaps
 (ivy-mode 1))
;; Bongo
(package-require 'bongo)
;; Which Key
(package-require
 'which-key
 :keymaps
 (which-key-mode 1))
;; ace window
(package-require 'ace-window)
;; Calendar-China
(package-require 'cal-china-x)
;; Dascboard
(package-require 'dashboard)
;; Iedit
(package-require
 'iedit
 '(("C-z e" iedit-mode)))
;; hungry-delete
(package-require
 'hungry-delete
 '(("C-z h" hungry-delete-mode)))
;; js2-mode
(package-require
 'js2-mode
 :keymaps
 (setq auto-mode-alist
       (append
	'(("//.js//'" . js2-mode))
	auto-mode-alist)))
