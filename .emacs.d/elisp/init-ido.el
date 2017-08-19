;; Ido (Interactively Do Things) 
;; @see http://wikemacs.org/wiki/Ido

(use-package ido
  :init 
  (progn 
    (ido-mode 1)
    (ido-everywhere 1))
  :config
  (progn
    (setq ido-enable-flex-matching t) ;; fuzzy matching
    (setq ido-case-fold t) ;; ignore case
    (setq ido-everywhere t)
    (setq ido-enable-prefix nil)
    (setq ido-create-new-buffer 'always)
    (setq ido-max-prospects 10)
    (setq ido-use-faces nil))
)

(provide 'init-ido)
