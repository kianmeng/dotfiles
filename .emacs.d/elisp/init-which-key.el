;; enable which-key
;; @see https://github.com/justbur/emacs-which-key

(use-package which-key
  :diminish which-key-mode
  :init
  (progn 
    (setq which-key-sort-order 'which-key-description-order)
    (setq which-key-idle-delay 0.1))
  :config
  (progn 
    (which-key-mode)
    (which-key-setup-side-window-bottom))
)

(provide 'init-which-key)
