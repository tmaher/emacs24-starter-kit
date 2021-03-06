(setq
 make-backup-files nil
 next-line-add-newlines nil  ;;; rms is a twit
 delete-key-deletes-forward nil
 minibuffer-max-depth nil
 fill-column 72
 tab-width 4
 require-final-newline t
 warning-suppress-types nil
 )

(setq-default
 indent-tabs-mode nil
 tab-width 4
 sh-indentation 2
 )

(defun tmaher-init-keybind ()
  "Rebind my keys correctly, damn it!"
  (interactive)
  (global-set-key "\C-x\-" 'shrink-window)
  (global-set-key "\M-g" 'goto-line)
  (global-set-key "\C-g" 'jolly-candy-like-keyboard-quit)
  (global-set-key "\C-s" 'isearch-forward-regexp)
  (global-set-key "\C-r" 'isearch-backward-regexp)
  (global-set-key "\M-%" 'query-replace-regexp)
  (global-set-key [(meta tab)] 'dabbrev-completion)
  (global-set-key "\M-s" 'ispell-buffer)
  (define-key global-map [(control home)] 'beginning-of-buffer)
  (define-key global-map [(control end)] 'end-of-buffer)
  (define-key global-map [home] 'beginning-of-line)
  (define-key global-map [end] 'end-of-line)
  )

(defun crack-whore () 
  "It's easy, m'kay?"
  (interactive)
  (message "Living on the street, giving handjobs for crack."))

(defun jolly-candy-like-keyboard-quit ()
  (interactive)
  (signal 'quit
          '("Don't touch it! It's the History Eraser Button, you fool!")))

(defun indent-buffer () (interactive)
  "Smart-indent buffer"
  (save-excursion (indent-region (point-min) (point-max) nil))
  (save-excursion (untabify (point-min) (point-max)))
  (if font-lock-mode (font-lock-fontify-buffer)))

(defalias 'perl-mode 'cperl-mode)

(setq auto-mode-alist
      (append (list '("\\.pl$" . cperl-mode)
                    '("\\.txt$" . text-mode)
                    '("\\.+rc$" . shell-script-mode)
                    '("\\.as$" . actionscript-mode)
                    '("\\.gemspec$" . ruby-mode)
                    '("Gemfile$" . ruby-mode)
                    ) auto-mode-alist)
      )

(column-number-mode t)
(line-number-mode t)
(menu-bar-mode -1)
(auto-fill-mode -1)

(add-hook 'java-mode-hook (lambda () (setq c-basic-offset 2
                                      indent-tabs-mode nil)))
(add-hook 'go-mode-hook (lambda () (setq indent-tabs-mode nil)))

;; shut up shut up SHUT UP
(setq warning-minimum-level :error)
(setq warning-minimum-log-level :error)

(server-start)
(add-hook 'term-setup-hook 'tmaher-init-keybind)
(add-hook 'term-setup-hook (lambda () 
                             (message "What is thy bidding, my master?")))

(setq-default
 mode-line-format
 (list "%e"
       mode-line-position
       mode-line-modified
       mode-line-mule-info
       ;; mode-line-remote
       "|"
       mode-line-buffer-identification
       " %n "
       '(vc-mode vc-mode)
       mode-line-modes
       mode-line-misc-info
       mode-line-end-spaces
       ))

(custom-set-variables
 '(nxhtml-skip-welcome t)
 '(query-user-mail-address nil)
 '(toolbar-visible-p nil)
 '(user-mail-address "Tom Maher <tmaher@pw0n.me>")
 )

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.

 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face)) (((class color) (min-colors 8) (background dark)) nil)))
 '(font-lock-comment-face ((nil (:foreground "red"))))
 '(link ((t (:foreground "cyan" :underline t))))
 '(minibuffer-prompt ((t (:foreground "cyan"))))
 '(mode-line ((t (:background "blue" :foreground "yellow"))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 8)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 8)) nil))))

(put 'ido-exit-minibuffer 'disabled nil)
