;; cperl/perl6mode
;; @see https://github.com/hinrik/perl6-mode
;; @see https://www.emacswiki.org/emacs/CPerlMode

(use-package perl6-mode
  :defer t)

(use-package cperl-mode
  :defer t
  :interpreter
  (("perl" . cperl-mode)
   ("perl5" . cperl-mode)
   ("miniperl" . cperl-mode))
  :config
  (progn
    (defalias 'perl-mode 'cperl-mode)
    (define-key cperl-mode-map (kbd "RET") 'reindent-then-newline-and-indent)

    (setq cperl-hairy t)
    (setq cperl-auto-newline t)
    (setq cperl-highlight-variables-indiscriminately t)

    ;; 4 spaces indent
    (setq cperl-indent-level 4 
          cperl-close-paren-offset -4
          cperl-continued-statement-offset 4
          cperl-indent-level 4
          cperl-indent-parens-as-block t
          cperl-tab-always-indent t))
)

(provide 'init-perl)
