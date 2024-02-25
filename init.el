
;; packages to consider uninstalling
;; helm

;; no startup msg  
(setq inhibit-startup-message t)

;; font and frame size
(set-frame-font "Consolas 12")
(set-frame-size (selected-frame) 125 34)

;; Set shell <- don't need this as will be using eshell as my shell
;; (setq explicit-shell-file-name "C:/Users/BenRoberts/AppData/Local/Programs/Git/bin/bash.exe")
;; (setq explicit-bash.exe-args '("--login" "-i"))

;; default directory
(setq default-directory "~/")

;;;;;;;;;;;;;;;;;;;;;;;
;; packages          ;;
;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(require 'org-download) ;;org-download-yank is the command that s useful for embedding an image from the web into an org-mode document.

;; chatgpt-shell Need to start putting this stuff into ^/.authinfo
(require 'chatgpt-shell)
(require 'dall-e-shell)
(setq chatgpt-shell-openai-key "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")

;; org-ai

(use-package org-ai
  :ensure t
  :commands (org-ai-mode
             org-ai-global-mode)
  :init
  (add-hook 'org-mode-hook #'org-ai-mode) ; enable org-ai in org-mode
;;  (org-ai-global-mode) ; installs global keybindings on C-c M-a
  :config
  (setq org-ai-default-chat-model "gpt-3.5-turbo")
  (setq org-ai-openai-api-token "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")) ; don't store these in plain text

;; dired-sidebar

(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

(require 'doom-themes)

(global-disable-mouse-mode)
;;(set-face-background 'indent-guide-face "dimgray")

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
   '("6454421996f0508c38215a633256e36c19a28591542fb0946cfc40f1dceb89cf" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c" "a9dc7790550dcdb88a23d9f81cc0333490529a20e160a8599a6ceaf1104192b5" "3de5c795291a145452aeb961b1151e63ef1cb9565e3cdbd10521582b5fd02e9a" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" "6adeb971e4d5fe32bee0d5b1302bc0dfd70d4b42bad61e1c346599a6dc9569b5" "29b4f767c48da68f8f3c2bbf0dde2be58e4ed9c97e685af5a7ab7844f0d08b8b" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "badd1a5e20bd0c29f4fe863f3b480992c65ef1fa63951f59aa5d6b129a3f9c4c" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" default))
 '(org-agenda-files
   '("c:/Users/BenRoberts/Documents/personal/personal.org" "c:/Users/BenRoberts/OneDrive - cloudkubed.com/org_files/knowledge_building/knowledge_building.org" "c:/Users/BenRoberts/OneDrive - cloudkubed.com/org_files/projects/mhra/data_strategy_legacy_archive_messaging.org" "c:/Users/BenRoberts/OneDrive - cloudkubed.com/org_files/projects/mhra/mhra_data_analytics.org" "c:/Users/BenRoberts/OneDrive - cloudkubed.com/org_files/projects/tre/tre.org" "c:/Users/BenRoberts/OneDrive - cloudkubed.com/org_files/ck_todo.org" "c:/Users/BenRoberts/OneDrive - cloudkubed.com/org_files/temp_notes.org"))
 '(package-selected-packages
   '(company-go company lsp-mode go-mode autothemer evil dall-e-shell chatgpt-shell sqlite3 disable-mouse org-download rainbow-delimiters vertico beacon chatgpt pdf-tools nyan-mode magit dired-sidebar all-the-icons doom-themes)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global modes               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(beacon-mode 1)
(nyan-mode 1)

;;;;;;;;;;;;;;;;;;;
;; Mode settings ;;
;;;;;;;;;;;;;;;;;;;


;; go-mode
(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Note org-mode has its own section for settings

(add-hook 'prog-mode-hook
	  (lambda ()
	    (display-line-numbers-mode 1)
            (visual-line-mode -1)
	    (rainbow-delimiters-mode 1)
	    (setq show-trailing-whitespace t)
	    (company-mode)))

;; I don't understand why emacs-lisp-mode is ot inheriting from prog-mode
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (display-line-numbers-mode 1)
            (visual-line-mode -1)
	    (rainbow-delimiters-mode 1)
	    (setq show-trailing-whitespace t)))

;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode settings ;;
;;;;;;;;;;;;;;;;;;;;;;;

(setq org-directory "~/org_files/")

;; turn on indent mode and line wrapping
(add-hook 'org-mode-hook
	  (lambda ()
	    (visual-line-mode 1)
	    (org-indent-mode 1)
	    (rainbow-delimiters-mode 1)))

(add-hook 'org-agenda-mode-hook
          (lambda ()
            (visual-line-mode -1)))

;; org-agenda
(setq org-agenda-files (directory-files-recursively org-directory "\\.org$")) ;; I would like to modify this to exclude .org# and .org~ files 

;; TODO setting

(setq org-todo-keywords
      '(
	(sequence "TODO" "DOING" "TESTING" "|")
	(sequence "LATER" "NEXT" "NOW" "|")	
	(sequence "|" "DONE" "DELEGATED")))

;; Automatically update the top level todo task when sub items are completed
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-todo-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; dired-mode settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(setq delete-by-moving-to-trash t)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Movement and editing ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq next-line-add-newlines t) ;; Create a new line when we hit the end of the buffer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Machine specific settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq
  ispell-program-name
  "C:/Users/BenRoberts/Applications/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")

(setq ispell-dictionary "en_GB")

;;;;;;;;;;;;;;;;;;;;;
;; Other variables ;;
;;;;;;;;;;;;;;;;;;;;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;; Settings for programs I am working on ;;;;;;;;;

(setq my-db "C:/Users/BenRoberts/OneDrive - cloudkubed.com/projects/ai/northwind.db")








