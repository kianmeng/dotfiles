;; auto-completion
;; @see http://company-mode.github.io/
(use-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (setq tab-always-indent 'complete))
)

(provide 'init-company)
