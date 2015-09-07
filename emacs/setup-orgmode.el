;;; Configuration for Org mode (http://orgmode.org/)

;;; Startup code
;; (require 'org)
 '(ac-ispell-requires 4)
 '(org-agenda-dim-blocked-tasks (quote invisible))
 '(org-agenda-files (quote ("~/.emacs.d/org/organiser.org")))
 '(org-agenda-include-all-todo t t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-blank-before-new-entry (quote ((heading . auto) (plain-list-item))))
 '(org-completion-use-iswitchb t)
; '(org-enforce-todo-checkbox-dependencies t)
 '(org-export-allow-BIND t)
;; '(org-export-html-postamble t)
 ;'(org-agenda-skip-deadline-if-done t)
 ;'(org-agenda-skip-scheduled-if-done t)
 ;'(org-blank-before-new-entry (quote ((heading . auto) (plain-list-item))))
 ;'(org-completion-use-iswitchb t)
 '(org-hide-leading-stars 1)
 '(org-log-done t)
 '(org-special-ctrl-a/e t)
 '(org-special-ctrl-k t)
;'(org-startup-folded t)
 '(org-use-property-inheritance t)
 '(recentf-max-menu-items 30)
;'(safe-local-variable-values (quote ((todo-categories "Todo"))))
 '(size-indication-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill flyspell-mode text-mode-hook-identify)))
;;(org-list-send-item (line-beginning-position) 'end (org-list-struct))
(add-hook 'org-mode-hook 'turn-on-flyspell)
(find-file "~/.emacs.d/org/start.org")
(require 'org-compat)
;;(org-agenda nil "a")
(require 'org-toc)

;; keyboard shortcuts
;;(bind-key "C-c x" 'my-ctrl-c-x-command)
(bind-key "C-c r" 'org-capture)
(bind-key "C-c a" 'org-agenda)
(bind-key "C-c l" 'org-store-link)
(bind-key "C-c L" 'org-insert-link-global)
(bind-key "C-c O" 'org-open-at-point-global)
(bind-key "C-TAB" 'org-cycle org-mode-map)
(bind-key "C-c v" 'org-show-todo-tree org-mode-map)
(bind-key "C-c C-r" 'org-refile org-mode-map)
(bind-key "C-c R" 'org-reveal org-mode-map)
;+(bind-key "<f9> a" 'org-agenda-list)
;;(bind-key "[f9][f8]" (lambda () (interactive) (org-capture nil "r")))
;;(eval-after-load 'org
;;  '(progn

(setq org-modules '(org-bbdb
					org-archive
                    org-contacts
                    org-gnus
                    org-drill
                    org-info
                    ;;org-jsinfo
                    org-habit
                  ;;  org-irc
                    org-mouse
                    org-annotate-file
                    org-eval
                    org-expiry
                    org-interactive-query
                    org-man
                    org-panel
                  ;;  org-screen
                    org-toc))

;(run-with-idle-timer 300 t 'jump-to-org-agenda)

(when (file-exists-p "~/.emacs.d/.notes/Notes")
  (find-file "~/.emacs.d/.notes/Notes")
  (setq default-directory "~/.emacs.d/")
  (require 'calendar)
  (when (require 'org nil t)
    (call-interactively 'org-agenda-list)))

(setq org-log-done t)                                

(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("computer" . ?c) ("phone" . ?p) ("reading" . ?r)))
;(org-advertized-archive-subtree t) ;;C-u C-c C-x C-s
(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-agenda-tags-todo-honor-ignore-options t)

(defun org-publish-files-maybe ()
  "Publish this file if it contains the +PUBLISH: keyword"
  (save-excursion
   (save-restriction
    (widen)
    (goto-char (point-min))
    (when (re-search-forward 
           "^?[ \t]*\\+\\(PUBLISH\\)"
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

;;; Org Mode
(add-to-list 'load-path "/home/boudiccas/.emacs.d/org")
(setq org-log-done t)
;(set org-archive-location "/home/boudiccas/.emacs.d/org/archiveorg.org")
(setq org-agenda-files 
      (list "/home/boudiccas/.emacs.d/org/organiser.org" ))
; I prefer return to activate a link
(setq org-return-follows-link t)

(setq org-todo-keyword-faces
      (quote (("TODO" :background "Red" :foreground "white" :weight bold)
              ("NEXT" :background "Red" :foreground "green" :weight bold)
			  ("SCHEDULED" :background "blue" :foreground "white" :weight bold)
			  ("IN-PROGRESS" :foreground "yellow" :weight bold)
              ("PHONE" :background "forest green" :foreground "white" :weight bold)
              ("EMAIL" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "magenta" :weight bold)
              ("DONE" :background "white" :foreground "blue" :weight bold)
			  ("CANCELLED" )
			  ("SOMEDAY" )
			  )))

(setq org-agenda-custom-commands
	  '(("t" todo "TODO" nil)
	  ("n" todo "NEXT" nil)
	  ("s" todo "SCHEDULED" nil)
      ("i" todo "IN-PROGRESS" nil)
	  ("p" todo "PHONE" nil)
	  ("e" todo "EMAIL" nil)
	  ("w" todo "WAITING" nil)
	  ("d" todo "DONE" nil)
	  ("c" todo "CANCELLED" nil)
	  ("o" todo "SOMEDAY" nil)))
  
    ;;(org-advertized-archive-subtree &optional FIND-DONE) ;;C-u C-c C-x C-s
;;(setq org-todo-keyword-faces
;;      '(("INPROGRESS" . (:foreground "blue" :weight bold))))
;;(setq org-agenda-files (list "~/.emacs.d/org/personal.org"))
;; (setq org-agenda-span 21)

(setq org-fontify-done-headline t)
(set-face-attribute 'org-done nil :strike-through t)
(set-face-attribute 'org-headline-done nil :strike-through t)

(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

;; Nice bullets!
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Hit return on a link to open it in a browser
(setq org-return-follows-link t)

;; Shift and arrow keys to select text works a bit differently in org-mode
(setq org-support-shift-select t)

;; Fontify Babel blocks nicely
;;(setq org-src-fontify-natively t)

;; Let's try speed commands.
;; "Single keys can be made to execute commands when the cursor is at the beginning of a headline, i.e., before the first star." 

(setq org-use-speed-commands t)

;; Embed an image with [[file:foo.png]] and then C-c C-x C-v to view
;;(setq org-display-inline-images t)

;; Display images when a file is loaded (I can always toggle them off if I don't want them)
;;(add-hook 'org-mode-hook (lambda () (org-toggle-inline-images)))

;; Use LaTeX spell-check
(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))

;; Preview LaTeX equations in buffers by showing images (C-c C-x C-l)
;; Details: http://orgmode.org/worg/org-tutorials/org-latex-preview.html
(setq org-latex-create-formula-image-program 'imagemagick)

; For org-reveal, which makes presentations using reveal.js
; (require 'org-reveal)

;; Exporting: I will see these export options after C-c C-e
;;(setq org-export-backends (quote (html latex md odt)))

;; I may need to customize org-html-doctype (default is "xhtml-strict")
; (setq org-html-doctype "html5")

;; Turn ' and " into ‘posh’ “quotes”
;;(setq org-export-with-smart-quotes t)

;; Capturing
(setq org-default-notes-file "~/.emacs.d/org/capture.org") ; Change this when I use it for real
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("w" "Work todo" entry (file+headline "~/.emacs.d/org/next-actions.org" "Tasks") "* TODO %?\n %u\n %a")
        ("n" "Note"      entry (file+datetree "~/.emacs.d/org/capture.org") "* %?\nEntered on %U\n  %i\n %a")))
      
;; Active Babel languages
;; See http://orgmode.org/org.html.Languages
;(org-babel-do-load-languages
; 'org-babel-load-languages
; '(
;   (ditaa . t)
;   (dot . t)
;   (latex . t)
;   (lilypond . t)
;   (python . t)
;   (R . t)
;   (ruby . t)
;   (sh . t)
;   (sql . t)
;   (sqlite . t)
;   )
; )

;; Evaluate Babel blocks without asking for confirmation
;(setq org-confirm-babel-evaluate nil)

;; Requires ditaa to be installed
;;(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")

;; Org can read RSS feeds (http://orgmode.org/org.html.RSS-Feeds)
;; "You could use this to make a task out of each new podcast in a
;; podcast feed. Or you could use a phone-based note-creating service
;; on the web to import tasks into Org."
;; I don't have any use for this right now, but perhaps some day.
;;(setq org-feed-alist
;;      '(
;;	("Miskatonic" "http://www.miskatonic.org/feed" "~/org/feeds.org" "Miskatonic")
;;	("Mastering Emacs" "http://www.masteringemacs.org/feed" "~/org/feeds.org" "Mastering Emacs")
;;	))

;; Integrate RefTeX
;; From http://orgmode.org/worg/org-faq.html.using-reftex-in-org-mode
;; Use these lines to generate the bib (Org will recognize them as LaTeX commands):
;; \bibliographystyle{plain}
;; \bibliography{BIB-NAME}

;; With this setup, C-c ) will invoke reftex-citation which will insert a reference in the usual way.

;; (defun org-mode-reftex-setup ()
;;   (load-library "reftex")
;;   (and (buffer-file-name)
;;        (file-exists-p (buffer-file-name))))
;;       ;; (reftex-parse-all))
;; (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
;; (add-hook 'org-mode-hook 'org-mode-reftex-setup)

(defvar count-words-buffer
  nil
  "*Number of words in the buffer.")

;(defun me/update-wc ()
;  (interactive)
;  (setq count-words-buffer (number-to-string (count-words-buffer)))
;  (force-mode-line-update))
  
; only setup timer once
;(unless count-words-buffer
  ;; seed count-words-paragraph
  ;; create timer to keep count-words-paragraph updated
;  (run-with-idle-timer 1 t 'sk/update-wc))

;; add count words paragraph the mode line
;(unless (memq 'count-words-buffer global-mode-string)
;  (add-to-list 'global-mode-string "words: " t)
;  (add-to-list 'global-mode-string 'count-words-buffer t)) 

;; count number of words in current paragraph
;(defun count-words-buffer ()
;  "Count the number of words in the current paragraph."
;  (interactive)
;  (save-excursion
;    (goto-char (point-min))
;    (let ((count 0))
;      (while (not (eobp))
;	(forward-word 1)
;        (setq count (1+ count)))
;      count)))

(defun wicked/org-update-checkbox-count (&optional all)
  "Update the checkbox statistics in the current section.
This will find all statistic cookies like [57%] and [6/12] and update
them with the current numbers.  With optional prefix argument ALL,
do this for the whole buffer."
  (interactive "P")
  (save-excursion
    (let* ((buffer-invisibility-spec (org-inhibit-invisibility)) 
	   (beg (condition-case nil
		    (progn (outline-back-to-heading) (point))
		  (error (point-min))))
	   (end (move-marker
		 (make-marker)
		 (progn (or (outline-get-next-sibling) ;; (1)
			    (goto-char (point-max)))
			(point))))   
	   (re "\\(\\[[0-9]*%\\]\\)\\|\\(\\[[0-9]*/[0-9]*\\]\\)")
	   (re-box
	    "^[ \t]*\\(*+\\|[-+*]\\|[0-9]+[.)]\\) +\\(\\[[- X]\\]\\)")
	   b1 e1 f1 c-on c-off lim (cstat 0))
      (when all
	(goto-char (point-min))
	(or (outline-get-next-sibling) (goto-char (point-max))) ;; (2)
	(setq beg (point) end (point-max)))
      (goto-char beg)
      (while (re-search-forward re end t)
	(setq cstat (1+ cstat)
	      b1 (match-beginning 0)
	      e1 (match-end 0)
	      f1 (match-beginning 1)
	      lim (cond
		   ((org-on-heading-p)
		    (or (outline-get-next-sibling) ;; (3)
			(goto-char (point-max)))
		    (point))
		   ((org-at-item-p) (org-end-of-item) (point))
		   (t nil))
	      c-on 0 c-off 0)
	(goto-char e1)
	(when lim
	  (while (re-search-forward re-box lim t)
	    (if (member (match-string 2) '("[ ]" "[-]"))
		(setq c-off (1+ c-off))
	      (setq c-on (1+ c-on))))
	  (goto-char b1)
	  (insert (if f1
		      (format "[%d%%]" (/ (* 100 c-on)
					  (max 1 (+ c-on c-off))))
		    (format "[%d/%d]" c-on (+ c-on c-off))))
	  (and (looking-at "\\[.*?\\]")
	       (replace-match ""))))
      (when (interactive-p)
	(message "Checkbox statistics updated %s (%d places)"
		 (if all "in entire file" "in current outline entry")
		 cstat)))))
(defadvice org-update-checkbox-count (around sk activate)
  "Fix the built-in checkbox count to understand headlines."
  (setq ad-return-value
	(me/org-update-checkbox-count (ad-get-arg 1))))

(global-set-key (kbd "C-c r") 'remember)    ;; (1)
(add-hook 'remember-mode-hook 'org-remember-apply-template) ;; (2)
(setq org-remember-templates  
      '((?n "* %U %?\n\n  %i\n  %a" "~/.emacs.d/org/notes.org")))  ;; (3)
(setq remember-annotation-functions '(org-remember-annotation)) ;; (4)
(setq remember-handler-functions '(org-remember-handler)) ;; 

(setq org-agenda-include-diary t)
(setq org-agenda-include-calendar t)

;; run a few shells.
;(shell "*shell2*")
;;(shell "*shell3*")
;;(shell "*shell4*")

;; C-2,3,4 to switch to shells
;(global-set-key [(control \2)])
;;  (lambda () (interactive) (switch-to-buffer "*shell2*"))
;;(global-set-key [(control \3)]
;;  (lambda () (interactive) (switch-to-buffer "*shell3*"))
;;(global-set-key [(control \4)]
;;  (lambda () (interactive) (switch-to-buffer "*shell4*"))

;; (defun org-mode-reftex-setup ()
;;   (load-library "reftex")
;;   (and (buffer-file-name) (file-exists-p (buffer-file-name))
;;        (progn
;; 	 ;enable auto-revert-mode to update reftex when bibtex file changes on disk
;; 	 (global-auto-revert-mode t)
;; 	 (reftex-parse-all)
;; 	 ;add a custom reftex cite format to insert links
;; 	 (reftex-set-cite-format
;; 	  '((?b . "[[bib:%l][%l-bib]]")
;; 	    (?n . "[[notes:%l][%l-notes]]")
;; 	    (?p . "[[papers:%l][%l-paper]]")
;; 	    (?t . "%t")
;; 	    (?h . "** %t\n:PROPERTIES:\n:Custom_ID: %l\n:END:\n[[papers:%l][%l-paper]]")))))
;;   (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
;;   (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))

;; (add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; (defun org-mode-reftex-search ()
;;   ;;jump to the notes for the paper pointed to at from reftex search
;;   (interactive)
;;   (org-open-link-from-string (format "[[notes:%s]]" (first (reftex-citation t)))))

;; (setq org-link-abbrev-alist
;;       '(("bib" . "~/.emacs.d/research/references.bib::%s")
;; 	("notes" . "~/.emacs.d/research/notes.org::#%s")
;; 	("papers" . "~/.emacs.d/research/%s.pdf")))

(set-face-attribute 'org-todo nil
                    :box '(:line-width 2 
                           :color "grey75" 
                           :style released-button)
                    :inverse-video t
                    )
(set-face-attribute 'org-done nil
                    :box '(:line-width 2 
                           :color "grey75" 
                           :style released-button)
                    :inverse-video t
                    )
(set-face-attribute 'org-priority nil
                    :inherit font-lock-keyword-face 
                    :inverse-video t 
                    :box '(:line-width 2 
                           :color "grey75" 
                           :style released-button)
                    )

 (setq org-todo-keywords
  '((sequence "TODO"
      "MAYBE"
      "NEXT"
      "SCHEDULED"
      "WAITING"
      "DELEGATED"
      "|"
      "DONE"
      "DEFERRED"
      "CANCELLED")))

  ;; (setq org-todo-keyword-faces
  ;;   '(("PROJ" :background "blue" :foreground "black" :weight bold :box (:line-width 2 :style released-button))
  ;;     ("TODO" :background "red1" :foreground "black" :weight bold :box (:line-width 2 :style released-button))
  ;;     ("NEXT" :background "red1" :foreground "black" :weight bold :box (:line-width 2 :style released-button))
  ;;     ("SCHEDULED" :background "orange" :foreground "black" :weight bold :box (:line-width 2 :style released-button))
  ;;     ("WAITING" :background "yellow" :foreground "black" :weight bold :box (:line-width 2 :style released-button))
  ;;     ("DEFERRED" :background "gold" :foreground "black" :weight bold :box (:line-width 2 :style released-button))
  ;;     ("DELEGATED" :background "gold" :foreground "black" :weight bold :box (:line-width 2 :style released-button))
  ;;     ("MAYBE" :background "gray" :foreground "black" :weight bold :box (:line-width 2 :style released-button))
  ;;     ("APPT" :background "red1" :foreground "black" :weight bold :box (:line-width 2 :style released-button))
  ;;     ("DONE" :background "forest green" :weight italics :box (:line-width 2 :style strike-through))
  ;;     ("CANCELLED" :background "lime green" :foreground "black" :weight bold :box (:line-width 2 :style released-button))))

(when (not (string-equal (org-version) "8.2.7c"))
  (display-warning
   'org-mode
   (concat
    "Insufficient requirements. Expected 8.2.7c Found " (org-version))
   :emergency))

(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-cancelled t)
(setq org-agenda-skip-deadline-if-cancelled t)
;; Do not show Done States in the Agenda
(setq org-agenda-skip-scheduled-if-done t)
(setq org-checkbox-hierarchical-statistics t)
(setq org-todo-hierarchical-statistics t)

(defun org-summary-todo (n-done n-not-done)
"Switch entry to DONE when all subentries are done, to TODO otherwise."
(let (org-log-done org-log-states)
; turn off logging
(org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(require 'org-clock)
(setq org-clock-persist t)
(org-clock-persistence-insinuate)

(add-hook 'org-mode-hook
          (lambda ()
            (require 'org-clock)
            (setq org-clock-persist t)
            (org-clock-persistence-insinuate)))

(defun org-clock-in-anywhere (&optional select)
  "Clock in.  If called without prefix and not in Org-mode, clock
in the entry pointed by org-default-link."
  (interactive "P")
  (if (or select (equal major-mode 'org-mode))
      (org-clock-in select)
    (save-window-excursion
      (save-selected-window
	(org-goto-default-link)
	(set-buffer (window-buffer (selected-window)))
	(org-clock-in)))))

 '(org-agenda-clockreport-parameter-plist (quote (:link f :maxlevel 3)))
 '(org-agenda-custom-commands (quote (("b" "Agenda with bitwork"
((agenda "" nil) (tags "bit" ((org-agenda-overriding-header "Bitwork")
(org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote
todo) (quote done)))))) (tags "rest" ((org-agenda-overriding-header
"Rest") (org-agenda-skip-function (quote (org-agenda-skip-entry-if
(quote todo) (quote done)))) (org-agenda-skip-function (quote
(org-agenda-skip-entry-if (quote timestamp) (quote future))))))) nil
nil) ("w" "Unscheduled TODO items" ((todo "TODO"
((org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote
scheduled)))) (org-agenda-tag-filter-preset (quote ("-rest"
"-bit")))))) nil))))
;;  '(org-agenda-diary-file "C:\\Users\\sheff036\\Dropbox\\todo\\org-diary.org")
;;  '(org-agenda-files (quote
;; ("c:/Users/sheff036/Dropbox/todo/Teaching.org"
;; "c:/Users/sheff036/Dropbox/todo/Work.org"
;; "c:/Users/sheff036/Dropbox/todo/Research.org"
;; "c:/Users/sheff036/Dropbox/todo/Personal.org")))
 '(org-agenda-include-diary t)
 '(org-agenda-insert-diary-extract-time t)
 '(org-agenda-insert-diary-strategy (quote top-level))
 '(org-agenda-log-mode-items (quote (closed clock)))
 '(org-agenda-mouse-1-follows-link nil)
 '(org-agenda-skip-deadline-prewarning-if-scheduled 3)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-span (quote day))
 '(org-agenda-start-with-clockreport-mode t)
 '(org-agenda-start-with-log-mode nil)
 '(org-agenda-tags-todo-honor-ignore-options t)
 '(org-agenda-todo-ignore-scheduled (quote future))
 '(org-agenda-window-setup (quote other-frame))  
 '(org-provide-todo-statistics t)  


  (provide 'setup-orgmode)
;;; setup-orgmode ends here
