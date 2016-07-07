;; general
(cd "c:/Users/artem")
(setq default-directory "c:/Users/artem")
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t)
(transient-mark-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)

(use-package try
  :ensure t)

;; macros
(fset 'frame-itemized
      [return ?\\ ?b ?e ?g ?i ?n ?\{ ?f ?r ?a ?m ?e ?\} return ?\\ ?b ?e ?g ?i ?n ?\{ ?i ?t ?e ?m ?i ?z ?e ?\} return return ?\\ ?e ?n ?d ?\{ ?i ?t ?e ?m ?i ?z ?e ?\} return ?\\ ?e ?n ?d ?  backspace ?\{ ?f ?r ?a ?m ?e ?\} return ?\C-p ?\C-p ?\C-p tab])

(fset 'frame-listing
   [?\\ ?b ?e ?g ?i ?n ?\{ ?f ?r ?a ?m ?e ?\} ?\[ ?f ?r ?a ?g ?i ?l ?e ?\] return ?\\ ?f ?r ?a ?m ?e ?t ?i ?t ?l ?e ?\{ ?\} return ?\\ ?b ?e ?g ?i ?n ?\{ ?l ?s ?t ?l ?i ?s ?t ?i ?n ?g ?\} return return ?\\ ?e ?n ?d ?\{ ?l ?s ?t ?l ?i ?s ?t ?i ?n ?g ?\} return ?\\ ?e ?n ?d ?\{ ?f ?r ?a ?m ?e ?\} tab ?\C-p ?\C-p ?\C-p ?\C-p right right right])

 
;; edit server
(use-package edit-server)

(when (require 'edit-server nil t)
  (setq edit-server-new-frame nil)
  (edit-server-start))

(when (and (require 'edit-server nil t) (daemonp))
  (edit-server-start))

(setq edit-server-url-major-mode-alist
      '(("github\\.com" . markdown-mode)))        

;; helm setting
(require 'helm-config)
(helm-mode 1)

;; ido setting
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; paredit
(require 'paredit-everywhere)
(add-hook 'after-init-hook 'paredit-everywhere-mode)

;; org mode
(require 'org)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords '("TODO" "STARTED" "WAITING" "DONE"))

(setq org-agenda-include-diary t)
(setq org-agenda-include-all-todo t)
(setq org-agenda-include-deadlines t)
(setq org-indent-mode t)

(setq org-capture-templates
      '(("o" "Organizer" entry
	 (file+headline "c:/Users/artem/Dropbox/org/organizer.org" "Inbox")
	 "** TODO %?\n  %i\n")
	("O" "Organizer with link" entry
	 (file+headline "c:/Users/artem/Dropbox/org/organizer.org" "Inbox")
	 "** TODO %?\n  %i\n  %A\n")
	("w" "Work" entry
	 (file+headline "c:/Users/artem/Dropbox/org/work.org" "Inbox")
	 "** TODO %?\n  %i\n")
	("W" "Work with link" entry
	 (file+headline "c:/Users/artem/Dropbox/org/work.org" "Inbox")
	 "** TODO %?\n  %i\n  %A\n")
	("j" "Journal" entry
	 (file+datetree "c:/Users/artem/Dropbox/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))

;; slime
(add-to-list 'exec-path "C:/Program Files/Steel Bank Common Lisp/1.3.6")
(setq inferior-lisp-program "sbcl")

;; which key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(setq which-key-idle-delay 0.1)
