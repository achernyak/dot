;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
	     
(package-initialize)

;; bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
	     
(custom-set-variables
 ;; custom-set-variables was added by Custom.  If you edit it by hand,
 ;; you could mess it up, so be careful.  Your init file should
 ;; contain only one such instance.  If there is more than one, they
 ;; won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(delete-selection-mode t)
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (org-bullets
     try
     which-key
     org-jekyll
     org-journal
     paredit-everywhere
     paredit
     helm-ispell
     latex-extra
     slime-company
     slime
     helm-projectile
     helm-company
     helm
     company
     markdown-preview-mode
     markdown-mode+
     markdown-mode
     edit-server
     use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.  If you edit it by hand, you
 ;; could mess it up, so be careful.  Your init file should contain
 ;; only one such instance.  If there is more than one, they won't
 ;; work right.
 )

(load-file "~/.emacs.d/init.el")
