;; default location for own .el files
;; @see https://github.com/purcell/emacs.d
(add-to-list 'load-path (concat user-emacs-directory (convert-standard-filename "elisp")))

;; bootstrap
(require 'init-package)
(require 'init-use-package)

;; my customization
(require 'init-emacs)
(require 'init-helm)
(require 'init-avy)
(require 'init-evil)
(require 'init-powerline)
(require 'init-saveplace)
(require 'init-which-key)
(require 'init-company)
(require 'init-csv)
(require 'init-popwin)
(require 'init-themes)

;; temp disabled
;;(require 'init-ido)
;;(require 'init-smex)

;; languages stuff
(require 'init-quickrun)
(require 'init-golang)
(require 'init-perl)
(require 'init-flycheck)
