;; customization for emacs itself

;; hide menu/tool/scroll bar 
(menu-bar-mode -1)
(tool-bar-mode -1) 
(toggle-scroll-bar -1) 

;; hide splash / startup
;; @see http://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; start maximized
;; @see http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; enable parenthesis autoclosing
;; @see https://www.gnu.org/software/emacs/manual/html_node/emacs/Matching.html
(electric-pair-mode 1)

;; enable parenthesis matching
;; https://www.emacswiki.org/emacs/ShowParenMode
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)

;; shorter y/n prompt and do not confirm non-existing files
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)

;; line number
;; @see https://www.emacswiki.org/emacs/LineNumbers
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

;; which func mode
;; @see https://www.emacswiki.org/emacs/WhichFuncMode
(which-function-mode 1)

;; global key bindings
;; @see https://www.emacswiki.org/emacs/FullScreen
(global-set-key (kbd "<f1>") 'help-for-help)            ;; either press 'f' or 'v'
(global-set-key (kbd "<f3>") 'eshell)                   ;; eshell
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen) ;; toggle fullscreen

(provide 'init-emacs)
