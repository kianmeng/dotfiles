;; quickrun mode
;; @see https://github.com/syohex/emacs-quickrun

(use-package quickrun 
  :config
  (progn
    (setq quickrun-focus-p nil))
    ;; disable to prevent conflict with flycheck
    ;;(add-hook 'prog-mode-hook 'quickrun-autorun-mode))
)

(provide 'init-quickrun)
