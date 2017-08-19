;; enable smex, M-x enhancement
;; @see https://github.com/nonsequitur/smex

(use-package smex
  :config
  (progn 
    (smex-initialize)
    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "<f2>") 'smex))
)

(provide 'init-smex)
