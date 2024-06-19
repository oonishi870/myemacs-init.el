(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; leafのインストール
(unless (package-installed-p 'leaf)
  (package-refresh-contents)
  (package-install 'leaf))

(leaf leaf-keywords
  :ensure t
  :init
  (leaf hydra :ensure t)
  (leaf el-get :ensure t)
  (leaf blackout :ensure t)

  :config
  (leaf-keywords-init))


(leaf *basic-settings
  :config
  ;; 2023/06/09 選択中の入力で元テキストを削除
  (delete-selection-mode t)
  ;; スクロールバーを非表示にする
  (scroll-bar-mode -1)
  ;; クリップボードにコピーする
  (setq x-select-enable-clipboard t)
  ;; クリップボードから貼り付ける
  (setq select-enable-clipboard t)
  ;; 行番号を表示する
  (global-display-line-numbers-mode)
  ;; shellモードなどは行番号表示をoff
  (add-hook 'shell-mode-hook '(lambda () (display-line-numbers-mode -1)))
  (add-hook 'compilation-mode-hook '(lambda () (display-line-numbers-mode -1)))
  (add-hook 'interpretation-mode-hook '(lambda () (display-line-numbers-mode -1)))
  ;; マウス設定 2018/04/04 oonishi
  (xterm-mouse-mode t)
  (mouse-wheel-mode t)
  (global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 3)))
  (global-set-key [mouse-5] '(lambda () (interactive) (scroll-up   3)))
  ;; 現在行をハイライト
  ;;(global-hl-line-mode t)
  (global-hl-line-mode nil)
  ;; 対応する括弧をハイライト
  (show-paren-mode t)
  ;; 括弧のハイライトの設定。
  (setq show-paren-style 'mixed)
  (cua-mode t)
  ;; メニューバーはいらない
  (menu-bar-mode -1)
  ;; ツールバーもいらない
  (tool-bar-mode -1)
  ;; 現在行のハイライトを無効
  (global-hl-line-mode -1)
  
  ;; ediffを左右分割にする
  (setq ediff-split-window-function (quote split-window-horizontally))
  ;; コントロール用のバッファを同一フレーム内に表示する
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)

  ;; lispのインデント設定
  (setq-default lisp-indent-offset 2)
  (setq-default indent-tabs-mode nil)
  ;; タブ幅を4に設定
  (setq-default tab-width 4)
  (setq python-indent-offset 4)

  ;; 自作インデント
  (defun get-line-start-position (line-number)
    "Return the position of the beginning of the line specified by LINE-NUMBER."
    (save-excursion
      (goto-line line-number)
      (line-beginning-position)))
  
  (defun get-line-end-position (line-number)
    "Return the position of the end of the line specified by LINE-NUMBER."
    (save-excursion
      (goto-line line-number)
      (line-end-position)))

  (defun current-tab-width ()
  "Return the appropriate tab width for the current major mode."
    (cond
      ((derived-mode-p 'c-mode 'c++-mode 'java-mode 'javascript-mode) c-basic-offset)
      ((derived-mode-p 'python-mode) python-indent-offset)
      ((derived-mode-p 'ruby-mode) ruby-indent-level)
      ((derived-mode-p 'js-mode) js-indent-level)
      ((derived-mode-p 'emacs-lisp-mode) lisp-indent-offset)
      ((derived-mode-p 'lisp-mode) lisp-indent-offset)
      (t tab-width)))  ; Default to tab-width if no specific setting is found

  (defun my/indent-or-unindent (&optional unindent)
    "Indent or unindent current line or region based on the presence of a prefix argument, or insert a tab/spaces if no region is selected."
    (interactive "P")
    ;; 空行だったら
    (if (string-match-p "^[ \t]*$"
          (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
      (if (not unindent)
        (if indent-tabs-mode
            (insert "\t")  ; Insert a tab character
          (insert (make-string (current-tab-width) ?\s)))
        ;; Unindent
        (let (
          (width (if indent-tabs-mode 1 (current-tab-width)))
               )
          (goto-char (- (point) width))
          (delete-char width)))
      (progn
        (if (not (use-region-p))
          ;; 現在行を選択
          (progn
            (set-mark (line-beginning-position))
            (goto-char (line-end-position))
            (advice-add 'handle-shift-selection :after #'my/unset-mark-on-next-move)
          ))
        (let* ((start-pos (region-beginning) )
               (end-pos  (region-end))
               (start-line (line-number-at-pos start-pos))
               (end-line (line-number-at-pos end-pos))
               (start-line-start-pos (get-line-start-position start-line))
               (end-line-end-pos (get-line-end-position end-line))
               (deactivate-mark nil))  ; This keeps the selection active after the command
          ;; Indent or unindent the region
          (goto-char start-line-start-pos)
          (set-mark (point))
          (goto-char end-line-end-pos)
          (if unindent
              (indent-rigidly start-line-start-pos end-line-end-pos (- (current-tab-width)))
            (indent-rigidly start-line-start-pos end-line-end-pos (current-tab-width)))
          ;; Recalculate the start and end positions based on the original line numbers and columns
          (goto-char start-line-start-pos)
          (set-mark (point))
          (goto-char (get-line-end-position end-line))
          ))))
      ;; No region selected, insert tab or equivalent spacest
      ;; (if indent-tabs-mode
      ;;     (insert "\t")  ; Insert a tab character
      ;;   (insert (make-string (current-tab-width) ?\s)))))
                                        ; Insert spaces

  (global-set-key (kbd "TAB") 'my/indent-or-unindent)
  (global-set-key (kbd "<backtab>") (lambda () (interactive) (my/indent-or-unindent t)))



  ;; 2020/02/17 修正
  (defun my/next--window(reverse)
    ;;(interactive)
    (let (win)
  	(setq win (if reverse (previous-window) (next-window)))
  	;;(while (or (window-minibuffer-p win) (< (window-height win)  20) (not (eq win (selected-window))))
  	(while (or (window-minibuffer-p win) (< (window-height win)  20) )
  	  (setq win (next-window win)))
  	(if (eq win (selected-window))
  		nil win))
  )
  (defun my/turn-buffer (&optional arg)
    (interactive "P")
    (let (nextwin)
  	(setq nextwin (my/next--window arg))
  	(when nextwin
  		(set-window-buffer nextwin (current-buffer))
  		(switch-to-prev-buffer)
  		(select-window nextwin)
  	  ))
    )
  (defun kill-ring-save-keep-selection (&optional args)
    (interactive "P")
    "Keep selection after copying."
    (let ((deactivate-mark nil))
      (kill-ring-save (region-beginning) (region-end) args))
    )
  (defun my/smart-split-window ()
    "Split the window into two. Split horizontally if the window is wide enough, vertically otherwise."
    (interactive)
    (if (> (/ (window-width) 2) (window-height))
      (split-window-right)
      (split-window-below)))
  (provide 'my/smart-split-window)

  ;; ビープ音を鳴らさない
  (setq ring-bell-function 'ignore)

  ;; 選択範囲を独立したバッファに切り出す
  (defun my/edit-region-in-indirect-buffer (start end)
    "Edit the region specified by START and END in an indirect buffer.
     Only the region is visible in the indirect buffer, thanks to `narrow-to-region`."
    (interactive "r")
    (let ((buffer-name (generate-new-buffer-name "*Indirect Region Edit*"))
          (origin-buffer (current-buffer)))
      ;; 1. 間接バッファを作成
      (with-current-buffer (make-indirect-buffer origin-buffer buffer-name t)
        ;; 2. 新しいバッファで選択範囲を狭める
        (narrow-to-region start end)
        ;; 3. 新しいバッファを表示し、ユーザーに編集させる
        (switch-to-buffer-other-window (current-buffer))
        ;; オプション: この時点で追加の設定やモードの変更を行う
        )))
  ;; 自動インデントをいい感じに
  (electric-indent-mode 1)
  (setq indent-line-function #'indent-relative)
  (setq electric-indent-inhibit t)

  (leaf whitespace
    (set-face-foreground 'whitespace-tab "gray")
    (set-face-underline  'whitespace-tab nil)
    (set-face-background 'whitespace-tab nil)

    ;; タブの表示を変更
    (setq whitespace-display-mappings
      ;;'((tab-mark ?\t [?\xBB ?\t])))
      '((tab-mark ?\t [?^ ?\t])))

    (setq whitespace-style '(face           ; faceで可視化
                             ;; trailing       ; 行末
                             tabs           ; タブ
                             ;;empty          ; 先頭/末尾の空行
                             ;;spaces         ; 空白
                             ;; space-mark     ; 表示のマッピング
                             tab-mark))

    (global-whitespace-mode 0))
)

(leaf expand-region
  :ensure t
  :config
  ;;(er/expand-region-skip-whitespace f)
  ;; 真っ先に入れておかないとすぐに括弧に対応してくれない…
  ;;(require 'expand-region)
  ;;(push 'er/mark-outside-pairs er/try-expand-list)

  ;; expand-regionのあとmarkが刺さったままの状態になるのでその対応
  ;; this-command-keys-shift-translatedがnilの操作が
  ;; 来たときに強制的にregionを解除する
  (defun my/unset-mark-on-next-move (&optional args)
    (if (not this-command-keys-shift-translated)
      (let()
        (deactivate-mark)
        (advice-remove 'handle-shift-selection #'my/unset-mark-on-next-move)
      )
    ))
  ;;(advice-add 'handle-shift-selection :after #'my/unset-mark-on-next-move)
  (defun my/expand-region-advice (&optional args)
    (advice-add 'handle-shift-selection :after #'my/unset-mark-on-next-move))

  (advice-add 'er/expand-region :after #'my/expand-region-advice)
  ;;(advice-remove 'er/expand-region #'my/expand-region-advice)

  ;; lisp開発用
  ;; 直前に実行したlisp式を再実行する
  (defvar last-evaluated-sexp nil
  "Stores the last evaluated S-expression.")

  (defun store-last-evaluated-sexp (arg)
    "Store the last evaluated S-expression from the point."
    (setq last-evaluated-sexp (sexp-at-point)))

  (advice-add 'eval-last-sexp :before #'store-last-evaluated-sexp)

  (defun my/repeat-last-evaluated-sexp ()
    "Evaluate the last evaluated S-expression."
    (interactive)
    (if last-evaluated-sexp
        (eval-expression last-evaluated-sexp)
      (message "No S-expression has been evaluated yet.")))
)

(leaf undo-tree
  :ensure t
  :config
  (global-undo-tree-mode t)
  (setq undo-tree-auto-save-history nil)
)

(leaf swiper
  :ensure t
)

(leaf poly-markdown
  :ensure t
  :config
  (require 'poly-markdown)
  (set-face-attribute 'markdown-code-face nil :inherit 'default)
  (set-face-attribute 'markdown-blockquote-face nil :inherit 'default)
  (define-auto-innermode my/poly-markdown-fenced-code-innermode
    :head-matcher (cons "^[ \t]*\\(```{?[[:alpha:]].*\n\\)" 1)
    ;;:head-matcher (cons "^[ \t]*\\(```.*\n\\)" 1)
    :tail-matcher (cons "^[ \t]*\\(```\\)[ \t]*$" 1)
    :mode-matcher (cons "```[ \t]*{?\\(?:lang *= *\\)?\\([^ \t\n;=,}:]+\\).*" 1)
    ;;:mode-matcher (cons "```[ \t]*{?\\(?:lang *= *\\)?\\([^ \t\n;=,}]+\\)" 1)
    :head-mode 'host
    :tail-mode 'host)
   
  (define-polymode my/poly-markdown-mode
    :hostmode 'pm-host/markdown
    :innermodes '(my/poly-markdown-fenced-code-innermode))
    ;; :innermodes '(my/poly-python-innermode
    ;;               my/poly-markdown-fenced-code-innermode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . my/poly-markdown-mode))
  (setq polymode-mode-name-override-alist '((elisp . emacs-lisp)))
   
   
  ;; 2020/01/22 shift選択でmarkdownのコードブロックをまたぐ場合の対処
  (defadvice handle-shift-selection
    (around leave-mark-intact activate preactivate compile)
    (cond ((and shift-select-mode this-command-keys-shift-translated)
            (unless mark-active
              (setq transient-mark-mode
                (cons 'only
                  (unless (eq transient-mark-mode 'lambda)
                    transient-mark-mode)))
              (push-mark nil nil t)))
      ((eq (car-safe transient-mark-mode) 'only)
        (setq transient-mark-mode (cdr transient-mark-mode))
        (deactivate-mark))))
  
  (setq my/mdcoderun--last-command "")
  (defun my/mdcoderun()
    (interactive)
    (if (buffer-file-name)
      (let(
          (process-environment (append  
                                 process-environment '("MDCODERUN_LANG2EXEC=elisp=emacsclient -e '(load \"{}\")',emacs-lisp=emacsclient -e '(load \"{}\")'")))
          (lno (line-number-at-pos (point))))
        (save-buffer)
        ;; 2020/08/04 再実行対応
        (executable-interpret
          (setq my/mdcoderun--last-command 
            (format "~/bin/mdcoderun %s --keep-lineno -l %d " (buffer-file-name) lno))))
      (let* (
          (process-environment (append  
                                 process-environment '("MDCODERUN_LANG2EXEC=elisp=emacsclient -e '(load \"{}\")',emacs-lisp=emacsclient -e '(load \"{}\")'")))
          (process-connection-type nil)
          (lno (line-number-at-pos (point)))
          ;;(buf  (executable-interpret (format "mdcoderun --keep-lineno -l %d |cat" lno)))
          (buf  (executable-interpret (format "~/bin/mdcoderun --keep-lineno -l %d " lno)))
          (proc (get-buffer-process buf)))

        (process-send-string proc (substring-no-properties (buffer-string) 0))
        (process-send-string proc "\n")
        (process-send-eof proc)
      ))
  )
  (provide 'my/mdcoderun)
  (defun my/mdcoderun-again(&optional arg)
    (interactive "P")
    (executable-interpret my/mdcoderun--last-command))

  (provide 'my/mdcoderun-again)
)



(leaf ivy-group
  :init
  (leaf ivy
    :ensure t
    :config
    (require 'ivy)

  (leaf recentf
    :config
    (recentf-mode 1) ;; recentf を有効化
    (setq recentf-max-saved-items 100) ;; 保存するファイルの最大数
  )
  (leaf counsel
    :init
    :after ivy recentf
    :ensure t
    :config
    (require 'recentf)
    (require 'ivy)
    (require 'counsel)
    ;; デフォルトで"^"が入っているのが気に入らない
    (setq ivy-initial-inputs-alist
      (remove '(counsel-M-x . "^")
        ivy-initial-inputs-alist))
    )
    
    ;; helm-miniライクなやつ
    (defun my/counsel-mini (&optional args)
      "最近使ったファイルとバッファリストを切り替え候補として表示する。"
      (interactive)
      (ivy-read "Switch to buffer or file: "
        (append (mapcar #'buffer-name (buffer-list))
          (counsel-recentf-candidates))
                                        ;  ;    :action #'ivy--switch-buffer-action
        :action (lambda (name) ;;(funcall message_org name)
                  (if (get-buffer name)
                    (switch-to-buffer (get-buffer name))
                    (find-file name)))))

    (provide 'my/counsel-mini)
    )
  (leaf company
    :config
    ;; counsel-companyの実行後にcompany-modeを無効にする
    (defun my/company-mode-disable(&rest _)
      (company-mode -1)
      )
    (advice-add 'counsel-company :after #'my/company-mode-disable)
    )
  :config
  ;; (require 'ivy)
  ;; (require 'counsel)
  (require 'recentf)
  (leaf ivy-posframe
    :ensure t
    :config
    (ivy-posframe-mode 1)
    )
  (leaf ivy-migemo
    :ensure t
    )
)



(leaf helm-group
  :config
  (leaf helm       :ensure t)
  (leaf helm-swoop :ensure t)
  ;; 2024/02/08 上部リストから下部リストに↓キーで移動する
  (setq helm-move-to-line-cycle-in-source nil)
  ;; 2024/02/08 アクティブでないwindowにhelmを表示
  (setq helm-split-window-inside-p t)
  (setq helm-split-width-threshold 1024)
)

(leaf *basic-settings
  :config
  ;; C言語のインデント設定
  (setq c-basic-offset 4)
)
;; (require 'leaf)
;; (leaf-keywords-init)
;; (setq debug-on-error t)
;; (leaf unemacsesque-search
;;    :el-get (oonishi870/unemacsesque-search
;;            :type github
;;            :pkgname "oonishi870/unemacsesque-search"
;;            )
;;    :ensure t
;; )

(leaf unemacsesque-search
;;  :after corfu
  :config
  ;; (let (
  ;;     (local-file (locate-user-emacs-file "lisp/unemacsesque-search.el"))
  ;;     (url "https://raw.githubusercontent.com/oonishi870/unemacsesque-search/main/unemacsesque-search.el")
  ;;   )
  ;;   (unless (file-exists-p local-file)
  ;;     (url-copy-file url local-file t))
  ;;   (load local-file)

  ;;   (require 'corfu)
  ;;   ;; 検索ワードをcorfuで補完する
  ;;   (defun my/unemacslike-search-completion()
  ;;     (if unemacslike-search-mode
  ;;       (progn
  ;;         ;; (print (current-buffer))
  ;;         ;; (print (window-buffer (minibuffer-selected-window)))
  ;;         (corfu-mode 1)
  ;;         (setq-local completion-at-point-functions
  ;;           (with-current-buffer (window-buffer (minibuffer-selected-window))
  ;;             completion-at-point-functions))
          
  ;;         (setq-local cape-dabbrev-check-other-buffers
  ;;           (lambda (&optional args) 
  ;;             (with-current-buffer (window-buffer (minibuffer-selected-window))
  ;;               (cape-dabbrev-check-other-buffers args))))
  ;;         )))

  ;;   ;;(remove-hook 'unemacslike-search-mode-hook #'my/unemacslike-search-completion)
  ;;   (add-hook 'unemacslike-search-mode-hook #'my/unemacslike-search-completion 1)
  ;;   )
  )


;; C-tabでvscodeっぽい移動をする
(leaf C-tab-like-vscode
  :config
  (defun my-reset-buffer-history-timer (window)
    "Reset the buffer history clearing timer for the specified WINDOW."
    (let ((timer (window-parameter window 'my-buffer-history-timer)))
      (when timer
        (cancel-timer timer)))
    (set-window-parameter window 'my-buffer-history-timer
                          (run-with-timer 10 nil #'my-clear-buffer-history-for-window window)))

  (defun my-clear-buffer-history-for-window (window)
    "Clear the buffer history for the specified WINDOW."
    (set-window-parameter window 'my-buffer-history nil)
    (set-window-parameter window 'my-buffer-history-index 0)
    ;; Clear and unlink the timer to prevent memory leaks
    (let ((timer (window-parameter window 'my-buffer-history-timer)))
      (when timer
        (cancel-timer timer)))
    (set-window-parameter window 'my-buffer-history-timer nil))

  (defun update-buffer-history ()
    "Update the buffer history for the current window."
    (let* (
            (hist (mapcar #'car (window-prev-buffers)))
            (hist (append (list (current-buffer)) hist))
           )
      (set-window-parameter nil 'my-buffer-history hist)
      (set-window-parameter nil 'my-buffer-history-index 0)))

  (defun my/switch-to-last-buffer-in-window (&rest args)
    "Switch to the last buffer displayed in the current window."
    (interactive)
    (let* ((history (window-parameter nil 'my-buffer-history))
           (index (window-parameter nil 'my-buffer-history-index)))
      (unless history
        (update-buffer-history)
        (setq history (window-parameter nil 'my-buffer-history))
        (setq index (window-parameter nil 'my-buffer-history-index)))
      (when (> (length history) (1+ index))
        (setq index (1+ index)) 
        (let((--skip t))
          (switch-to-buffer (nth index history)))
        (set-window-parameter nil 'my-buffer-history-index index)
        ))
    (my-reset-buffer-history-timer (selected-window)))

  (defun my/switch-to-next-buffer-in-window (&rest args)
    "Switch to the next buffer in the window's buffer history, if available."
    (interactive)
    (let* ((index (window-parameter nil 'my-buffer-history-index))
           (history (window-parameter nil 'my-buffer-history)))
      (when (and (> index 0) history)
        (setq index (1- index))
        (let((--skip t))
          (switch-to-buffer (nth index history)))
        (set-window-parameter nil 'my-buffer-history-index index)))
    (my-reset-buffer-history-timer (selected-window)))

  (setq --skip nil)
  (defun reset-buffer-history ()
    "Reset the buffer history when the window's buffer changes."
    (unless --skip
      (update-buffer-history)))
    ;; (let ((current-buffer (window-buffer)))
    ;;   (unless (eq current-buffer (window-parameter nil 'last-buffer))
    ;;     (update-buffer-history)
    ;;     (set-window-parameter nil 'last-buffer current-buffer))))

  (add-hook 'window-buffer-change-hook 'reset-buffer-history)
  ;;(remove-hook 'window-buffer-change-hook 'reset-buffer-history)

  )

(leaf overriding-minor-mode
  :config
  (let ()
  (define-minor-mode overriding-minor-mode
    "My custom minor mode example."
    :lighter " MyCustom"
    :keymap  '() 
    :global t
    )
  (define-key cua--cua-keys-keymap (kbd "C-c <timeout>") 'kill-ring-save-keep-selection)
;;  (require 'cua-base)
 ;;(defun my-cua-setup ()
 ;;  (define-key cua--cua-keys-keymap (kbd "C-c <timeout>") 'comment-region))
 ;;(cua-mode -1)
 ;;(add-hook 'cua-mode-hook 'my-cua-setup)

  ;; (bind-keys :map cua-global-keymap
  ;;   ( "C-c <timeout>" . kill-ring-save-keep-selection)
  ;;   ( "C-c" . kill-ring-save-keep-selection)
    ;;  )
  ;; Homeキーを普通のエディタっぽくする
  (defun back-to-indentation-or-beginning ()
    (interactive)
    (if this-command-keys-shift-translated
      (progn
        (unless mark-active (push-mark nil t t))
        (advice-add 'handle-shift-selection :after #'my/unset-mark-on-next-move)
      ))
    (if (= (point) (progn (back-to-indentation) (point)))
        (beginning-of-line)))

  (global-set-key [home] 'back-to-indentation-or-beginning)

  (bind-keys :map overriding-minor-mode-map
      ("C-b" . nil) ;; 2018/06/27 tmux用
      ( "C-z" . undo-tree-undo)
      ( "C-y" . undo-tree-redo)
      ( "C-f" . unemacslike-search)
      ( "C-b" . isearch-forward)
      ( "C-r" . isearch-backward)
      ( "C-s" . save-buffer)
      ( "C-t" . (lambda (&optional arg) (interactive "P") (if (null arg) (other-window  1) (other-window -1))))
      
      ( "C-<tab>" . my/switch-to-last-buffer-in-window)
      ( "C-<iso-lefttab>" . my/switch-to-next-buffer-in-window)
      ( "C-h" . er/expand-region)
      ( "C-S-d" . er/contract-region)
      ( "C-k" . nil)
      ;; ( "C-k C-n" . helm-mini)
      ;; ( "C-k C-n" . counsel-switch-buffer)
      ( "C-k C-n" . my/counsel-mini)
      ( "C-k C-f" . helm-find-files)
      ;;( "C-k C-f" . counsel-find-file)
      ;; ( "C-k C-l" . helm-M-x)
      ( "C-k C-l" . counsel-M-x)
      ( "C-k C-w" . kill-buffer)
      ( "C-k C-k C-w" . revert-buffer)
      ( "C-k C-c" . comment-dwim)
      ;; ( "C-k C-j" . goto-line)
      ;;( "C-k C-d" . counsel-company)
      ( "C-k C-i" . my/smart-split-window)
      ( "C-k C-k C-i" . delete-window)
      ;;( "C-k C-o") . switch-to-prev-buffer)
      ;;( "C-k C-p") . switch-to-next-buffer)
      ;;( "C-k C-h") . swap-buffers)
      ;;( "C-k C-u") . helm-swoop)
      ( "C-k C-j" . (lambda (&optional args)
                      (interactive)
                      (if (use-region-p)
                        (swiper-thing-at-point)
                        (swiper))))
      
      ( "C-k C-u" . counsel-company)
      ;; ( "C-k C-o" . helm-show-kill-ring)
      ( "C-k C-o" . counsel-yank-pop)
      ( "C-k C-t" . my/turn-buffer)
      ( "C-k C-k C-t" . (lambda ()(interactive) (my/turn-buffer 1)))
      ;;( "C-k C-;" . helm-comint-input-ring)
      ( "C-k C-d" . my/mdcoderun)
      ( "C-k C-k C-d" . my/mdcoderun-again)
      ( "C-k C-k C-@" . describe-key)
      ( "C-k C-@" . my/repeat-last-evaluated-sexp)
;;      ( "C-k C-<left>" . split-window-left)
      ;; ( "C-k C-<right>" . split-window-right)
      ;; ( "C-k C-<down>" . split-window-below)
;;      ( "C-k C-<up>" . split-window-)
      ;;("TAB" . my/indent)
      ;;("TAB" . nil)
    ;;( "C-;" . copilot-accept-completion)
    )
    (overriding-minor-mode 1) ;; 自動で有効にする場合

    (bind-keys :map isearch-mode-map
	   ("C-b" . isearch-repeat-forward)
	   ("C-f" . isearch-repeat-forward)
	   ("C-r" . isearch-repeat-backward)
	   ;;("C-b" . isearch-repeat-backward)
	   ;; ("C-f" . isearch-forward)
	   ;; ("C-b" . isearch-backward)
	   ;;("<RET>" . isearch-repeat-forward)
	   ;;("s-<RET>" . isearch-repeat-backward)
	   ;;("<ESC>" . isearch-exit)
	   ;;("<ESC>" . nil)
	   ;;("<END>" . isearch-exit)
	   ("<END>" . (lambda ()(
				 (interactive)
				 (isearch-exit)
				 (end-of-line))))
	   
	   ("<HOME>" . (lambda ()(
				 (interactive)
				 (isearch-exit)
				 (beginning-of-line))))
	   ("C-v" . isearch-edit-string)
	   ;;("<RET>" . isearch-exit)
	   )
))

(leaf corfu
  :ensure t  ; MELPAからcorfuをインストール
  :custom ((corfu-cycle . t)  ; 候補リストの循環を有効にする
           (corfu-auto . t)  ; 自動補完を有効にする
           )
  ;;:global-minor-mode 
  :config
  ;; (setq dabbrev-check-other-buffers nil)
  ;; (setq dabbrev-check-all-buffers nil)
  ;;
  ;; デフォルトを選択なしにする
  (setq corfu-preselect 'prompt)
  (global-corfu-mode +1)
  (leaf cape :ensure t)
  (leaf cl-lib :ensure t)
  (setq org-message #'message)
  ;; (defun cape-dabbrev-check-other-buffers(&optional args)
  ;;   ;;(error "yes")
  ;;   (setq message-log-max 100000)
  ;;   ;;(funcall org-message "::: %s" major-mode)
  ;;   (redisplay t)
  ;;   (cl-remove-if-not
  ;;    (lambda (buf)
  ;;      (and (buffer-file-name buf)
  ;;                  (string-equal (file-name-extension (buffer-file-name buf)) "py")))
  ;;     (buffer-list))
  ;;   )
  (defun cape-dabbrev-check-other-buffers(&optional args)
    ;;(message "%s" major-mode)
   (setq message-log-max 100000)
   ;;(funcall org-message "::: %s" major-mode)
   ;;(funcall org-message "::: %s" (get-buffers-matching-mode major-mode))
   (mapcar #'get-buffer  
     (cl-remove-if-not 
       (lambda (buf) (equal (buffer-local-value 'major-mode buf) major-mode))
       (buffer-list))))
  (setq cape-dabbrev-check-other-buffers #'cape-dabbrev-check-other-buffers)

  ;;(remove-hook 'completion-at-point-functions nil)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  ;;(add-hook 'completion-at-point-functions #'cape-file)
  ;;(add-hook 'completion-at-point-functions #'cape-elisp-block)
  ;;(add-hook 'completion-at-point-functions #'cape-history)
  (add-hook 'completion-at-point-functions #'cape-keyword)
  ;;(add-hook 'completion-at-point-functions #'cape-tex)
  ;;(add-hook 'completion-at-point-functions #'cape-sgml)
  ;;(add-hook 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-hook 'completion-at-point-functions #'cape-abbrev)
  ;;(add-hook 'completion-at-point-functions #'cape-dict)
  ;;(add-hook 'completion-at-point-functions #'cape-elisp-symbol)
  ;;(add-hook 'completion-at-point-functions #'cape-line)
;;   (setq dabbrev-search-these-buffers-only 
;; (cl-remove-if
;;    (lambda (buf)
;;      (not (with-current-buffer buf
;;             (and buffer-file-name
;;                  (string-equal (file-name-extension buffer-file-name) "py")))))
;;    (buffer-list)))
  ;; (with-eval-after-load 'lsp-mode
  ;;   (setq lsp-completion-provider :none))
  (setq corfu-auto-prefix 1)
  ;;(setq corfu-auto t) 
  (setq cape-dabbrev-min-length 1)
  (setq corfu-auto-delay 0.0)
  ;;(company-dabbrev-ignore-buffers '((get-buffer "*scratch*")))

  (defun python-keywords()
    (interactive)
    (cape-capf-case-fold '("False" "None" "True" "and" "as" "assert" "break" "class" "continue"
      "def" "del" "elif" "else" "except" "finally" "for" "from" "global"
      "if" "import" "in" "is" "lambda" "nonlocal" "not" "or" "pass" "raise"
      "return" "try" "while" "with" "yield" "abs" "dict" "help" "min" "setattr"
      "all" "dir" "hex" "next" "slice" "any" "divmod" "id" "object" "sorted"
      "ascii" "enumerate" "input" "oct" "staticmethod" "bin" "eval" "int"
      "open" "str" "bool" "exec" "isinstance" "ord" "sum" "bytearray" "filter"
      "issubclass" "pow" "super" "bytes" "float" "iter" "print" "tuple"
      "callable" "format" "len" "property" "type" "chr" "frozenset" "list"
      "range" "vars" "classmethod" "getattr" "locals" "repr" "zip" "compile"
      "globals" "map" "reversed" "__import__")))
  (add-hook 'python-mode-hook
    (lambda ()
      (setq-local completion-at-point-functions
        (list (cape-capf-super #'cape-dabbrev 
          ;; Python専用のキーワード補完を追加
          (cape-capf-buster #'python-keywords))))))

  ;; RETで選択候補が入力されるのをOFF
  ;; →デフォルトで最上位が選択状態になるので、Enterで入力になると感覚と違う
  ;;   特にshellとかだとパスの入力で手間取る
  ;; (bind-keys :map corfu-map
  ;;     ("<RET>" . nil)
  ;;   )
;;   (add-hook 'python-mode-hook
;;     (lambda ()
;; (setq-local completion-at-point-functions
;;   (mapcar #'cape-company-to-capf
;;     (list #'company-files #'company-keywords #'company-dabbrev)))))
)


;; 2024/06/19 corfuでもデフォルトを選択なしにできそうなのでやっぱcorfuを試す
;; (leaf company
;;   :ensure t
;;   :config
;;   ;; 全バッファで有効にする
;;   (global-company-mode)
;;   :config
;;   (setq completion-ignore-case t)
;;   (setq company-idle-delay 0)                    ;; 待ち時間を0秒にする
;;   (setq company-minimum-prefix-length 1)         ;; 補完できそうな文字が2文字以上入力されたら候補を表示
;;   (setq company-selection-wrap-around t)         ;; 候補の一番下でさらに下に行こうとすると一番上に戻る

;;   ;; デフォルトを選択なしに
;;   (setq-default company-selection-default nil)
;;   (setq-default company-selection nil)
;;   ;; 選択なし状態のreturnを通常入力に
;;   (bind-keys :map company-active-map
;;     ("<return>" .
;;       (lambda (&rest _)
;;         (interactive)
;;         (if (not company-selection)
;;           (company-abort)
;;           (company-complete)
;;         ))
;;       ))
  
;;   ;; 利用頻度が高いものを候補の上に表示する
;;   ;;(setq company-transformers '(company-sort-by-occurrence company-sort-by-backend-importance))
;;   ) 

;; (leaf doom-themes
;;   :el-get ( doomemacs/themes
;;      :type github
;;      :pkgname "doomemacs/themes"
;;   )
;;   :ensure t
;; )

(leaf style
  :init
  ;; Klee
  (if (not (file-exists-p "~/.fonts/KleeOne-Regular.ttf"))
    (let ((url "https://github.com/fontworks-fonts/Klee/raw/master/fonts/ttf/KleeOne-Regular.ttf"))
      (url-copy-file url "/tmp/KleeOne-Regular.ttf" t)
      (shell-command "mkdir -p ~/.fonts")
      (shell-command "cp /tmp/KleeOne-Regular.ttf ~/.fonts/.")
    )
  )
  
  ;; ZenKurenaido
  (if (not (file-exists-p "~/.fonts/ZenKurenaido-Regular.ttf"))
    (let ((url "https://github.com/googlefonts/zen-kurenaido/raw/main/fonts/ttf/ZenKurenaido-Regular.ttf"))
      (url-copy-file url "/tmp/ZenKurenaido-Regular.ttf" t)
      (shell-command "mkdir -p ~/.fonts")
      (shell-command "cp /tmp/ZenKurenaido-Regular.ttf ~/.fonts/.")
    )
  )
  
  ;; あずきフォント
  (if (not (file-exists-p "~/.fonts/azuki.ttf"))
    (let ((url "http://azukifont.com/font/azukifont121.zip"))
      (url-copy-file url "/tmp/azukifont121.zip" t)
      (shell-command "unzip -o /tmp/azukifont121.zip -d /tmp/azuki")
      ;; ttfをフォントフォルダにコピー
      (shell-command "mkdir -p ~/.fonts")
      (shell-command "cp /tmp/azuki/azukifont121/azuki.ttf ~/.fonts/.")
    )
  )
  
  ;; あんずもじ
  (if (not (file-exists-p "~/.fonts/APJapanesefontT.ttf"))
    (let ((url "http://www8.plala.or.jp/p_dolce/font/ap2.zip"))
      (url-copy-file url "/tmp/ap2.zip" t)
      (shell-command "unzip -Osjis /tmp/ap2.zip -d /tmp/ap2")
      ;; ttfをフォントフォルダにコピー
      (shell-command "cp /tmp/あんずもじ等幅/APJapanesefontT.ttf /usr/local/share/fonts/.")
      ;; 解凍時の文字化けが-Osjisでも回避できないので
      (shell-command "mkdir -p ~/.fonts")
      (shell-command-to-string "bash -c \"cp /tmp/ap2/*/APJapanesefontT.ttf ~/.fonts/. \"")
    )
  )


  ;; もぎはペン
  (if (not (file-exists-p "~/.fonts/mogihaPen.ttf"))
    (let ((url "https://ahito.com/item/desktop/font/mogihaPen/mogihaPen_ver121.zip"))
      (url-copy-file url "/tmp/mogihaPen_ver121.zip" t)
      (shell-command "unzip /tmp/mogihaPen_ver121.zip -d /tmp/mogihaPen_ver121")
      ;; ttfをフォントフォルダにコピー
      (shell-command "mkdir -p ~/.fonts")
      (shell-command "cp /tmp/mogihaPen_ver121/mogihaPen.ttf ~/.fonts/.")
    )
  )

  ;; りい手書き
  (if (not (file-exists-p "~/.fonts/RiiTN_R.otf"))
    (let ((url "https://aoirii.babyblue.jp/font/riitn/riitnr.zip"))
      (url-copy-file url "/tmp/riitnr.zip" t)
      (shell-command "unzip /tmp/riitnr.zip -d /tmp/riitnr")
      ;; ttfをフォントフォルダにコピー
      (shell-command "mkdir -p ~/.fonts")
      (shell-command "cp /tmp/riitnr/riitnr/RiiTN_R.otf ~/.fonts/.")
    )
  )

  :config

  ;; githubテーマ
  (leaf github-theme.el
    ;; ZenKurenaido
    ;;:ensure t
    :config
    (let (
           (local-file (locate-user-emacs-file "lisp/github-theme.el"))
           (url "https://raw.githubusercontent.com/philiparvidsson/GitHub-Theme-for-Emacs/master/github-theme.el"))
      (unless (file-exists-p local-file)
        (url-copy-file url local-file t))
      (add-to-list 'load-path (locate-user-emacs-file "lisp"))
      (load "github-theme.el")
      ;;(load-theme 'github t)
      ))
  
  (leaf nordtheme
    :el-get (
       nordtheme/emacs
       :type github               
       :pkgname "nordtheme/emacs"
       ;;:branch "main"
       )
    )
  (require 'nord-theme)
  

    ;;(load-theme 'deeper-blue t)
    ;;(load-theme 'wombat t)
    (load-theme 'github t)
    ;; 日本語フォントを設定。フォント名はfc-queryで調べる
    ;;(set-fontset-font t 'japanese-jisx0208 "あずきフォント")
    (set-fontset-font t 'japanese-jisx0208 "azuki_font")
    ;; (set-fontset-font t 'japanese-jisx0208 "Klee One")
    ;; (set-fontset-font t 'japanese-jisx0208 "Zenkurenaido")
    ;; (set-fontset-font t 'japanese-jisx0208 "MogihaPenFont")
    ;;(set-fontset-font t 'japanese-jisx0208 "APJapanesefontT")
    ;; (set-fontset-font t 'japanese-jisx0208 "RiiTegakiN-R")
    (set-frame-font "NotoMono 10")
    (setq face-font-rescale-alist '(
             (".*Zen Kurenaido.**" . 1.2) ;; Zenkurenaido
             (".*APJapanesefont.*" . 1.3) ;; あんずもじ
             (".*azuki.*" . 1.2)          ;; あずきフォント
             (".*Klee.*" . 1.2)          ;; Klee One
             (".*MogihaPenFont.*" . 1.2)          ;;mogiha
             (".*RiiTegakiN.*" . 1.2)          ;;りい手書き
             ))
  (set-face-underline 'hl-line nil)

  ;; nord-themeでhelm-find-fileが背景白になって見にくい
  (defun my/helm-customize-for-nord-theme (&rest _)
    "Customize Helm faces when loading Nord theme."
    (when (custom-theme-enabled-p 'nord)
      (custom-set-faces
       '(helm-source-header
         ((t (:background "#4C566A" :foreground "#ECEFF4" :weight bold :height 1.3 :family "Sans Serif"))))
       '(helm-selection ((t (:background "#434C5E" :foreground "#E5E9F0"))))
       '(helm-match ((t (:foreground "#81A1C1" :background "#2E3440" :weight bold))))
       '(helm-visible-mark ((t (:foreground "#2E3440" :background "#8FBCBB"))))
        '(helm-ff-file ((t (:background "#2E3440" :foreground "#ECEFF4")))))
      (custom-set-faces
        '(ivy-current-match ((t (:background "#4C566A" :foreground "#ECEFF4" :extend t))))
        '(ivy-minibuffer-match-face-1 ((t (:background "#4C566A" :foreground "#D8DEE9" :weight bold))))
        '(ivy-minibuffer-match-face-2 ((t (:background "#434C5E" :foreground "#D8DEE9" :weight bold))))
        '(ivy-minibuffer-match-face-3 ((t (:background "#3B4252" :foreground "#D8DEE9" :weight bold))))
        '(ivy-minibuffer-match-face-4 ((t (:background "#2E3440" :foreground "#D8DEE9" :weight bold))))
        '(ivy-current-match ((t (:background "#71206a" :foreground "#E8EEF9" :extend t))))
        )
      (custom-set-faces
        '(sh-quoted-exec ((t (:foreground "#FFB0B0" :extend t))))
        '(sh-heredoc     ((t (:foreground "#FF6dad" :extend t)))))
      (custom-set-faces
        '(ediff-even-diff-A   ((t (:background "#464c58" :extend t))))
        '(ediff-even-diff-B   ((t (:background "#464c58" :extend t))))
        '(ediff-odd-diff-A   ((t (:background "#464c58" :extend t))))
        '(ediff-odd-diff-B   ((t (:background "#464c58" :extend t))))
        '(ediff-current-diff-A   ((t (:background "#363c48" :foreground "#ECEFF4" :extend t))))
        '(ediff-current-diff-B   ((t (:background "#363c48" :foreground "#ECEFF4" :extend t)))))
      (custom-set-faces
        '(magit-diff-file-heading-highlight   ((t (:background "#363c48" :foreground "#ECEFF4" :extend t)))))
      (custom-set-faces
        '(font-lock-comment-face             ((t (:foreground "#B080B0" :extend t))))
        '(font-lock-comment-delimiter-face   ((t (:foreground "#B080B0" :extend t))))
        '(font-lock-doc-face                 ((t (:foreground "#B080B0" :extend t))))
        '(shadow                   ((t (:foreground "#7C869A" :extend t))))
        ;;'(default                  ((t (:background "#2E3440" :foreground "#D8DEE9" :extend t))))
        '(default                  ((t (:background "#1E2430" :foreground "#E8EEF9" :extend t))))
        )
      (custom-set-faces
        '(whitespace-tab             ((t (:foreground "#808080" :extend t))))
        )
      )))
  (advice-add 'load-theme :after #'my/helm-customize-for-nord-theme)
  (load-theme 'nord t)
  
)

(leaf mozc
  :ensure t
  :init
  :config
  (leaf mozc-popup 
    :ensure t
    :init
    (leaf posframe :ensure t) ;; ematcs29と相性が悪い？
    :config
    (require 'mozc-popup)
    (setq mozc-candidate-style 'popup)
  )
  ;;(leaf mozc-cand-posframe :ensure t)
  ;;(setq mozc-candidate-style 'echo-area)
  ;;(setq mozc-candidate-style 'overlay)
  (setq default-input-method 'japanese-mozc)
  
  ;; ターミナルモードで半角スペースがうてない問題の対処
  (defun my/mozc-spc()
    (interactive)
    (if mozc-preedit-in-session-flag
      (mozc-handle-event 32)
      (insert " ")
      )
  )
  (define-key mozc-mode-map (kbd "SPC") 'my/mozc-spc)
)

(leaf copilot
  :el-get (
    copilot-emacs/copilot.el 
    :type github               
    :pkgname "copilot-emacs/copilot.el"
    ;;:branch "main"
    )

  :init
  (leaf f :ensure t)
  (leaf editorconfig :ensure t)
  (leaf jsonrpc :ensure t)
  :config
;;  (setq copilot-install-dir "/home/owner/copilot")
  (let (
    (nodepath (locate-user-emacs-file "bin/node"))
    (shell-command (format "mkdir -p %s" (locate-user-emacs-file "bin/node")))
    (s "\
#!/bin/sh
ssh localhost ~/bin/node $@
")) 
    (with-temp-file nodepath
      (insert s)
    )
    (shell-command (format "chmod +x %s" nodepath))
    ;;(start-process "aaa" (current-buffer) "/tmp/my-script.sh")
    (setq copilot-node-executable nodepath)
)
  (setenv "PATH" (concat (locate-user-emacs-file "bin") ":" (getenv "PATH")))
  (let (
    (npmpath (locate-user-emacs-file "bin/npm"))
    (s "\
#!/bin/sh
ssh localhost ~/bin/npm $@
")) 
    (with-temp-file npmpath
      (insert s)
    )
    (shell-command (format "chmod +x %s" npmpath))
    ;;(start-process "aaa" (current-buffer) "/tmp/my-script.sh")
  (setq exec-path (append exec-path (list (locate-user-emacs-file "bin"))))
  ;;(copilot-install-server)
)
  (require 'copilot)
  (bind-keys :map copilot-completion-map
      ;;("TAB" . copilot-accept-completion-by-word)
      ("C-g" . copilot-clear-overlay)
      ;;("C-o" . copilot-accept-completion-by-line)
      ("C-o" . copilot-accept-completion-by-word)
      ("C-l" . copilot-accept-completion-by-line)
      ("C-n" . copilot-next-completion)
      ("C-p" . copilot-previous-completion)
  )
  ;; ;; copilotとcorfuの同居。C-gでcorfuだけ閉じる
  ;; (bind-keys :map corfu-map
  ;;    ("C-g" .      (lambda () (interactive)
  ;;      (corfu-quit)
  ;;      ;; copilot-modeが有効だったら
  ;;      (if (bound-and-true-p copilot-mode)
  ;;        (copilot-complete)))))
  ;; (define-key copilot-mode-map (kbd "C-o") 'copilot-complete)
  ;;(global-copilot-mode 1)

)

(leaf tramp
  :ensure t
  :config
  ;; ホストにshellでつなぐ
  (defun ssh-host (n)
    (interactive "p")
    (let* (
        (tramp-mode t)
        (default-directory (format "/ssh:%s@localhost:~" (user-login-name))))
        (shell (concat "*shell<" (number-to-string n) ">*"))
      )
  )
  (provide 'ssh-host)

  ;; 2024/05/19 emacsのdocker化に伴い、/home配下のときはtrampを剥がす
  (defun my/strip-tramp(f &rest args)
     (if (string-match "^/s.\+:.\+@localhost:/home" default-directory)
       (let*(
        (tramp-mode t)
           (default-directory 
             (replace-regexp-in-string "^/s.\+:.\+@localhost:" "" default-directory))
           )
         (apply f args)
       )
       (apply f args)
     )
  )
  (advice-add    'helm-find-files  :around #'my/strip-tramp)
  (advice-add    'counsel-find-file  :around #'my/strip-tramp)
  (advice-add    'buffer-file-name :around #'my/strip-tramp)
  
  (defun my/add-tramp(f &rest args)
    (if (string-match "/home" default-directory)
      (let(
          (default-directory 
            (concat "/scp:" (user-login-name)  "@localhost:" default-directory)))
        (apply f args))
      (apply f args)))
  (advice-add    'executable-interpret :around #'my/add-tramp)
)

(leaf magit
  :ensure t
  :config
  (setq lexical-binding t) ;; clojureを有効にする
  (defun my/github-username()
    (shell-command-to-string "awk '{print $1}' ~/private/github"))

  (defun my/github-password(&optional args)
    (shell-command-to-string "awk '{print $2}' ~/private/github"))
  (setf magit-process-find-password-functions #'my/github-password)
  (defun around-magit-process-username-prompt (orig-fun &rest args)
    "Advice to temporarily replace 'read-string' with a custom lambda function in magit-process-username-prompt."
    (cl-letf (((symbol-function 'read-string)
                (lambda (prompt &optional initial-input history default-value inherit-input-method)
                  (message "Custom lambda function triggered!")
                  ;; ここに特定の文字列を返すロジックを記述します。
                  (my/github-username))))
      (apply orig-fun args)))

  (advice-add 'magit-process-username-prompt :around #'around-magit-process-username-prompt)

  ;; (advice-add 'magit-push-current-to-pushremote :around 'setup-magit-push-advice)
  ;; (advice-remove 'magit-push-current-to-pushremote  'setup-magit-push-advice)
  ;;(advice-add 'magit-git-push :around 'setup-magit-push-advice)
  ;;(advice-add 'magit-call-git :around 'setup-magit-push-advice)
  ;; (advice-remove 'magit-git-push  'setup-magit-push-advice)
  )

;; なんかよくわからんので一旦OFF
;; (leaf orderless
;;   :ensure t
;;   :init
;;   (setq completion-styles '(orderless basic)
;;     completion-category-defaults nil
;;     completion-category-overrides nil)

;;   :config
;;   ;; migemoでローマ字検索を有効にする
;;   (leaf migemo
;;     :ensure t
;;     :config
;;     (defun orderless-migemo (component)
;;       (let ((pattern (downcase (migemo-get-pattern component))))
;;         (condition-case nil
;;           (progn (string-match-p pattern "") pattern)
;;           (invalid-regexp nil))))
;;     (add-to-list 'orderless-matching-styles 'orderless-migemo))

;;   :after corfu
;;   ;; corfuはorderless-flexで絞り込む
;;   (with-eval-after-load 'corfu
;;     (add-hook 'corfu-mode-hook
;;       (lambda ()
;;         (setq-local orderless-matching-styles '(orderless-flex))))))


;; ivy corfu の並び準を記憶する
(leaf prescient
  :ensure t
  :config
  (require 'prescient)
  (setq prescient-aggressive-file-save t)
  (prescient-persist-mode +1)
  (leaf ivy-prescient
    :ensure t
    :config
    (ivy-prescient-mode 1)

    (setq ivy-prescient-retain-classic-highlighting t)
    (setq prescient-sort-full-matches-first t)

    (shell-command (format "mkdir -p %s" (locate-user-emacs-file "cache")))
    (setq prescient-save-file (locate-user-emacs-file "cache/prescient-save.el"))

    ;; yank-popのみprescientを無効にする
    (defun my/disable-ivy-prescient-for-counsel-yank-pop (fun &rest args)
      "Temporarily disable `ivy-prescient' for `counsel-yank-pop'."
      (let((result))
        (ivy-prescient-mode -1)
        (unwind-protect
          (setq result (apply fun args))
          (ivy-prescient-mode 1))
        result
        ))

    (advice-add 'counsel-yank-pop :around #'my/disable-ivy-prescient-for-counsel-yank-pop)
    ;;(advice-remove 'counsel-yank-pop  #'my/disable-ivy-prescient-for-counsel-yank-pop)
    )
  
  ;; (leaf corfu-prescient
  ;;   :ensure t
  ;;   :after corfu
  ;;   :config
  ;;   (require 'corfu-prescient)
  ;;   ;; (with-eval-after-load 'orderless
  ;;   ;;   (setq corfu-prescient-enable-filtering nil))
  ;;   (corfu-prescient-mode +1))
  )


(leaf migemo
  :ensure t
  :config 
  (require 'migemo)

  ;; Migemoの設定
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))

  ;; 辞書の場所（ここでは確認したパスに置き換えてください）
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (migemo-init)
  (leaf ivy-with-migemo
    :ensure t
    :config
    (require 'ivy-with-migemo)
    (setq ivy-with-migemo-enable-command ; migemo対応の対象となるコマンドを設定
      '(swiper
         swiper-isearch
         counsel-recentf
         counsel-rg))
    (setq migemo-options '("--quiet" "--nonewline" "--emacs"))
    (migemo-kill) ; migemoシャットダウン
    (migemo-init) ; migemo再起動
    (global-ivy-with-migemo-mode 1) ; 有効
    )
  ;; (leaf ivy-migemo
  ;;   :ensure t
  ;;   :config
  ;;   (require 'ivy-migemo)
    
  ;;   ;; ivyのデフォルトのマッチング関数を設定
  ;;   (setq ivy-re-builders-alist
  ;;     '((t . ivy--regex-plus)
  ;;        (swiper . ivy--regex-plus)
  ;;        (counsel-find-file . ivy--regex-plus)
  ;;        (t . ivy-migemo-re-builder)))

  ;;   ;; migemoを使用するコマンドを追加（例：counsel-M-x, counsel-find-file）
  ;;   ;;(add-to-list 'ivy-migemo-functions-alist '(counsel-M-x . ivy-migemo-get-pattern))
  ;;   (add-to-list 'ivy-migemo-functions-alist '(swiper . ivy-migemo-get-pattern))

  ;;   )
  )

(leaf jump-back
  :config
  (load "jump-back.el")
  )


(leaf dimmer
  :ensure t
  :config
  ;;(require 'dimmer)
  (dimmer-mode 1)
  (setq dimmer-fraction 0.3)
  (setq dimmer-exclusion-regexp "^\\*helm.*\\|\\*Minibuf-.*|\\*corfu\\*.*|\\*ivy.*")

  ;; corfuの補完で非アクティブ化されるのを防ぐ
  (advice-add 'dimmer-dim-buffer :around
    (lambda (original-func BUF FRAC &rest args)
      (interactive "P")
      ;;(message "BUF:%s" BUF)
      (unless
        (or
            (string-match-p "\\*corfu\\*" (buffer-name (current-buffer)))
            ;; ivyのポップアップが暗くなるのを防ぐ
            (string-match-p "\\*ivy-.*" (buffer-name (current-buffer)))
            (string-match-p "\\*ivy-.*" (buffer-name BUF))
            (string-match-p "\\*helm.*" (buffer-name BUF))
            (string-match-p "\\*helm.*" (buffer-name (current-buffer)))
                )
        (funcall original-func BUF FRAC)
        )
      ;;(message "BUF:%s current:%s" BUF (current-buffer))
      )))

;; 
(leaf pulsar
  :ensure t
  :config
  (pulsar-global-mode +1)
  (setq pulsar-pulse t)
  (setq pulsar-delay 0.055)
  (setq pulsar-iterations 10)
  (setq pulsar-face 'pulsar-magenta)
  (setq pulsar-highlight-face 'pulsar-magenta)
  (advice-add 'other-window :after
    (lambda (&rest args)
      (interactive)
       (pulsar-pulse-line)
       ;;(pulsar-highlight-dwim)
      )
    )

  (add-hook 'window-buffer-change-hook
     (lambda (&rest args)
       (interactive)
       (pulsar-pulse-line)
       ;;(pulsar-pulse-dwim)
       ))
  )

(leaf chatgpt-shell
  :ensure t
  :config
  (setq chatgpt-shell-openai-key 
    (shell-command-to-string "cat ~/private/openai"))

  ;; shellを保存してクリアする
  (defun my/chatgpt-shell-save-and-clear()
    (interactive)
    (let(
      (shell-maker--file 
        (expand-file-name 
              (format-time-string "~/transcripts/%Y%m%d%H%M%S.txt")))
        )
      (chatgpt-shell-save-session-transcript)
      (chatgpt-shell-clear-buffer))
    )
  )



(leaf my/markdown-preview
  :require web-server
  ;;:ensure t
  :config
  (defvar my/html-file-path (locate-user-emacs-file "files/katex.html"))
  (defvar my/bashe-html-file-path (locate-user-emacs-file "files/base.html"))
  (defvar my/markdown-html-file-path (locate-user-emacs-file "files/default.html")
    "Path to the HTML file to serve.")

  (defun my/serve-html-file (proc)
    "Serve an HTML file for GET requests."
    (with-temp-buffer
      ;;(insert-file-contents my/html-file-path)
      (insert (my/server-html-string))
      (ws-response-header proc 200 '("Content-Type" . "text/html; charset=UTF-8"))
      ;;(ws-response-header proc 200 '("Content-Type" . "text/plain"))
      (process-send-string proc (buffer-string))
      ;;(process-send-region proc (point-min) (point-max))
      ;;(process-send-string proc "hello")
      ))
      ;;(process-send-region proc (point-min) (point-max))))
  
  (defun my/server-html-string()
    (with-temp-buffer
      (insert-file-contents my/bashe-html-file-path)
        (goto-char (point-min))
      ;; SSIタグを解析し、ファイル内容を挿入

        (let* (
            ;;(include-file (match-string 1))
            (contents
              (with-temp-buffer
                (insert-file-contents my/markdown-html-file-path)
                (buffer-string))))
          (if (re-search-forward "<!-- #include file -->" nil t)
            (replace-match (replace-regexp-in-string "\\\\" "\\\\\\\\" contents)))
          (buffer-string))
      ;;(buffer-string)
      ))

  (defun my/serve-buffer-contents (proc buffer-name)
    "Serve the contents of a buffer for POST requests."
    (if-let ((buffer (get-buffer buffer-name)))
      (with-current-buffer buffer
          (ws-response-header proc 200 '("Content-Type" . "text/plain"))
          (process-send-string proc (buffer-string)))
      (ws-send-404 proc)))

  (setq svr (ws-start
   '(((:POST . ".*") .
       (lambda (request)
        (with-slots (process headers) request
          ;;(let ((buffer-name (cdr (assoc "buffer" (ws-parse-qs (cdr (assoc "Content-Length" headers)))))))
          (let ((buffer-name (cdr (assoc "buffer" headers))))
          ;;(let ((buffer-name ""))
            (if buffer-name
              (my/serve-buffer-contents process buffer-name)
              (ws-send-404 process))))
          ))
     ((:GET . ".*") .
       (lambda (request)
        (with-slots (process) request
          (my/serve-html-file process)
          ))))
              9001))
  ;;(ws-stop svr)


  (require 'xwidget)
  (defun my/markdown-live-preview-refresh(&rest _args)
    (interactive)
    (let ((js (format "sendPostRequest(\"%s\");" (buffer-name))))
      (when my/markdown-live-preview-buffer
        (with-current-buffer my/markdown-live-preview-buffer
          (xwidget-webkit-execute-script (xwidget-webkit-current-session) js)
          ))))
  (provide 'my/markdown-live-preview-refresh)
  

  (defvar-local my/markdown-live-preview-buffer nil)
  (defun my/markdown-live-preview ()
    (interactive)
    (let ((buf (current-buffer)))
      (xwidget-webkit-new-session
        (format "http://localhost:9001/?buffer=%s"
          (replace-regexp-in-string " " "%20" (buffer-name))))
      (let ((browser-buffer (current-buffer)))
        (with-current-buffer buf
          (setq-local my/markdown-live-preview-buffer browser-buffer)))
    ))
  (provide 'my/markdown-live-preview)


  ;; poly-markdown対応
  (advice-add 'my/markdown-live-preview :around
    (lambda (f &rest args)
      (with-current-buffer (pm-base-buffer)
        ;; ローカル変数にフラグをセット
        (apply f args))))
  
  (advice-add 'my/markdown-live-preview-refresh :around
    (lambda (f &rest args)
      (with-current-buffer (pm-base-buffer)
        ;; ローカル変数にフラグをセット
        (apply f args))))

  ;; save-bufferでwebkitをリロード
  (advice-add 'save-buffer :after #'my/markdown-live-preview-refresh)
  )
