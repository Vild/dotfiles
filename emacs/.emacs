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

(setq-default fill-column 80)

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

(require 'package)

;; Repositories
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(defun el-get-cleanup (packages)
  "Remove packages not explicitly declared"
  (let* ((packages-to-keep (el-get-dependencies (mapcar 'el-get-as-symbol packages)))
         (packages-to-remove (set-difference (mapcar 'el-get-as-symbol
                                                     (el-get-list-package-names-with-status
                                                      "installed")) packages-to-keep)))
    (mapc 'el-get-remove packages-to-remove)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(defvar my-packages
  '(notmuch neotree d-mode company-mode flycheck irony-mode flycheck-irony company-irony glsl-mode wakatime-mode multiple-cursors fold-this)
  "Canonical list of packages.")
(el-get-cleanup my-packages)
(el-get 'sync my-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(global-linum-mode t)
 '(global-whitespace-mode t)
 '(neo-autorefresh nil)
 '(neo-click-changes-root nil)
 '(neo-theme (quote classic))
 '(neo-window-position (quote right))
 '(package-selected-packages (quote (el-get)))
 '(select-active-regions nil)
 '(tab-width 2)
 '(whitespace-global-modes t)
 '(whitespace-style (quote (face trailing lines-tail space-before-tab))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-carriage-return-face ((((class color)) (:background "blue"))) t)
 '(my-tab-face ((((class color)) (:background "green"))) t))

(global-set-key [f6] (lambda ()
											 (interactive)
											 (set-default-font "lucy tewi Book 8")))

(global-set-key [f7] (lambda ()
											 (interactive)
											 (set-default-font "DejaVu Sans Mono Book 14")))

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono Book 14"))

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

(add-hook 'c++-mode-hook 'company-irony)
(add-hook 'c-mode-hook 'company-irony)
(add-hook 'objc-mode-hook 'company-irony)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

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
