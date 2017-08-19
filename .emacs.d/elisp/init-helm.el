;; helm mode
;; @see https://github.com/emacs-helm/helm

(use-package helm
  :config
  (progn
    (helm-mode 1)
    (setq helm-M-x-fuzzy-match t))
)

(provide 'init-helm)
