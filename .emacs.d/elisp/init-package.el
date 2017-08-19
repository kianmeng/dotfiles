;; setup and initialize packages
;; @see https://www.gnu.org/software/emacs/manual/html_node/emacs/Packages.html
;; @see https://www.emacswiki.org/emacs/ELPA_

(require 'package)
(setq load-prefer-newer t)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(provide 'init-package)
