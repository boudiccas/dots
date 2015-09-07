;;; -*- emacs-lisp-mode -*- --- init file
;;; mine from 27-11-13. Heavily influenced by http://www.aaronbedra.com/emacs.d/
;; Show errors in this file:
;;; Code:
;; (setq debug-on-error t)
;; (setq stack-trace-on-error t)
(setq debug-on-error t
debug-on-signal nil
debug-on-quit nil)

(setq load-path (cons "/home/boudiccas/.emacs.d/lisp" load-path))
(add-to-list 'load-path "/home/boudiccas/git/org-mode" load-path)
(add-to-list 'load-path "/home/boudiccas/.emacs.d/personal-lisp" load-path)
;; (setq load-path (cons "/home/boudiccas/.emacs.d/personal-elisp" load-path))
 ;; (add-to-list 'load-path "~/.emacs.d/")
 ;; (let ((default-directory "~/.emacs.d/")))
 ;; (setq default-directory "~/.emacs.d/")
 ;;   (normal-top-level-add-subdirs-to-load-path)
 ;; (add-to-list 'load-path "/home/boudiccas/.emacs.d/")

(setq custom-file "/home/boudiccas/.emacs.d/custom.el")
'(custom-menu-sort-alphabetically t)
(package-initialize)

(require 'setup-autocomplete)
(require 'bind-key)
(require 'rainbow-delimiters)
(require 'rainbow-mode)
;; (require 'bookmark+)
(require 'paredit)
;; (require 'fic-mode)
;; (fic-mode t)
;; (require 'easy-menu)
(cua-mode t)
;; CUA mode sets up key bindings used in many other applications (`C-x',
;; `C-c', `C-v' and `C-z').
;;
;; The `C-x' and `C-c' keys only do cut and copy when the region is active, so
;; in most cases, they do not conflict with the normal function of these
;; prefix keys.

(global-rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(show-paren-mode 1)
(electric-pair-mode 1)

'(display-time-mode t)
;; ; '(global-smart-tab-mode t)
;;  '(show-paren-mode t)
;;  '(show-smartparens-global-mode +1)
'(column-number-mode t)
(setq selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;; Language Environment
(set-language-environment 'utf-8)
(setq org-startup-indented t)
(require 'imenu+)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
		  '(lambda() (set-fill-column 78)))
(add-hook 'org-mode-hook
		  '(lambda() (linum-mode -1)))

;;; autosave
; save every 100 characters typed
;; (setq auto-save-interval 100)
;; ; save after 10 seconds of idle time
;; (setq auto-save-timeout 10)

;; (defun my-save-buffer-if-visiting-file (&optional args)
;;   "Save the current buffer only if it is visiting a file"
;;   (interactive)
;;     (if (buffer-file-name)
;;         (save-buffer args)
;;     )
;; )
;; (add-hook 'auto-save-hook 'my-save-buffer-if-visiting-file)

;; Switch off start up message to have scatch buffer
(setq inhibit-startup-message t)
;; Nothing in scratch buffer
(setq initial-scratch-message nil)

; each line of text gets one line on the screen (i.e., text will run
; off the left instead of wrapping around onto a new line)
(setq-default truncate-lines 1)
(visual-line-mode t)
; truncate lines even in partial-width windows
(setq truncate-partial-width-windows 1)

;; check spelling on the fly:
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
;;    (dolist (hook '(text-mode-hook))
;;      (add-hook hook (lambda () (flyspell-mode 1))))
;;    (dolist (hook '(change-log-mode-hook log-edit-mode-hook))
;;      (add-hook hook (lambda () (flyspell-mode -1))))
;; (global-set-key "\C-cs" 'flyspell-buffer)

;; Use hunspell instead of ispell
(if (file-exists-p "/usr/bin/hunspell")
    (progn
      (setq ispell-program-name "hunspell")
      (eval-after-load "ispell"
        '(progn (defun ispell-get-coding-system () 'utf-8)))))
(setq ispell-program-name "hunspell")
(require 'rw-hunspell)
(require 'rw-language-and-country-codes)
(require 'rw-ispell)
(setq ispell-dictionary "en_GB_hunspell")

 '(column-number-mode t)
 '(confirm-kill-emacs (quote y-or-n-p))

;; (add-to-list 'load-path "~/.emacs.d/")
;; (let ((default-directory "~/.emacs.d/")))
;; (setq default-directory "~/.emacs.d/")
;;   ;;(normal-top-level-add-subdirs-to-load-path)
;; (add-to-list 'load-path "/home/boudiccas/.emacs.d/")
;; (require 'setup-autocomplete)

;(add-to-list 'load-path "~/elisp")
(require 'recentf)
(recentf-mode 1)
(require 'discover)
  (global-discover-mode 1)
;(require 'sunrise-commander)
;(require 'sunrise-x-buttons)
;(require 'sunrise‐x‐modeline)
;(require 'lusty-explorer)
;(require 'diminish)
;(require 'smart-tab)
;(global-smart-tab-mode 1)

;;(add-hook 'text-mode-hook 'turn-spell-checking-on)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
 (setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))
 (setq ido-ignore-extensions t)
 (setq inhibit-startup-message t
  inhibit-startup-echo-area-message t)
 (define-key global-map (kbd "RET") 'newline-and-indent)
	(setq next-line-add-newlines t)
(setq major-mode 'text-mode)
(load "time" t t)
(display-time)
(tooltip-mode t)

(setq-default
 ;; we usually want a final newline...
 require-final-newline 'ask
 indent-tabs-mode t
 ;; If you don't know, just give me text-mode
 default-major-mode 'text-mode
 ;; I don't like emacs destroying my window setup
 even-window-heights nil
 ;; Same here
 resize-mini-windows nil
 ;; No am/pm here
 display-time-24hr-format t
 ;; Use w3m for URLs
 ;;; browse-url-browser-function 'w3m-browse-url
 ;;; browse-url-browser-function 'fc-choose-browser
 ;; A tab is
 default-tab-width 4
 ;; Scrolling is moving the document, not moving my eyes
 scroll-preserve-screen-position 'keep
  ;; I kinda know my emacs
 inhibit-startup-message t
 ;; context is nicer to read
 diff-switches "-c"
 ;; nice comment format
 comment-style 'extra-line
 ;; case insensitivity for the masses!
 case-fold-search t
 read-file-name-completion-ignore-case t
 completion-ignore-case t
 ;; Don't show a cursor in other windows
 cursor-in-non-selected-windows nil
 ;; A wide characters ask for a wide cursor
 x-stretch-cursor t
 ;; i want a mouse yank to be inserted where the point is, not where i click
 mouse-yank-at-point t
 ;; Don't highlight stuff that I can click on all the time. I don't click
 ;; anyways.
 ;; mouse-highlight 1
)

(global-font-lock-mode t)
;; Set Linum-Mode on
(global-linum-mode t)
;; (global-longlines-mode t)
;; Linum-Mode and add space after the number
(setq linum-format "%d ")

(add-to-list 'load-path "~/git/org-mode/lisp")
     (add-to-list 'load-path "~/git/org-mode/contrib/lisp" t)
;; (add-to-list 'load-path "/home/boudiccas/git/org-mode")
;; (require 'org-mode)
;; (add-hook 'org-mode-hook 'turn-on-font-lock)

;; setting up 'imenu'
(local-set-key "\C-x\C-a" 'show-all)
(add-hook 'org-mode-hook
(lambda () (imenu-add-to-menubar "Imenu")))
(setq org-imenu-depth 6)

(add-hook 'latex-mode-hook
(lambda () (imenu-add-to-menubar "Imenu")))
(setq latex-imenu-depth 6)

  (setq comment-start nil)

  (require 'calendar)
  (when (require 'org nil t)
    (call-interactively 'org-agenda-list))
(setq org-agenda-span 21)
       ;; org-agenda-start-day "-7d"
;; (require 'secrets)

(when (featurep 'menubar)
;; Add `dired' to the File menu
(add-menu-button '("File") ["Edit Directory" dired t]))

;; Here's a way to add scrollbar-like buttons to the menubar
;   (add-menu-button nil ["Top" beginning-of-buffer t])
;   (add-menu-button nil ["<<<" scroll-down         t])
;   (add-menu-button nil [" . " recenter            t])
;   (add-menu-button nil [">>>" scroll-up           t])
;   (add-menu-button nil ["Bot" end-of-buffer       t])

;; ===== Set the highlight current line minor mode =====
;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; Fix foolish calendar-mode scrolling.
(add-hook 'calendar-load-hook
 '(lambda ()
 (setq mark-holidays-in-calendar t)
 (define-key calendar-mode-map ">" 'scroll-calendar-left)
 (define-key calendar-mode-map "<" 'scroll-calendar-right)
 (define-key calendar-mode-map "\C-x>" 'scroll-calendar-left)
 (define-key calendar-mode-map "\C-x<" 'scroll-calendar-right)))

;; muse-mode on *.txt files, if a #title or sect. header is on top 4 lines
(add-hook 'text-mode-hook
          (lambda ()
            (unless (or (eq major-mode 'muse-mode)
			(not (stringp buffer-file-truename)))
              (when (equal (file-name-extension buffer-file-truename) "txt")
                (save-excursion
                  (forward-line 5)
                  (if (re-search-backward "\* [A-Z][a-z]+.*\\|#title " 1 t)
                      (muse-mode)))))))
(global-set-key
 (kbd "M-8")
 (lambda ()
   (interactive)
  (save-some-buffers t)))

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20140803.2118")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140803.2118/dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(add-to-list 'load-path "~/.emacs.d/elpa/fill-column-indicator-20140509.1101")
(require 'fill-column-indicator)
(define-globalized-minor-mode
global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

 ;(require 'scratch-ext)
;(global-set-key (kbd "C-c i") 'scratch-ext-insert-newest-log)
; (global-set-key (kbd "C-c r") 'scratch-ext-restore-last-scratch)

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
;;(require 'cl)

;; initialization
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ;; ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ))
(setq package-enable-at-startup nil)
(package-initialize)

;; check if the required packages are installed; suggest installing if not
(map-y-or-n-p
 "Package %s is missing. Install? "
 '(lambda (package)
    ;; for some reason, package-install doesn't work well if you
    ;; won't call package-refresh-contents beforehand
    (unless (boundp '--package-contents-refreshed-on-init)
      (package-refresh-contents)
      (setq --package-contents-refreshed-on-init 1))
    (package-install package))
 (cl-remove-if 'package-installed-p
               '(
                 android-mode
                 dired-details
                 dummyparens
                 expand-region
                 howdoi
                 smex
                 markdown-mode
                 paredit
				 org2blog
                 tabbar
				 tabbar-ruler
		         auto-complete
                 autopair
                 htmlize
                 ))
 '("package" "packages" "install"))

;; (eval-after-load "org-toc-autoloads"
;;   '(progn
;;      (if (require 'org-toc nil t)
;;          (add-hook 'org-mode-hook 'org-toc-enable)
;;        (warn "org-toc not found"))))

(eval-after-load "dummyparens-autoloads"
  '(progn
     (if (require 'dummyparens nil t)
         (global-dummyparens-mode)
       (warn "dummyparens not found"))))

(eval-after-load "howdoi-autoloads"
  '(progn
     (if (require 'howdoi nil t)
         (progn
           (global-set-key (kbd "M-?") 'howdoi-query-line-at-point-replace-by-code-snippet))
       (warn "howdoi not found"))))

(eval-after-load "smex-autoloads"
  '(progn
     (if (require 'smex nil t)
         (progn
           (smex-initialize)
           (global-set-key (kbd "M-x") 'smex))
       (warn "smex not found"))))

(eval-after-load "markdown-mode-autoloads"
  '(progn
     (if (require 'markdown-mode nil t)
         (progn
           (setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

           (add-hook 'markdown-mode-hook
                     '(lambda ()
                        (define-key markdown-mode-map (kbd "M-p")
                          nil)
                        (define-key markdown-mode-map (kbd "M-n")
                          nil)
                        (define-key markdown-mode-map (kbd "\C-c\C-c")
                          nil)
                        (define-key markdown-mode-map (kbd "\C-c\C-e")
                          'markdown-export))))
       (warn "markdown-mode not found"))))

;; expand-region
(eval-after-load "expand-region-autoloads"
  '(progn
     (when (require 'expand-region nil t)
       (add-hook 'text-mode-hook
                 '(lambda ()
                    (setq-local er/try-expand-list
                          (remove 'er/mark-method-call er/try-expand-list))))

       (global-set-key (kbd "C-=") 'er/expand-region))))

;; paredit
(eval-after-load "paredit-autoloads"
  '(progn
     (when (require 'paredit nil t)
       (global-set-key (kbd "C-S-h") 'paredit-splice-sexp))))


;; (require 'package)
;; (add-to-list 'package-archives '("marmalade"."http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives '("melpa"."http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives '("GNU"."http://elpa.gnu.org/packages/") t)
;; (add-to-list 'package-archives '("sc"."http://joseito.republika.pl/sunrise-commander/") 0)
;; (add-to-list 'package-archives '("org"."http://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives '("tromey"."http://tromey.com/elpa/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
;; ;; (add-to-list 'package-archives '("kitchingroup" . "http://github.com/jkitchin/elpa/") t)
;; (package-initialize)

;; (defvar sharon/packages '(auto-complete
;;                           autopair
;;                           htmlize
;;                           markdown-mode
;;                           ;; org-plus-contrib
;;                           org2blog
;;                           paredit
;;                           tabbar
;; 						  tabbar-ruler)
;;   "Default packages")

;; (defun sharon/packages-installed-p ()
;;   (loop for pkg in sharon/packages
;;         when (not (package-installed-p pkg)) do (return nil)
;;         finally (return t)))

;; (unless (sharon/packages-installed-p)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (dolist (pkg sharon/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg)))
  ;; )

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
;; (desktop-save-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq tab-width 2
      indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

;;(require 'ob)
;;(org-babel-do-load-languages
;; 'org-babel-load-languages
;; '((sh . t)))
;;(add-to-list 'org-babel-tangle-lang-exts '("clojure" . "clj"))
;;(defvar org-babel-default-header-args:clojure
;;  '((:results . "silent") (:tangle . "yes")))
;;(defun org-babel-execute:clojure (body params)
;;  (lisp-eval-string body)
;;  "Done!")
;;(provide 'ob-clojure)
;;(setq org-confirm-babel-evaluate nil)

(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)
(setq column-number-mode t)

(require 'autopair)

(require 'auto-complete-config)
(ac-config-default)

;; (defun untabify-buffer ()
;;   (interactive)
;;   (untabify (point-min) (point-max)))

;; (defun indent-buffer ()
;;   (interactive)
;;   (indent-region (point-min) (point-max)))

;; (defun cleanup-buffer ()
;;   "Perform a bunch of operations on the whitespace content of a buffer."
;;   (interactive)
;;   (indent-buffer)
;;   (untabify-buffer)
;;   (delete-trailing-whitespace))

;;(defun cleanup-region (beg end)
;;  "Remove tmux artifacts from region."
;;  (interactive "r")
;;  (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
;;    (replace-regexp re "" nil beg end)))

;; (global-set-key (kbd "C-x M-t") 'cleanup-region)
;; (global-set-key (kbd "C-c n") 'cleanup-buffer)

;; (setq flyspell-issue-welcome-flag nil)
;; (setq-default ispell-program-name "/usr/bin/aspell")
;; (setq-default ispell-list-command "list")

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook (lambda () (visual-line-mode t)))
(setq markdown-command "pandoc --smart -f markdown -t html")
(setq markdown-css-path (expand-file-name "markdown.css" ))

;; Add external projects to load path
;;(dolist (project (directory-files site-lisp-dir t "\\w+"))
;;  (when (file-directory-p project)
;;    (add-to-list 'load-path project)))

(add-hook 'ido-setup-hook
(lambda ()
;; Go straight to home
(define-key ido-file-completion-map
(kbd "~")
(lambda ()
(interactive)
(if (looking-back "~/")
(insert ".emacs.d/")
(if (looking-back "/")
(insert "~/")
(call-interactively 'self-insert-command)))))))

(setq org-src-fontify-natively t)

(require 'tabbar)
 (require 'tabbar-ruler)
 ;; (setq tabbar-ruler-global-ruler t)
(setq tabbar-background-color "#959A79") ;; the color of the tabbar background
;; (global-set-key (kbd "C-S-p") 'tabbar-backward-group)
;; (global-set-key (kbd "C-S-n") 'tabbar-forward-group)
;; (global-set-key (kbd "C-<") 'tabbar-backward)
;; (global-set-key (kbd "C->") 'tabbar-forward) ;; tabbar.el, put all the buffers on the tabs.
;; (defun tabbar-buffer-groups-by-dir ()
;;         "Put all files in the same directory into the same tab bar"
;;         (with-current-buffer (current-buffer)
;;           (let ((dir (expand-file-name default-directory)))
;;             (cond ;; assign group name until one clause succeeds, so the order is important
;;              ((eq major-mode 'dired-mode)
;;               (list "Dired"))
;;              ((memq major-mode
;;                     '(help-mode apropos-mode Info-mode Man-mode))
;;               (list "Help"))
;;              ((string-match-p "\*.*\*" (buffer-name))
;;               (list "Misc"))
;;              (t (list dir))))))

;; (defun tabbar-switch-grouping-method (&optional arg)
;;   "Changes grouping method of tabbar to grouping by dir.
;; With a prefix arg, changes to grouping by major mode."
;;   (interactive "P")
;;   (ignore-errors
;;     (if arg
;;       (setq tabbar-buffer-groups-function 'tabbar-buffer-groups) ;; the default setting
;;         (setq tabbar-buffer-groups-function 'tabbar-buffer-groups-by-dir))))
;; (setq tabbar-cycle-scope (quote tabs))
;; (setq table-time-before-update 0.1)
(setq tabbar-use-images t)
 ;; (setq tabbar-ruler-global-ruler t)

(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)
(setq org-outline-path-complete-in-steps nil)

 '(org-agenda-files (quote ("~/.emacs.d/org/organiser.org")))
 '(recentf-max-menu-items 20)
 '(safe-local-variable-values (quote ((todo-categories "Todo"))))
 '(size-indication-mode t)
 ;; '(text-mode-hook
 ;;   (quote
 ;; 	(turn-on-auto-fill flyspell-mode text-mode-hook-identify)))

   ;; (eval-after-load "auto-complete"
   ;;   '(progn
   ;;       (ac-ispell-setup)))

   ;; (defun my/enable-ac-ispell ()
   ;;   (add-to-list 'ac-sources 'ac-source-ispell))

   ;; (add-hook 'git-commit-mode-hook 'my/enable-ac-ispell)
   ;; (add-hook 'mail-mode-hook 'my/enable-ac-ispell)

;;  : (require 'epic)
;;  : (define-key global-map [(control ?:)] 'epic-anything)
;;  : (define-key mew-summary-mode-map "r" 'epic-mew-create-note)
;;  : (define-key mew-summary-mode-map "e" 'epic-mew-forward-to-evernote)
;;  : (setq epic-evernote-mail-address "??????@???.evernote.com")

       ;; These tell emacs to associate certain filename extensions with
       ;; certain modes.  I use cc-mode.el (c++-mode) for C as well as C++
       ;; code.  It is fairly all-encompassing, also working with other C-like
       ;; languages, such as Objective C and Java.
       (setq auto-mode-alist (cons '("\\.text$" . text-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.txt$" . text-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.doc$" . text-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.awk$" . awk-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.perl$" . perl-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.plx$" . perl-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.pl$" . perl-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.C$" . c++-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.cc$" . c++-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.c$" . c++-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.cpp$" . c++-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.cxx$" . c++-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.tcl$" . tcl-mode) auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.sh$" . shell-script-mode)
                                   auto-mode-alist))
       (setq auto-mode-alist (cons '("\\.zsh$" . shell-script-mode)
                                  auto-mode-alist))
       (setq completion-ignored-extensions;; Filename completion ignores these.
      (append completion-ignored-extensions
                     '(".CKP" ".u" ".press" ".imp" ".BAK")))
;show more info in taskbar/icon than just "Emacs"
(setq-default frame-title-format (list "%65b %f"))
(setq-default icon-title-format (list "%b"))

;; don't automatically add new lines when scrolling down at the bottom
;; of a buffer
(setq next-line-add-newlines nil)
;insert date into buffer
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%a %b %e, %Y %l:%M %p")))
(setq auto-save-timeout 100)
(setq require-final-newline t)
(setq search-highlight t)
(setq compilation-window-height 12)
(setq compilation-ask-about-save nil)

;;;;;;;;;;
;;; AUCTeX

;; (when (file-directory-p "/usr/share/emacs/site-lisp/auctex/")
;;   (load-file "/usr/share/emacs/21.4/site-lisp/tex-site.el")
;;   (add-to-list 'load-path "/usr/share/emacs/site-lisp/auctex/"))

;; (autoload 'LaTeX-mode "tex-site" "AucTeX mode." t)

(add-to-list 'auto-mode-alist '("\\.\\(la\\)?tex$" . LaTeX-mode))

(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode 1)))
(add-hook 'find-file-hook 'fc-insert-latex-skeleton)

(setq TeX-parse-self t
      TeX-quote-after-quote nil
      LaTeX-babel-hyphen nil)

;;; Rubber configuration
;; (eval-after-load "tex"
;;   '(progn
;;      (setq TeX-command-list (cons '("Rubber" "rubber %(PDFd) \"%t\"" TeX-run-command nil
;;                                     (latex-mode)
;;                                     :help "Run rubber")
;;                                   TeX-command-list)
;;            TeX-expand-list (cons '("%(PDFd)"
;;                                    (lambda ()
;;                                      (if TeX-PDF-mode
;;                                          "-d"
;;                                        "")))
;;                                  TeX-expand-list))
;;      (TeX-global-PDF-mode 1)))

;;; Helper functions
(defun fc-insert-latex-skeleton ()
  "Insert a LaTeX skeleton in an empty file."
  (when (and (eq major-mode 'latex-mode)
             (= (point-min)
                (point-max)))
    (insert "\\documentclass[a4paper,12pt]{scrartcl}\n"
            ;; "\\usepackage{ngerman}\n"
            "\\usepackage[utf8]{inputenc}\n"
            "%\\usepackage{url}\n"
            "%\\usepackage{natbib}\n"
            "%\\usepackage{setspace}\n"
            "%\\usepackage{qtree}\n"
            "%\\usepackage{booktabs}\n"
            "\n"
            "\\title{}\n"
            "\\date{\\today}\n"
            "\\author{}\n"
            "\n"
            "\\begin{document}\n"
            "\\maketitle\n"
            "\n"
            "\n"
            "\\end{document}\n")
    (forward-line -2)))

;;; type-break-mode
;; Remind me to take typing breaks
;; (setq type-break-mode-line-message-mode t
;;      type-break-demo-functions '(type-break-demo-boring)
;;      type-break-time-warning-intervals '()
;;     ;; No type break file
;;      type-break-file-name nil)
;; (type-break-mode)



;;* Prerequisites

;; (message "* --[ Loading my Emacs init file ]--")

;; uptimes
(setq emacs-load-start-time (current-time))


;;(setq evernote-ruby-command "/usr/bin/ruby")
;;(require 'evernote-mode)
;;     (setq evernote-username "boudiccas") ; optional: you can use this username as default.
;;(setq-local `developer_token' "S=s1:U=8d832:E=14a783f8ffb:C=143208e63fd:P=1cd:A=en-devtoken:V=2:H=778392c0a72bec96d7c035b7fc0c8d9c")

;;; Set up the NoteStore client
;;client = EvernoteClient(token=developer_token)
;;note_store = client.get_note_store()

;;; Make API calls
;;notebooks = note_store.listNotebooks()
;;for notebook in notebooks:
;;    print "Notebook: ", `notebook.name'
;;     (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; option
;;(global-set-key "\C-c ec" 'evernote-create-note)
;;(global-set-key "\C-c eo" 'evernote-open-note)
;;(global-set-key "\C-c es" 'evernote-search-notes)
;;(global-set-key "\C-c eS" 'evernote-do-saved-search)
;;(global-set-key "\C-c ew" 'evernote-write-note)
;;(global-set-key "\C-c ep" 'evernote-post-region)
;;(global-set-key "\C-c eb" 'evernote-browser)
;;(global-set-key "\C-c e" 'evernote-login)

;; open files with appropriate mode according to its extension.
(setq auto-mode-alist
      (append '(("\\.pl$" . perl-mode)
		("\\.prolog$" . c++-mode)
		("\\.make$" . makefile-mode)
		("\\makefile$" . makefile-mode)
		("\\CONFIG$" . makefile-mode)
		("\\.m$"  . matlab-mode)
  		("cshrc" . shell-script-mode)
		("emacs" . emacs-lisp-mode)
		("\\.csh$" . shell-script-mode)
		("\\.tar$" . tar-mode)
		("\\.java$" . c++-mode)
		("\\.c$"  . c-mode)
		("\\.C$"  . c-mode)
		("\\.cc$" . c++-mode)
		("\\.cpp$" . c++-mode)
		("\\.cxx$" . c++-mode)
		("\\.CC$"  . c++-mode)
		("\\.h$"  . c-mode)
		("\\.H$"  . c-mode)
		("\\.hpp$" . c++-mode)
		("\\.hxx$" . c++-mode)
		("\\.hh$" . c++-mode))
	      auto-mode-alist))

    ;; Optionally assign a key. Pick your own.
;; (global-set-key (kbd "C-c +") 'org-index)

;; Show the time on the status bar.
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)
(setq org-log-done 'time)

;; ===== Automatically load abbreviations table =====
;; Note that emacs chooses, by default, the filename
;; "~/.abbrev_defs", so don't try to be too clever
;; by changing its name
(setq-default abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)

;; ===== Turn on Auto Fill mode automatically in all modes =====
;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.
;; This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.
(setq auto-fill-mode 1)

;; ===== Make Text mode the default mode for new buffers =====
(setq major-mode 'text-mode);; ===== Make Text mode the default mode for new buffers =====
(setq major-mode 'text-mode)

(visual-line-mode t)
(require 'org-secretary)

;; Keep region when undoing in region
(defadvice undo-tree-undo (around keep-region activate)
  (if (use-region-p)
      (let ((m (set-marker (make-marker) (mark)))
            (p (set-marker (make-marker) (point))))
        ad-do-it
        (goto-char p)
        (set-mark m)
        (set-marker p nil)
        (set-marker m nil))
    ad-do-it))


(global-flycheck-mode 1)

;; ;;(desktop-save-mode)
;; (desktop-read)

;;; modeline - based on https://github.com/toddkfisher/.emacs.d/blob/master/init.el
(setq-default mode-line-format
			  (list
		   " "
		   mode-line-buffer-identification
		   " | "
		   "dir: "
		  '(:eval (file-name-nondirectory (directory-file-name default-directory)))
		   " | "
		   ;; '%02' to set to 2 chars at least; prevents flickering
		   "%04l"
		   ","
		   "%02c"
		   " | "
		   '(:eval (propertize (format-time-string "%H:%M")))
		   " | "
		   '(:eval (emacs-uptime "%hh"))
  		   " | "
		   '(:eval (if (buffer-modified-p) "M" "-"))
		   '(:eval (if buffer-read-only    "R" "-"))
		   '(:eval (if (window-dedicated-p (selected-window)) "D" "-"))
		   " | "
		  '(:eval (propertize "%p" ))   ;; % above top
		   "/"
  		  '(:eval (propertize "%I" ))  ;; size
		  " | "
		    mode-line-mule-info
			" | "
		 mode-line-modes
		 " | "
		 	 ))

;;; colors taken from 'afternoon-theme.el'
(add-hook 'after-change-major-mode-hook 'my-set-mode-line-colors)
(defvar my-mode-line-colors
  '((emacs-lisp-mode :foreground "Ivory" :background "DarkOrange2")
    (shell-script-mode :foreground "Ivory" :background "DarkOliveGreen")
	   (org-mode :foreground "black" :background "gray55")))

(defun my-set-mode-line-colors ()
  (face-remap-add-relative
   'mode-line (list (or (cdr (assq major-mode my-mode-line-colors))
                        '(:foreground "black" :background "white"))
                    'mode-line)))

;;; If 1st line begins with #!, make the file executable when saving
;;; Glenn Morris <rgm22 at cam.ac.uk> Sun Jul 07 11:11:51 2002
(if (fboundp 'executable-make-buffer-file-executable-if-script-p)
    (add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p))

;;; in an empty file, when shell-script-mode is enabled, add the #! line
;;; retroj on #emacs Sun Dec 13 12:14:52 2009
(add-hook 'sh-mode-hook (lambda () (if (eq
         (buffer-size) 0) (executable-set-magic "bash"))))

;; These tell emacs to associate certain filename extensions with
;; certain modes.  I use cc-mode.el (c++-mode) for C as well as C++
;; code.  It is fairly all-encompassing, also working with other C-like
;; languages, such as Objective C and Java.
 (setq auto-mode-alist (cons '("\\.text$" . text-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.txt$" . text-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.doc$" . text-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.awk$" . awk-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.perl$" . perl-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.plx$" . perl-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.pl$" . perl-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.C$" . c++-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.cc$" . c++-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.c$" . c++-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.cpp$" . c++-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.cxx$" . c++-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.tcl$" . tcl-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.org$" . org-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.muse$" . muse-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.tex$" . latex-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.glos$" . latex-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.bib$" . bibtex-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.mdwn$" . markdown-mode) auto-mode-alist))
 (setq auto-mode-alist (cons '("\\.sh$" . shell-script-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.zsh$" . shell-script-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.el$" . emacs-lisp-mode) auto-mode-alist))
 (setq completion-ignored-extensions;; Filename completion ignores these.
 (append completion-ignored-extensions
                '(".CKP" ".u" ".press" ".imp" ".BAK")))

;; open files with appropriate mode according to its extension.
(setq auto-mode-alist
      (append '(("\\.pl$" . perl-mode)
		("\\.prolog$" . c++-mode)
		("\\.make$" . makefile-mode)
		("\\makefile$" . makefile-mode)
		("\\CONFIG$" . makefile-mode)
		("\\.m$"  . matlab-mode)
  		("cshrc" . shell-script-mode)
		("emacs" . emacs-lisp-mode)
		("\\.csh$" . shell-script-mode)
		("\\.tar$" . tar-mode)
		("\\.java$" . c++-mode)
		("\\.c$"  . c-mode)
		("\\.C$"  . c-mode)
		("\\.cc$" . c++-mode)
		("\\.cpp$" . c++-mode)
		("\\.cxx$" . c++-mode)
		("\\.CC$"  . c++-mode)
		("\\.h$"  . c-mode)
		("\\.H$"  . c-mode)
		("\\.hpp$" . c++-mode)
		("\\.hxx$" . c++-mode)
		("\\.hh$" . c++-mode))
			  auto-mode-alist))

(defun disable-all-themes ()
  "Disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(setq boxquote-top-and-tail "────"
      boxquote-top-corner "╭"
      boxquote-bottom-corner "╰"
      boxquote-side "│"
)

;;; http://stackoverflow.com/questions/4477376/some-emacs-desktop-save-questions-how-to-change-it-to-save-in-emacs-d-emacs
;; ;; Automatically save and restore sessions
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil)
(desktop-save-mode 1)

(defun my-desktop ()
  "Load the desktop and enable autosaving"
  (interactive)
  (let ((desktop-load-locked-desktop "ask"))
    (desktop-read)
    (desktop-save-mode t)))

(add-hook 'auto-save-hook (lambda () (desktop-save-in-desktop-dir)))

;; ;; remove desktop after it's been read
;; (add-hook 'desktop-after-read-hook
;; 	  '(lambda ()
;; 	     ;; desktop-remove clears desktop-dirname
;; 	     (setq desktop-dirname-tmp desktop-dirname)
;; 	     (desktop-remove)
;; 	     (setq desktop-dirname desktop-dirname-tmp)))

(defun saved-session ()
  (file-exists-p (concat desktop-dirname "/" desktop-base-file-name)))

;; use session-restore to restore the desktop manually
(defun session-restore ()
  "Restore a saved emacs session."
  (interactive)
  (if (saved-session)
      (desktop-read)
    (message "No desktop found.")))

;; use session-save to save the desktop manually
(defun session-save ()
  "Save an emacs session."
  (interactive)
  (if (saved-session)
      (if (y-or-n-p "Overwrite existing desktop? ")
	  (desktop-save-in-desktop-dir)
	(message "Session not saved."))
  (desktop-save-in-desktop-dir)))

;; ask user whether to restore desktop at start-up
(add-hook 'after-init-hook
	  '(lambda ()
	     (if (saved-session)
		 (if (y-or-n-p "Restore desktop? ")
		     (session-restore)))))

;; (setq echo-keystrokes 0.1
;;        visible-bell t)
(show-paren-mode t)
(load custom-file)

(message "Hello, world!")
;; (server-start)

(require 'setup-keys)
(require 'setup-themes)
(require 'setup-orgmode)
(require 'setup-testbed)
(require 'setup-test3)
(require 'setup-muse)
(require 'setup-org2blog)
;; (require 'setup-yasnippet)
;; (require 'setup-w3m)
;; (require 'org-remode)
;; (require 'setup-ess)
;; (require 'setup-file-management)
;; (require 'setup-ibuffer)
;; (require 'setup-latex)
(require 'setup-markdown)
;; (require 'setup-outline)
;; (require 'setup-ruby)
;; (require 'setup-useful-functions)
;; (require 'setup-yaml)
;; (require 'setup-git)
;; (require 'dto-org-gtd)
;; (require 'org-index)
(require 'flycheck)
(require 'org-checklist)
(require 'org-expiry)

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message " Face: %s" face)
      (message " No face at %d." pos) )))



(provide 'init.el)
;;; init.el ends here
