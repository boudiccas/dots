;;mine from 27-09-13

;; -*- emacs-lisp -*-
(custom-set-faces
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-menu-sort-alphabetically t)
 '(display-time-mode t)
 '(global-smart-tab-mode t)
 '(org-agenda-files nil)
 '(safe-local-variable-values (quote ((todo-categories "Todo"))))
 '(show-paren-mode t))

;; ========= Set colours ==========

;; Set cursor and mouse-pointer colours
(set-cursor-color "red")
(set-mouse-color "goldenrod")

;; Set region background colour
(set-face-background 'region "blue")

;; Set emacs background colour
(set-background-color "black")

(add-hook 'slime-mode-hook 'rainbow-delimiters-mode)
;;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(defun turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1)
  )
;; on-the-fly spelling checking
    (autoload 'flyspell-mode "flyspell" "On-the-fly spelling checking" t)
  
(global-set-key "\C-x\C-m" 'execute-extended-command) ; Enable `M-x' with Ctrl Key
(global-set-key "\C-c\C-m" 'execute-extended-command) ; 

(setq default-frame-alist '((width . 100) (height . 30) (menu-bar-lines . 1)))
  : (setq load-path (cons "~/.emacs.d/org2blog/" load-path))
  : (require 'org2blog-autoloads)

(require 'ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d")
(let ((default-directory "~/.emacs.d/"))
(normal-top-level-add-subdirs-to-load-path))
;(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'sunrise-commander)
(require 'sunrise-x-buttons)
;(require 'sunrise‐x‐modeline)
(require 'lusty-explorer)
(require 'smart-tab)
(global-smart-tab-mode 1)
;; (require 'main-line)
;(server-start)
(add-to-list 'load-path "~/.emacs.d/elpa/svg-clock-0.5/svg-clock.el")
(autoload 'svg-clock "svg-clock" "Start/stop svg-clock" t)
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(require 'org-secretary)

(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
;; Always update time stamps on writing
(add-hook 'before-save-hook 'time-stamp)
;;(require 'rst.el)	#re-structured text
 (require 'desktop)
  (desktop-save-mode 1)
  (defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
  (add-hook 'auto-save-hook 'my-desktop-save)

(defun org/deadline (remove)
  "like `org-deadline', except ask only once."
  (interactive "P")
  (unless remove (with-temp-buffer (org-time-stamp nil)))
  (org-deadline remove org-last-inserted-timestamp))


(global-set-key [remap org-deadline] 'org/deadline)

;; On a windowing system, set colors
(when window-system
(set-cursor-color "red")
(set-foreground-color "white")
(set-background-color "black"))

(add-hook 'text-mode-hook 'turn-spell-checking-on)
(ido-mode 1)
(setq ido-enable-flex-matching t)
 (setq inhibit-startup-message t
  inhibit-startup-echo-area-message t) 
 (define-key global-map (kbd "RET") 'newline-and-indent)
(setq default-major-mode 'text-mode)
(set-border-color "lightblue")
(set-border-color "blue")
(set-cursor-color "red")
;;(set-foreground-color "black")
(set-mouse-color "red")
;(set-face-background 'modeline "red")
;      (set-face-foreground 'modeline "yellow")
(load "time" t t)
(display-time)
(setq org-startup-indented t)

; ===== Make Text mode the default mode for new buffers =====

(setq default-major-mode 'text-mode)

;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; ===== Set the highlight current line minor mode ===== 

;; In every buffer, the line which contains the cursor will be fully
;; highlighted

(global-hl-line-mode 1)

;; ===== Turn on Auto Fill mode automatically in all modes =====

;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.

;; This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.

(setq auto-fill-mode 1)

;; ========== Set the fill column ==========

;; Enable backup files.
(setq-default fill-column 78)

;; Fix foolish calendar-mode scrolling.
(add-hook 'calendar-load-hook
 '(lambda ()
 (setq mark-holidays-in-calendar t)
 (define-key calendar-mode-map ">" 'scroll-calendar-left)
 (define-key calendar-mode-map "<" 'scroll-calendar-right)
 (define-key calendar-mode-map "\C-x>" 'scroll-calendar-left)
 (define-key calendar-mode-map "\C-x<" 'scroll-calendar-right)))
 
;;; Backup files
;; Put them in one nice place if possible
(if (file-directory-p "~/.emacs.d/backups")
    (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
  (message "Directory does not exist: ~/.emacs.d/backups"))
 
(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 3    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too
(global-font-lock-mode t)

;; Set Linum-Mode on
(global-linum-mode t)
 
;; Linum-Mode and add space after the number
(setq linum-format "%d ")
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/.abbrev_defs")
(setq save-abbrevs t)
(setq auto-save-interval 800)

(add-hook 'org-mode-hook 'turn-on-font-lock)

;;; Org Mode
(add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)
(require 'org-gtd)
(require 'org-agenda)
;;(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(custom-set-variables
 '(org-agenda-files (quote ("~/todo.org")))
 '(org-default-notes-file "~/notes.org")
 '(org-agenda-ndays 7)
 '(org-deadline-warning-days 14)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-reverse-note-order t))

(add-to-list 'load-path "~/emacs/org")
;;(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;(define-key global-map "\C-cl" 'org-store-link)
;;(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files 
      (list "~/.emacs.d/org/gtd.org" "~/.emacs.d/org/work.org" "~/.emacs.d/org/personal.org" "~/.emacs.d/org/organiser.org" "~/.emacs.d/org/home.org" "~/.emacs.d/org/website.org" "~/.emacs.d/org/appointments.org"))
; I prefer return to activate a link
(setq org-return-follows-link t)
 
(setq org-agenda-custom-commands 
    '(("w" todo "WAITING" nil) 
     ("c" todo "DONE|DEFERRED|CANCELLED" nil)
    ("n" todo "NEXT" nil)
    ("t" todo "TODO" nil)
    ("s" todo "SCHEDULED" nil)
    ("21" agenda "" ((org-agenda-ndays 21)))
    ("d" "Agenda + Next Actions" ((agenda) (todo "TODO") (todo "NEXT") (todo "SCHEDULED") (todo "WAITING")))))
)

(add-to-list 'org-modules 'org-habit)
(require 'org-habit)
(add-hook 'after-init-hook 'org-agenda-list)
 
(defun gtd ()
   (interactive)
   (find-file "~/org/gtd.org")
)
;; -*- mode: elisp -*-
;; Enable transient mark mode
;;(transient-mark-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

(setq inhibit-splash-screen t)
(org-agenda-list)
(delete-other-windows)

;;
;; Standard key bindings
;;(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-ci" 'org-agenda-list)

(global-set-key "\C-cf" 'load-file)
;;(global-set-key (kbd "C-c C-f") 'load-file)
(global-set-key "\C-ce" 'load-file .emacs)

 ;;(global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-cc" 'org-capture)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cb" 'org-iswitchb)

(setq scroll-step 1)
;; When you scroll down with the cursor, emacs will move down the buffer one 
;; line at a time, instead of in larger amounts.

(fset 'yes-or-no-p 'y-or-n-p)
;; Makes things a little bit more consistent.

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

       ;; Here are some keyboard shortcuts that are handy.  They're pretty 
       ;; easy to define.  The last thing is the same as you'd type using 
       ;; M-x (presumably).  It's probably a good idea to use global-unset-key
       ;; before defining it to something else, just in case.  You can see a 
       ;; list of all the keyboard bindings with M-x describe-bindings.

       (global-unset-key "\M-n")
       (global-set-key "\M-n" 'gnus)
       (global-unset-key "\C-j")
       (global-set-key "\C-j" 'goto-line)
       (global-unset-key "\M-o")
       (global-set-key "\M-o" 'other-window)
       (global-unset-key "\M-m")
       (global-set-key "\M-m" 'buffer-menu)
       (global-unset-key "\M-p")
       (global-set-key "\M-p" 'split-window)

       ;; These two below set M-Backspace
       (global-unset-key "\M-\C-?")
       (global-set-key "\M-\C-?" 'kill-buffer)
       ;; (global-unset-key "\M-\C-f")
       ;; (global-set-key "\M-\C-f" 'font-lock-mode)
       
       ;; Here are some color preferences.  I've spent a good deal of time
       ;; adjusting color settings, trying to get it to look good and also be
       ;; fairly easy to read. 
       (setq default-frame-alist 
             (append default-frame-alist 
                     ;;'((foreground-color . "yellow")
              '((foreground-color . "green")
                       ;; '((foreground-color . "wheat")
                (background-color . "black")
                       ;; (cursor-color . "green3"))))
                (cursor-color . "red"))))
       
       (set-face-foreground 'bold "yellow")
       (set-face-background 'bold "grey40")
       
       (set-face-foreground 'bold-italic "yellow green")
       (set-face-foreground 'italic "yellow3")
       
       (set-face-foreground 'region "white")
       (set-face-background 'region "blue")

;show paren, brace, and curly brace "partners" at all times
(show-paren-mode t)

;show more info in taskbar/icon than just "Emacs"
(setq-default frame-title-format (list "%65b %f"))
(setq-default icon-title-format (list "%b"))

; don't automatically add new lines when scrolling down at the bottom
; of a buffer 
(setq next-line-add-newlines nil)

;be able to do Ctrl-X, u/l  to upper/lowercase regions without confirm
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;show ascii table
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

;insert date into buffer
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%a %b %e, %Y %l:%M %p")))
  
;;the following snippet was copied from the Oreilly-published  book 
;;"Writing GNU Emacs Extensions" by Bob Glickstein.
(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)
(defun scroll-n-lines-ahead (&optional n)
  "Scroll ahead N lines (1 by default)."
  (interactive "P")
  (progn
    (scroll-ahead (prefix-numeric-value n))
    (next-line 1)))

(defun scroll-n-lines-behind (&optional n)
  "Scroll behind N lines (1 by default)."
  (interactive "P")
  (progn
    (scroll-behind (prefix-numeric-value n))
    (previous-line 1)))


  ;switch/case:  make each case line indent from switch
  (c-set-offset 'case-label '+)

  ;make the ENTER key indent next line properly
  (local-set-key "\C-m" 'newline-and-indent)

  ;syntax-highlight aggressively
  (setq font-lock-support-mode 'lazy-lock-mode)
  (setq lazy-lock-defer-contextually t)
  (setq lazy-lock-defer-time 0)

  ;make DEL take all previous whitespace with it
  (c-toggle-hungry-state 1)

  ;make open-braces after a case: statement indent to 0 (default was '+)
  (c-set-offset 'statement-case-open 0)

  ;make a #define be left-aligned 
  (setq c-electric-pound-behavior (quote (alignleft)))

  ;do not impose restriction that all lines not top-level be indented at least
  ;1 (was imposed by gnu style by default)
  (setq c-label-minimum-indentation 0)
)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)

; make goto-line easier to do
(global-set-key [?\M-\C-g] 'goto-line)

;; (setq have-ispell-3.1 t)
;;(setq have-cua-mode t)
;;(setq have-gnuserv t)
;;(setq have-ghostview t)
;;(load-file "~/jasonr.emacs")

;; Get rid of old versions of files
;;(setq delete-old-versions t)

;;Set for visual bell
(setq visible-bell t)

;;Line number mode true
(setq line-number-mode t)

;;Make searches case insensitive
(setq case-fold-search t)

(setq auto-save-timeout 1800)
(setq require-final-newline t)
(setq search-highlight t)
(setq compilation-window-height 12)
(setq compilation-ask-about-save nil)

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

;;This enables archive browsing and editing.
(setq auto-mode-alist
      (cons '("\\.\\(arc\\|zip\\|lzh\\|zoo\\)\\'" . archive-mode)
            auto-mode-alist))

;;Require dired files only in dired mode
(defun my-dired-load-stuff ()
  (require 'my-dired)
  (autoload 'tar-mode "tar-mode")
  (require 'dired-tar))

;;Turn on highlighting for Dired (C-x d) and list-buffers (C-b)
;;(require 'linemenu)

(defadvice list-buffers (after highlight-line activate)
  (with-current-buffer
    (set-buffer "*Buffer List*")
;;    (linemenu-initialize)))
(defadvice electric-buffer-menu-looper (after highlight-line activate)
  (linemenu-highlight-current-line))
;;(add-hook 'dired-after-readin-hook 'linemenu-initialize)
;;(add-hook 'electric-buffer-menu-hook 'linemenu-initialize)

;;;;;;;;;;;;;;;;;;;
;;; type-break-mode

;; Remind me to take typing breaks
(setq type-break-mode-line-message-mode t
      type-break-demo-functions '(type-break-demo-boring)
      type-break-time-warning-intervals '()
      ;; No type break file
      type-break-file-name nil)
(type-break-mode)

;;; Startup code
(find-file "~/.emacs.d/org/organiser.org")
(require 'org-compat)
(org-agenda nil "a")

(when (file-exists-p "~/.emacs.d/.notes/Notes")
  (find-file "~/.emacs.d/.notes/Notes")
  (setq default-directory "~/.emacs.d/")
  (require 'calendar)
  (when (require 'org nil t)
    (call-interactively 'org-agenda-list)))
    
(defun  org-publish-files-maybe ()
  "Publish this file if it contains the #+PUBLISH: keyword"
  (save-excursion
   (save-restriction
    (widen)
    (goto-char (point-min))
    (when (re-search-forward 
           "^#?[ \t]*\\+\\(PUBLISH\\)"
           nil t) 
     (org-export-as-html-batch)   
     nil))))

(add-hook 'org-mode-hook
 (lambda ()
  (add-hook (make-local-variable 'after-save-hook)
            ' org-publish-files-maybe)))
 
(global-set-key (kbd "C-c r") 'remember)    ;; (1)
(add-hook 'remember-mode-hook 'org-remember-apply-template) ;; (2)
(setq org-remember-templates  
      '((?n "* %U %?\n\n  %i\n  %a" "~/.emacs.d/org/notes.org")))  ;; (3)
(setq remember-annotation-functions '(org-remember-annotation)) ;; (4)
(setq remember-handler-functions '(org-remember-handler)) ;; (5)
(icomplete-mode 1)

(setq org-todo-keywords
       '((sequence "TODO(t)" "|" "DONE(d)" "CANCELLED(c)")
         (sequence "TASK(f)" "|" "DONE(d)")
         (sequence "MAYBE(m)" "|" "CANCELLED(c)")))

(setq org-todo-keyword-faces
       '(("TODO" . (:foreground "DarkOrange1" :weight bold))
         ("MAYBE" . (:foreground "sea green"))
         ("DONE" . (:foreground "light sea green"))
         ("CANCELLED" . (:foreground "forest green"))
         ("TASK" . (:foreground "blue"))))

 (setq org-agenda-custom-commands
       '(("h" "Work todos" tags-todo
          "-personal-doat={.+}-dowith={.+}/!-TASK"
          ((org-agenda-todo-ignore-scheduled t)))
         ("H" "All work todos" tags-todo "-personal/!-TASK-MAYBE"
          ((org-agenda-todo-ignore-scheduled nil)))
         ("A" "Work todos with doat or dowith" tags-todo
          "-personal+doat={.+}|dowith={.+}/!-TASK"
          ((org-agenda-todo-ignore-scheduled nil)))
         ("j" "TODO dowith and TASK with"
          ((org-sec-with-view "TODO dowith")
           (org-sec-where-view "TODO doat")
           (org-sec-assigned-with-view "TASK with")
           (org-sec-stuck-with-view "STUCK with")))
         ("J" "Interactive TODO dowith and TASK with"
          ((org-sec-who-view "TODO dowith")))))
	  
;;(setq org-todo-keywords
;;((sequence
;;    "TODO"  ; next action
;;    "TOBLOG"  ; next action
;;    "STARTED(s)"
;;    "WAITING(w@/!)"
;;    "POSTPONED(p)" 
;;    "SOMEDAY(s@/!)"
;;    "DONE(x!)" 
;;    "CANCELLED(c@)")
   (sequence "TODELEGATE(-)" "DELEGATED(d)" "COMPLETE(x)")))
(setq org-fontify-done-headline t)
(custom-set-faces
 '(org-done ((t (:foreground "PaleGreen"   
                 :weight normal
                 :strike-through t))))
 '(org-headline-done 
            ((((class color) (min-colors 16) (background dark)) 
               (:foreground "LightSalmon" :strike-through t)))))
	       
(defun jump-to-org-agenda ()
  (interactive)
  (let ((buf (get-buffer "*Org Agenda*"))
        wind)
    (if buf
        (if (setq wind (get-buffer-window buf))
            (select-window wind)
          (if (called-interactively-p)
              (progn
                (select-window (display-buffer buf t t))
                (org-fit-window-to-buffer)
                ;; (org-agenda-redo)
                )
            (with-selected-window (display-buffer buf)
              (org-fit-window-to-buffer)
              ;; (org-agenda-redo)
              )))
      (call-interactively 'org-agenda-list)))
  ;;(let ((buf (get-buffer "*Calendar*")))
  ;;  (unless (get-buffer-window buf)
  ;;    (org-agenda-goto-calendar)))
  )

(run-with-idle-timer 300 t 'jump-to-org-agenda)

(defun  org-summarize-upcoming-week ()
  "Summarize upcoming tasks as a list."
  (interactive)
  (org-agenda nil "w")
  (let ((string (buffer-string))
        business relationships life)
    (with-temp-buffer
      (insert string)
      (goto-char (point-min))
      (while (re-search-forward "^  \\([^:]+\\): +\\(Sched[^:]+: +\\)?TODO \\(.*?\\)\\(?:[      ]+\\(:[[:alnum:]_@#%:]+:\\)\\)?[        ]*$" nil t)
        (cond
         ((string= (match-string 1) "routines") nil) ; skip routine tasks
         ((string= (match-string 1) "business")
          (add-to-list 'business (concat "  - [ ] " (match-string 3))))
         ((string= (match-string 1) "people")
          (add-to-list 'relationships (concat "  - [ ] " (match-string 3))))
         (t (add-to-list 'life (concat "  - [ ] " (match-string 3)))))))
    (setq string
          (concat
      "*Plans for next week*\n"
      "- Business\n"
      (mapconcat 'identity business "\n")
      "\n- Relationships\n"
      (mapconcat 'identity relationships "\n")
      "\n- Life\n"
      (mapconcat 'identity life "\n")))
    (if (called-interactively-p)
        (kill-new string)
      string)))
(defun  org-send-to-bottom-of-list ()
  "Send the current line to the bottom of the list."
  (interactive)
  (beginning-of-line)
  (let ((kill-whole-line t))
    (save-excursion
      (kill-liune 1)
      (org-end-of-item-list)
      (yank))))
(eval-after-load 'org
  '(progn
     (define-key org-mode-map (kbd "C-c k") 'org-cut-subtree)
     (setq org-yank-adjusted-subtrees t)))
(defun org-agenda-list-unscheduled (&rest ignore)
  "Create agenda view for tasks that are unscheduled and not done."
  (let* ((org-agenda-todo-ignore-with-date t)
         (org-agenda-overriding-header "List of unscheduled tasks: "))
    (org-agenda-get-todos)))
(setq org-stuck-projects
      '("+PROJECT-MAYBE-DONE"
        ("TODO")
        nil
        "\\<IGNORE\\>"))
  (defun  org-agenda-mark-done-and-add-followup ()
    "Mark the current TODO as done and add another task after it.
Creates it at the same level as the previous task, so it's better to use
this with to-do items than with projects or headings."
    (interactive)
    (org-agenda-todo "DONE")
    (org-agenda-switch-to)
    (org-capture 0 "t"))
;; Override the key definition
(defun  org-agenda-done (&optional arg)
  "Mark current TODO as done.
This changes the line at point, all other lines in the agenda referring to
the same tree node, and the headline of the tree node in the Org-mode file."
  (interactive "P")
  (org-agenda-todo "DONE"))
;; Override the key definition for org-exit
(define-key org-agenda-mode-map "x" ' org-agenda-done)

(setq org-agenda-span 2)
(setq org-agenda-show-log t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-time-grid
      '((daily today require-timed)
       "----------------"
       (800 1000 1200 1400 1600 1800)))
(setq org-columns-default-format "%50ITEM %12SCHEDULED %TODO %3PRIORITY %Effort{:} %TAGS")
(setq org-agenda-files '("~/.emacs.d/org/organizer.org"
                         "~/.emacs.d/org/people.org"
                         "~/.emacs.d/org/business.org"
                         "~/.emacs.d/org/routines.org"))
 (setq org-tags-exclude-from-inheritance '("PROJECT"))
 (setq org-tag-alist '(("@work" . ?b) 
                      ("@home" . ?h) 
                      ("@writing" . ?w)
                      ("@errands" . ?e) 
                      ("@drawing" . ?d)
                      ("@coding" . ?c)
                      ("@phone" . ?p)
                      ("@reading" . ?r)
                      ("@computer" . ?l)
                      ("quantified" . ?q)))
		      
(setq org-agenda-custom-commands
'(("c" "Weekly schedule" agenda ""
         ((org-agenda-ndays 14)          ;; agenda will start in week view
          (org-agenda-repeating-timestamp-show-all t)   ;; ensures that repeating events appear on all relevant dates
          (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))  
        ;; limits agenda view to timestamped items
        ;; ...other commands here
        ))
(setq org-agenda-custom-commands
      '(("d" "Upcoming deadlines" agenda ""
         ((org-agenda-entry-types '(:deadline))
          ;; a slower way to do the same thing
          ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
          (org-agenda-ndays 1)
          (org-deadline-warning-days 60)
          (org-agenda-time-grid nil)))
        ;; ...other commands here
        ))
(setq org-agenda-custom-commands
      '(("P" "Printed agenda"
         ((agenda "" ((org-agenda-ndays 14)                      ;; overview of appointments
                      (org-agenda-start-on-weekday nil)         ;; calendar begins today
                      (org-agenda-repeating-timestamp-show-all t)
                      (org-agenda-entry-types '(:timestamp :sexp))))
          (agenda "" ((org-agenda-ndays 1)                      ;; daily agenda
                      (org-deadline-warning-days 14)             ;; 7 day advanced warning for deadlines
                      (org-agenda-todo-keyword-format "[ ]")
                      (org-agenda-scheduled-leaders '("" ""))
                      (org-agenda-prefix-format "%t%s")))
          (todo "TODO"                                          ;; todos sorted by context
                ((org-agenda-prefix-format "[ ] %T: ")
                 (org-agenda-sorting-strategy '(tag-up priority-down))
                 (org-agenda-todo-keyword-format "")
                 (org-agenda-overriding-header "\nTasks by Context\n------------------\n"))))
         ((org-agenda-with-colors nil)
          (org-agenda-compact-blocks t)
          (org-agenda-remove-tags t)
          (ps-number-of-columns 2)
           (ps-landscape-mode t))
         ("~/agenda.ps"))
        ;; other commands go here
        ))

