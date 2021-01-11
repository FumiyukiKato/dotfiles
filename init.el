;; Pacakges

(setq byte-compile-warnings '(cl-functions))

;; https://qiita.com/yuze/items/a145b1e3edb6d0c24cbf

;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

;; helm
(straight-use-package 'helm)
(helm-mode 1)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-x p") 'helm-find-files)
(define-key global-map (kbd "C-x r") 'helm-recentf)
(define-key helm-map (kbd "C-h") 'helm-ff-delete-char-backward)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key global-map (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)


;; helm-git-grep
;; https://github.com/yasuyk/helm-git-grep#installation
(straight-use-package 'wgrep)
(straight-use-package 'compile)
(straight-use-package 'helm-git-grep) ;; Not necessary if installed by package.el
(global-set-key (kbd "C-x g") 'helm-git-grep)
;; Invoke `helm-git-grep' from isearch.
(define-key isearch-mode-map (kbd "C-x g") 'helm-git-grep-from-isearch)
;; Invoke `helm-git-grep' from other helm.
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-x g") 'helm-git-grep-from-helm))

;; recentf-ext
(straight-use-package 'recentf-ext)
(recentf-mode 1)
(setq recentf-max-saved-items 200)
(setq recentf-save-file "~/.emacs.d/recentf")
(setq recentf-auto-cleanup 'never)
(setq helm-for-files-preferred-list
      '(helm-source-buffers-list
        helm-source-recentf
        helm-source-bookmarks
        helm-source-file-cache
        helm-source-files-in-current-dir
        helm-source-bookmark-set
        helm-source-locate))

;; company
(straight-use-package 'company)
(global-company-mode)
(setq company-transformers '(company-sort-by-backend-importance))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)
(setq company-selection-wrap-around t)
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
(define-key company-active-map (kbd "C-[") 'company-complete-selection)
(define-key company-active-map [tab] 'company-complete-selection)
(define-key company-active-map (kbd "C-f") 'company-complete-selection)
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

;; migemo
(straight-use-package 'migemo)
(straight-use-package 'helm-migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/Cellar/cmigemo/20110227/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)

;; swiper
(global-set-key (kbd "C-s") 'swiper)
(defvar swiper-include-line-number-in-search t)
(straight-use-package 'avy)
(straight-use-package 'swiper-helm)
(straight-use-package 'avy-migemo)
(avy-migemo-mode 1)

;; multi-cursor
(straight-use-package 'multiple-cursors)
(straight-use-package 'smartrep)
(require 'smartrep)
(global-set-key (kbd "C-x m") 'mc/edit-lines)
(declare-function smartrep-define-key "smartrep")
(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
  '(("C-t"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'mc/reverse-regions)))

(smartrep-define-key
    global-map "M-g"
  '(("n" . next-line)
    ("p" . previous-line)))

;; General
;; https://techblog.recochoku.jp/1403
 
;; do not show startup-message
(setq inhibit-startup-message t)
 
;; C-k to remove all of the line
(setq kill-whole-line t)
 
;; C-h to type "backspace" key
(keyboard-translate ?\C-h ?\C-?)

;; do not make backup file (name starts with "#")
(setq make-backup-files nil)
(setq auto-save-default nil)

;;BEEP disable
(setq ring-bell-function 'ignore)
 
;; scroll each line
(setq vertical-centering-font-regexp ".*")
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)
 
;; set tab width  4
(setq-default tab-width 4)
(setq default-tab-width 4)
 
;; display corresponding parens
(show-paren-mode 1)
 
;;quickly key stroke
(setq echo-keystroke 0.1)
 
;; yes-no -&gt; y-n
(defalias 'yes-or-no-p 'y-or-n-p)
 
;; always enable region color
(setq transient-mark-mode t)
 
;; delete old back up files automatically
(setq delete-old-versions t)

;; show functions name where the cursor is
(which-function-mode 1)
 
;; マウスホイール有効
(when (require 'mwheel nil 'noerror)
  (mouse-wheel-mode t)
  (setq mouse-sheel-follow-mouse t)
  (setq mouse-wheel-progressive-speed nil))

;; マウスカーソルによる操作が可能になる
;; xterm-mouse-mode
(unless (fboundp 'track-mouse)
  (defun track-mouse (e)))
(xterm-mouse-mode t)
(require 'mouse)
(require 'mwheel)
(mouse-wheel-mode t)
 
;; クリップボード共有
;; https://qiita.com/tstomoki/items/24d63217f797c6929a23
(defun copy-from-osx ()
 (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
 (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
       (process-send-string proc text)
       (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
 
;; カーソルの設定
(set-cursor-color "black")
(setq blink-cursor-interval 0.7)
(setq blink-cursor-delay 1.0)
(blink-cursor-mode 1)

;; font
(add-to-list 'default-frame-alist '(font . "ricty-12"))

;; color theme
(load-theme 'tango t)

;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; 5 桁分の領域を確保して行番号のあとにスペースを入れる
(setq linum-format "%4d ")

;; 対応する括弧をハイライトする
(show-paren-mode 1)

;; カーソル位置の行数をモードライン行に表示する
(line-number-mode 1)

;; リージョンを色付きにする
(transient-mark-mode 1)

;; cursor の blink を止める
(blink-cursor-mode 0)

;; 矩形選択モードをC-rに割り当てる（元々のreverse検索みたいなやつ使ったことないので）
(global-set-key "\C-r" 'rectangle-mark-mode)

;; メニューバーを消す
(menu-bar-mode -1)

;; 行数を表示する
(global-linum-mode t)

;; Macのoptionをメタキーにする
(setq mac-option-modifier 'meta)

;; タブインデントを有効にする
(setq-default indent-tabs-mode t)
(global-set-key (kbd"TAB") (kbd "C-q TAB"))

;; tabサイズ
(setq default-tab-width 4)

;; 選択領域を削除キーで一括削除
(delete-selection-mode t)

;; ツールバーを隠す
(when (display-graphic-p)
  (tool-bar-mode -1))

;;C-z を undo に
(define-key global-map (kbd "C-z") 'undo)

;; redo undo http://emacs.rubikitch.com/sd1509-safeguard-undo-redo/
(straight-use-package 'redo+)
(global-set-key (kbd "C-S-z") 'redo)
(setq undo-no-redo t)
