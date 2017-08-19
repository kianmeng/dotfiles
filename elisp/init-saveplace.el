;; enable saveplace
;; @see https://www.emacswiki.org/emacs/SavePlace

(use-package saveplace
  :config
  (progn 
    (setq-default save-place t)
    (setq save-place-file (concat user-emacs-directory (convert-standard-filename "save-place")))
    (setq save-place-forget-unreadable-files nil))
)

(provide 'init-saveplace)
