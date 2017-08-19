;; default location for own .el files
;; @see https://github.com/purcell/emacs.d

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory (convert-standard-filename "elisp")))

;; bootstrap
(require 'init-package)
(require 'init-use-package)

;; my customization
(require 'init-emacs)
(require 'init-helm)
(require 'init-avy)
(require 'init-evil)
(require 'init-powerline)
(require 'init-saveplace)
(require 'init-which-key)
(require 'init-company)
(require 'init-csv)
(require 'init-popwin)
(require 'init-themes)

;; temp disabled
;;(require 'init-ido)
;;(require 'init-smex)

;; languages stuff
(require 'init-quickrun)
(require 'init-golang)
(require 'init-perl)
(require 'init-flycheck)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (flycheck perl6-mode go-mode quickrun monokai-theme popwin csv-mode company which-key powerline evil-tabs evil-escape evil-leader evil avy helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
