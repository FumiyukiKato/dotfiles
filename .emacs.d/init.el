(require 'package)

;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; to use use-pacakge
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; requires
(require 'use-package)
(require 'xclip)
(require 'idea-darkula-theme)
(xclip-mode 1)

;; font
(add-to-list 'default-frame-alist '(font . "ricty-12"))

;; color theme
(load-theme 'idea-darkula t)

;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(setq linum-format "%4d ") ; 5 桁分の領域を確保して行番号のあとにスペースを入れる

;; バックアップファイルを作成しない
(setq make-backup-files nil)

;; オープニングメッセージを表示しない
(setq inhibit-startup-message t)

;; オートセーブファイルを作成しない
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; 1行づつスクロールする
(setq scroll-conservatively 1)

;; 対応する括弧をハイライトする
(show-paren-mode 1)

;; カーソル位置の行数をモードライン行に表示する
(line-number-mode 1)

;; リージョンを色付きにする
(transient-mark-mode 1)

; cursor の blink を止める
(blink-cursor-mode 0)

;; 予約語を色分けする
(global-font-lock-mode t)

;; C-h を Backspace として使い、
;; C-c h を HELP に割当てる
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
(global-set-key "\C-ch" 'help-command)

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;; メニューバーを消す
(menu-bar-mode -1)

;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)

;; beep音を消す
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; 行数を表示する
(global-linum-mode t)

;; Macのoptionをメタキーにする
(setq mac-option-modifier 'meta)

;; タブインデントを有効にする
(setq indent-tabs-mode t)

;; tabサイズ
(setq default-tab-width 4)

;; 選択領域を削除キーで一括削除
(delete-selection-mode t)

;; ツールバーを隠す
(when (display-graphic-p)
  (tool-bar-mode -1))


(when (memq window-system '(mac ns))
  (setq initial-frame-alist
        (append
         '((ns-transparent-titlebar . t) ;; タイトルバーを透過
           (vertical-scroll-bars . nil) ;; スクロールバーを消す
           ;; (ns-appearance . dark) ;; 26.1 {light, dark}
           (internal-border-width . 0))))) ;; 余白を消す
(setq default-frame-alist initial-frame-alist)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode scala-mode xclip idea-darkula-theme zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; マウスカーソルによる操作が可能になる
;; xterm-mouse-mode
(unless (fboundp 'track-mouse)
  (defun track-mouse (e)))
(xterm-mouse-mode t)
(require 'mouse)
(require 'mwheel)
(mouse-wheel-mode t)


