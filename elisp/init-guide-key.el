;; enable guide-key
;; @see https://github.com/kai2nenobu/guide-key

(use-package guide-key
  :diminish guide-key-mode
  :config
  (progn 
    (setq guide-key/guide-key-sequence t)
    (setq guide-key/recursive-key-sequence-flag t)
    (setq guide-key/popup-window-position 'bottom)
    (setq guide-key/idle-delay 0.1)
    (setq guide-key/highlight-command-regexp
      '("rectangle"
        ("register" . font-lock-type-face)
        ("bookmark" . "hot pink")))
    (guide-key-mode 1))
)

(provide 'init-guide-key)
