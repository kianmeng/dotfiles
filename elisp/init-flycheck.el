;; flycheck mode - real-time syntax
;; @see https://github.com/flycheck/flycheck
;; @see http://stackoverflow.com/a/15556197

(use-package flycheck
  :defer t
  :init
  (progn
    (add-hook 'after-init-hook 'global-flycheck-mode)
    (add-hook 'flycheck-mode-hook 'flycheck-list-errors)
    (add-hook 'go-mode-hook 'flycheck-mode))
  :config
  (progn
    (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)
    (setq flycheck-check-syntax-automatically '(mode-enabled idle-change new-line)))

    ;; perl6
    ;; @see https://github.com/hinrik/flycheck-perl6
    (use-package flycheck-perl6))
)

(provide 'init-flycheck)
