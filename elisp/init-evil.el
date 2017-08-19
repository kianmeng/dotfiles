;; enable evil-mode
;; @see https://www.emacswiki.org/emacs/Evil

(use-package evil
  :config
  (progn 
    (use-package evil-leader
    :config
    (progn
      ;; must be enabled before 'evil-mode'
      ;; @see https://github.com/cofi/evil-leader
      (global-evil-leader-mode)
      (evil-leader/set-key
        "<SPC>" 'keyboard-escape-quit
        "a" 'avy-goto-word-1
        "b" 'helm-buffers-list
        "c" 'comment-or-uncomment-region
        "e" 'find-file
        "f" 'helm-find-files
        "h" 'split-window-horizontally
        "k" 'kill-buffer
        "o" 'other-window ;; alias to C-x o
        "q" 'keyboard-escape-quit
        "r" 'quickrun
        "s" 'save-buffer
        "t" 'eshell
        "v" 'split-window-vertically
        "w" 'save-buffers-kill-emacs ;; alias to C-x C-c
        "x" 'helm-M-x)
      (evil-leader/set-leader "<SPC>")))

    ;; enable evil-mode
    (evil-mode 1)

    ;; bind ';' to ':'
    ;; @see https://redd.it/2zjon0
    (define-key evil-normal-state-map (kbd ";") 'evil-ex)
    (define-key evil-visual-state-map (kbd ";") 'evil-ex)

    ;; bind 'kj' to escape from different states, buffers
    ;; https://github.com/syl20bnr/evil-escape
    ;;
    ;; unless we can disable evil-escape mode in evil insert mode,
    ;; switch to 'kj' as key to escape.
    ;; @see https://github.com/syl20bnr/evil-escape/issues/66
    ;; @see https://github.com/syl20bnr/evil-escape/pull/61
    (use-package evil-escape
    :config
    (progn
      (evil-escape-mode t)
      (setq-default evil-escape-delay 0.5)
      (setq-default evil-escape-key-sequence "kj")))

    ;; use tab like in Vim
    ;; gt to switch tab or <number>gt to switch to exact tab
    ;; @see https://github.com/krisajenkins/evil-tabs
    (use-package evil-tabs
    :config
    (progn
      (global-evil-tabs-mode t))))
)

(provide 'init-evil)
