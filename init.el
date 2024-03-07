;; no startup msg  
(setq inhibit-startup-message t)

;; font and frame size
(set-frame-font "Consolas 18")
(set-frame-size (selected-frame) 125 38)
(tool-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;
;; packages          ;;
;;;;;;;;;;;;;;;;;;;;;;;


(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("gnu" . "http://elpa.gnu.org/packages/")
	( "jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")))

(setq package-archive-priorities '(("melpa"    . 5)
				   ("gnu"      . 4)
                                   ("jcs-elpa" . 0)))

(require 'package)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; declare packages
(setq my-packages
      '(vertico
	savehist
	org-ai
	dired-sidebar
	org-download
	chatgpt-shell
	dall-e-shell
	doom-themes
	disable-mouse
	company-go
	company
	lsp-mode
	go-mode
	autothemer
	chatgpt
	evil
	sqlite3
	disable-mouse
	org-download
	rainbow-delimiters
	beacon
	chatgpt
	nyan-mode
	magit))

;; iterate on packages and install missing ones

(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))


;; Enable vertico
(require 'vertico)
(vertico-mode)

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; chatgpt-shell Need to start putting this stuff into ^/.authinfo
(require 'chatgpt-shell)
(require 'dall-e-shell)

;; org-ai

(use-package org-ai
  :ensure t
  :commands (org-ai-mode
             org-ai-global-mode)
  :init
  (add-hook 'org-mode-hook #'org-ai-mode) ; enable org-ai in org-mode
  :config
  (setq org-ai-default-chat-model "gpt-3.5-turbo"))

;; dired-sidebar

(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

(require 'doom-themes)

(require 'disable-mouse)
(global-disable-mouse-mode)

;;;;;;;;;;;;;;;;;;;;;;;
;; themes and look   ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; Global settings (defaults)
(setq doom-themes-enable-bold t)    ; if nil, bold is universally disabled
(setq doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme may have their own settings.
(load-theme 'doom-challenger-deep t)
;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6454421996f0508c38215a633256e36c19a28591542fb0946cfc40f1dceb89cf" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c" "a9dc7790550dcdb88a23d9f81cc0333490529a20e160a8599a6ceaf1104192b5" "3de5c795291a145452aeb961b1151e63ef1cb9565e3cdbd10521582b5fd02e9a" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" "6adeb971e4d5fe32bee0d5b1302bc0dfd70d4b42bad61e1c346599a6dc9569b5" "29b4f767c48da68f8f3c2bbf0dde2be58e4ed9c97e685af5a7ab7844f0d08b8b" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "badd1a5e20bd0c29f4fe863f3b480992c65ef1fa63951f59aa5d6b129a3f9c4c" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" default)))

;; Machine specific settings
(setq ispell-program-name
      (if (string= (system-name) "Benjamins-MacBook-Pro.local")
	  "/usr/local/Cellar/hunspell/1.7.2/bin/hunspell"
	(if (string= (system-name) "Benjamins-MacBook-Pro.local")
	    "C:/Users/BenRoberts/Applications/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe"
	  "")))

;; set up spelling, one has to download these dictionaries separately
(setq ispell-dictionary "en_GB")

;;;;;;;;;;;;;;;;;;;;;
;;     Secrets     ;;
;;;;;;;;;;;;;;;;;;;;;

(load "secrets.el")
