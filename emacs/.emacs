(require 'time)
(display-time)
(setq display-time-24hr-format t)

(column-number-mode t)
(line-number-mode t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(add-to-list 'default-frame-alist '(internal-border . 0))

(setq visible-bell t)

(global-hl-line-mode 1)

(setq case-fold-search t)

(if (< emacs-major-version 24)
    (pc-selection-mode 1)
  (progn
    (delete-selection-mode 1)
    (setq x-select-enable-clipboard t
					x-select-enable-primary t)))


(setq select-active-regions t)

(set-default-font "DejaVu Sans Mono Book 14")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'package)
;; Repositories
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(defun el-get-cleanup (packages)
  "Remove packages not explicitly declared"
  (let* ((packages-to-keep (el-get-dependencies (mapcar 'el-get-as-symbol packages)))
         (packages-to-remove (set-difference (mapcar 'el-get-as-symbol
                                                     (el-get-list-package-names-with-status
                                                      "installed")) packages-to-keep)))
    (mapc 'el-get-remove packages-to-remove)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; auto-complete flycheck-d-unittest flycheck-dmd-dub ac-dcd
(defvar my-packages
  '(notmuch neotree d-mode company-mode flycheck irony-mode flycheck-irony company-irony glsl-mode wakatime-mode multiple-cursors fold-this yaml-mode wc-mode gnuplot-mode org-ref htmlize pdf-tools artbollocks-mode magit graphql graphql-mode irony-eldoc bison flex sdlang-mode use-package transient)
  "Canonical list of packages.")
(el-get-cleanup my-packages)
(el-get 'sync my-packages)

(package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(c-default-style
	 (quote
		((c-mode . "cc-mode")
		 (c++-mode . "cc-mode")
		 (java-mode . "java"))))
 '(c-tab-always-indent nil)
 '(company-irony-ignore-case t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(global-auto-complete-mode nil)
 '(global-auto-revert-mode t)
 '(global-linum-mode t)
 '(global-magit-file-mode t)
 '(global-whitespace-mode t)
 '(irony-supported-major-modes
	 (quote
		(c++-mode c-mode objc-mode bison-mode flex-mode cuda-mode)))
 '(magit-auto-revert-mode t)
 '(magit-wip-after-apply-mode nil)
 '(magit-wip-after-save-mode nil)
 '(magit-wip-before-change-mode nil)
 '(neo-autorefresh nil)
 '(neo-click-changes-root nil)
 '(neo-theme (quote classic))
 '(neo-window-position (quote right))
 '(org-ascii-inner-margin 0)
 '(org-ascii-verbatim-format "'%s'")
 '(org-babel-load-languages
	 (quote
		((emacs-lisp . t)
		 (C . t)
		 (gnuplot . t)
		 (plantuml . t)
		 (dot . t)
		 (python . t)
		 (shell . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-latex-listings (quote minted))
 '(org-latex-minted-options (quote (("breaklines" "true") ("breakanywhere" "true"))))
 '(org-latex-packages-alist (quote (("" "minted" nil))))
 '(org-latex-pdf-process
	 (quote
		("latexmk -pdflatex='pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f' -pdf -bibtex -f %f")))
 '(org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
 '(org-src-fontify-natively t)
 '(package-selected-packages (quote (el-get)))
 '(safe-local-variable-values
	 (quote
		((c-set-style . cc-mode)
		 (c-default-style . cc-mode)
		 (org-confirm-babel-evaluate))))
 '(select-active-regions nil)
 '(tab-width 2)
 '(visible-bell nil)
 '(wakatime-cli-path "/usr/bin/wakatime")
 '(wakatime-python-bin nil)
 '(whitespace-global-modes t)
 '(whitespace-style (quote (face trailing lines-tail space-before-tab))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(artbollocks-passive-voice-face ((t (:background "White" :foreground "black"))))
 '(artbollocks-weasel-words-face ((t (:background "White" :foreground "firebrick"))))
 '(my-carriage-return-face ((((class color)) (:background "blue"))) t)
 '(my-tab-face ((((class color)) (:background "green"))) t))

(global-set-key [f6] (lambda ()
											 (interactive)
											 (set-default-font "lucy tewi Book 8")))

(global-set-key [f7] (lambda ()
											 (interactive)
											 (set-default-font "DejaVu Sans Mono Book 14")))
(global-set-key [f6] (lambda ()
											 (interactive)
											 (set-default-font "lucy tewi Book 8")))

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono Book 14"))

(global-unset-key (kbd "C-z"))

(defun close-all-buffers ()
	(interactive)
  (mapc 'kill-buffer (buffer-list)))

(delete-selection-mode)

(add-hook 'c-mode-common-hook
					(lambda ()
						(font-lock-add-keywords nil
																		'(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\):" 1 font-lock-warning-face t)))))

(require 'notmuch)
(add-to-list 'auto-mode-alist '("xwildn00bx@gmail.com" . notmuch-message-mode))
(add-to-list 'auto-mode-alist '("me@vild.io" . notmuch-message-mode))
(add-to-list 'auto-mode-alist '("arch@vild.io" . notmuch-message-mode))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;;(add-hook 'c++-mode-hook 'company-irony)
;;(add-hook 'c-mode-hook 'company-irony)
;;(add-hook 'objc-mode-hook 'company-irony)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook #'irony-eldoc)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-irony-setup))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(global-set-key (kbd "<C-return>") 'company-complete)
(global-set-key (kbd "M-RET") 'company-complete)

(require 'wakatime-mode)
(global-wakatime-mode)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

; The '<' & '>' have been reverted due to kb layout
(global-set-key (kbd "C-<") 'mc/mark-next-like-this)
(global-set-key (kbd "C->") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'fold-this)
(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

;;; ac-dcd
;;(require 'ac-dcd)
;;(add-hook 'd-mode-hook 'ac-dcd-setup)

;;(require 'flycheck)
;;(global-flycheck-mode)

;;(defun orgfix-redisplay-inline-images ()
;;  (when org-inline-image-overlays
;;    (org-redisplay-inline-images)))

;;(after-loading 'org
;;							 (add-hook 'org-babel-after-execute-hook 'orgfix-redisplay-inline-images))

(with-eval-after-load 'org
  (add-hook 'org-mode-hook #'flyspell-mode)
  (add-hook 'org-mode-hook #'ispell-minor-mode))

(require 'org-ref)

(setq org-ref-bibliography-notes "~/MEGA/bibliography/notes.org"
      org-ref-default-bibliography '("~/MEGA/bibliography/references.bib")
      org-ref-pdf-directory "~/MEGA/bibliography/pdfs/")

(setq bibtex-completion-bibliography "~/MEGA/bibliography/references.bib"
      bibtex-completion-library-path "~/MEGA/bibliography/bibtex-pdfs"
      bibtex-completion-notes-path "~/MEGA/bibliography/helm-bibtex-notes")

(setq bibtex-completion-pdf-open-function 'org-open-file)

(require 'artbollocks-mode)
(add-hook 'text-mode-hook 'artbollocks-mode)
(add-hook 'org-capture-mode-hook 'artbollocks-mode)

(defun check-grammar ()
	"Checks the current buffer with atdtool"
	(interactive)
	(compile (concat "atdtool " (shell-quote-argument (buffer-file-name)))))

(require 'git-commit)
(require 'magit)

(require 'server)
(use-package server
						 :config (or (server-running-p) (server-mode)))

(provide '.emacs)
;;; .emacs ends here
