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

  ;; lispのインデント設定
  (setq-default lisp-indent-offset 2)
  (setq-default indent-tabs-mode nil)

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
  (leaf company :ensure t)
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
  :after corfu
  :config
  (let (
      (local-file (locate-user-emacs-file "lisp/unemacsesque-search.el"))
      (url "https://raw.githubusercontent.com/oonishi870/unemacsesque-search/main/unemacsesque-search.el")
    )
    (unless (file-exists-p local-file)
      (url-copy-file url local-file t))
    (load local-file)

    (require 'corfu)
    ;; 検索ワードをcorfuで補完する
    (defun my/unemacslike-search-completion()
      (if unemacslike-search-mode
        (progn
          ;; (print (current-buffer))
          ;; (print (window-buffer (minibuffer-selected-window)))
          (corfu-mode 1)
          (setq-local completion-at-point-functions
            (with-current-buffer (window-buffer (minibuffer-selected-window))
              completion-at-point-functions))
          
          (setq-local cape-dabbrev-check-other-buffers
            (lambda (&optional args) 
              (with-current-buffer (window-buffer (minibuffer-selected-window))
                (cape-dabbrev-check-other-buffers args))))
          )))

    ;;(remove-hook 'unemacslike-search-mode-hook #'my/unemacslike-search-completion)
    (add-hook 'unemacslike-search-mode-hook #'my/unemacslike-search-completion 1)
    ))

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
  (bind-keys :map overriding-minor-mode-map
      ("C-b" . nil) ;; 2018/06/27 tmux用
      ( "C-z" . undo-tree-undo)
      ( "C-y" . undo-tree-redo)
      ( "C-f" . unemacslike-search)
      ( "C-b" . isearch-forward)
      ( "C-r" . isearch-backward)
      ( "C-s" . save-buffer)
      ( "C-t" . (lambda (&optional arg) (interactive "P") (if (null arg) (other-window  1) (other-window -1))))
      
      ( "C-<tab>" . other-window)
      ( "C-<iso-lefttab>" .(lambda ()(interactive) (other-window -1)))
      ( "C-h" . er/expand-region)    
      ( "C-k" . nil)
      ;; ( "C-k C-n" . helm-mini)
      ;; ( "C-k C-n" . counsel-switch-buffer)
      ( "C-k C-n" . my/counsel-mini)
      ;;( "C-k C-f" . helm-find-files)
      ( "C-k C-f" . counsel-find-file)
      ;; ( "C-k C-l" . helm-M-x)
      ( "C-k C-l" . counsel-M-x)
      ( "C-k C-w" . kill-buffer)
      ( "C-k C-c" . comment-dwim)
      ;; ( "C-k C-j" . goto-line)
      ( "C-k C-j" . counsel-company)
      ( "C-k C-d" . my/smart-split-window)
      ( "C-k C-k C-d" . delete-window)
      ;;( "C-k C-o") . switch-to-prev-buffer)
      ;;( "C-k C-p") . switch-to-next-buffer)
      ;;( "C-k C-h") . swap-buffers)
      ;;( "C-k C-u") . helm-swoop)
      ( "C-k C-u" .
        (lambda (&optional args)
          (interactive)
          (let(
              (s (if (region-active-p)
                  (buffer-substring-no-properties (region-beginning) (region-end)))))
            (set-mark nil)
            (swiper (or s " ")))))
      ;; ( "C-k C-o" . helm-show-kill-ring)
      ( "C-k C-o" . counsel-yank-pop)
      ( "C-k C-t" . my/turn-buffer)
      ( "C-k C-k C-t" . (lambda ()(interactive) (my/turn-buffer 1)))
      ( "C-k C-;" . helm-comint-input-ring)
      ( "C-k C-k C-s" . describe-key)
;;      ( "C-k C-<left>" . split-window-left)
      ;; ( "C-k C-<right>" . split-window-right)
      ;; ( "C-k C-<down>" . split-window-below)
;;      ( "C-k C-<up>" . split-window-)
      ;;("TAB" . my/indent)
      ;;("TAB" . nil)
      ;;( "C-;" . copilot-accept-completion)
  )
  (overriding-minor-mode 1) ;; 自動で有効にする場合
))

(leaf corfu
  :ensure t  ; MELPAからcorfuをインストール
  :custom ((corfu-cycle . t)  ; 候補リストの循環を有効にする
           (corfu-auto . t)  ; 自動補完を有効にする
           )
  ;;:global-minor-mode 
  :init
  ;; (setq dabbrev-check-other-buffers nil)
  ;; (setq dabbrev-check-all-buffers nil)
  ;;
  (global-corfu-mode +1)
  (leaf cape :ensure t)
  (leaf cl-lib :ensure t)
  (setq org-message #'message)
;;   (defun cape-dabbrev-check-other-buffers(&optional args)
;; ;;(error "yes")
;;   (setq message-log-max 100000)
;;   (funcall org-message "::: %s" major-mode)
;;   (redisplay t)
;; (cl-remove-if-not
;;    (lambda (buf)
;;      (and (buffer-file-name buf)
;;                  (string-equal (file-name-extension (buffer-file-name buf)) "py")))
;;    (buffer-list)))
  (defun cape-dabbrev-check-other-buffers(&optional args)
    ;;(message "%s" major-mode)
   (setq message-log-max 100000)
   (funcall org-message "::: %s" major-mode)
   ;;(funcall org-message "::: %s" (get-buffers-matching-mode major-mode))
   (mapcar #'get-buffer  
     (cl-remove-if-not 
       (lambda (buf) (equal (buffer-local-value 'major-mode buf) major-mode))
       (buffer-list))))
  (setq cape-dabbrev-check-other-buffers #'cape-dabbrev-check-other-buffers)

  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  ;;(add-hook 'completion-at-point-functions #'cape-history)
  (add-hook 'completion-at-point-functions #'cape-keyword)
  ;;(add-hook 'completion-at-point-functions #'cape-tex)
  ;;(add-hook 'completion-at-point-functions #'cape-sgml)
  ;;(add-hook 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-hook 'completion-at-point-functions #'cape-abbrev)
  (add-hook 'completion-at-point-functions #'cape-dict)
  ;;(add-hook 'completion-at-point-functions #'cape-elisp-symbol)
  ;;(add-hook 'completion-at-point-functions #'cape-line)
;;   (setq dabbrev-search-these-buffers-only 
;; (cl-remove-if
;;    (lambda (buf)
;;      (not (with-current-buffer buf
;;             (and buffer-file-name
;;                  (string-equal (file-name-extension buffer-file-name) "py")))))
;;    (buffer-list)))
  :config
  ;; (with-eval-after-load 'lsp-mode
  ;;   (setq lsp-completion-provider :none))
  (setq corfu-auto-prefix 1)
  ;;(setq corfu-auto t) 
  (setq cape-dabbrev-min-length 3)
  (setq corfu-auto-delay 0.0)
  ;;(company-dabbrev-ignore-buffers '((get-buffer "*scratch*")))

  ;; (defun python-keywords()
  ;;   (interactive)
  ;;   (cape-capf-case-fold '("False" "None" "True" "and" "as" "assert" "break" "class" "continue"
  ;;     "def" "del" "elif" "else" "except" "finally" "for" "from" "global"
  ;;     "if" "import" "in" "is" "lambda" "nonlocal" "not" "or" "pass" "raise"
  ;;     "return" "try" "while" "with" "yield" "abs" "dict" "help" "min" "setattr"
  ;;     "all" "dir" "hex" "next" "slice" "any" "divmod" "id" "object" "sorted"
  ;;     "ascii" "enumerate" "input" "oct" "staticmethod" "bin" "eval" "int"
  ;;     "open" "str" "bool" "exec" "isinstance" "ord" "sum" "bytearray" "filter"
  ;;     "issubclass" "pow" "super" "bytes" "float" "iter" "print" "tuple"
  ;;     "callable" "format" "len" "property" "type" "chr" "frozenset" "list"
  ;;     "range" "vars" "classmethod" "getattr" "locals" "repr" "zip" "compile"
  ;;     "globals" "map" "reversed" "__import__")))
  ;; (add-hook 'python-mode-hook
  ;;   (lambda ()
  ;;     (setq-local completion-at-point-functions
  ;;       (list (cape-capf-super #'cape-dabbrev 
  ;;         ;; Python専用のキーワード補完を追加
  ;;         (cape-capf-buster #'python-keywords))))))

;;   (add-hook 'python-mode-hook
;;     (lambda ()
;; (setq-local completion-at-point-functions
;;   (mapcar #'cape-company-to-capf
;;     (list #'company-files #'company-keywords #'company-dabbrev)))))
)

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
    :ensure t
    :config
    (let (
           (local-file (locate-user-emacs-file "lisp/github-theme.el"))
           (url "https://raw.githubusercontent.com/philiparvidsson/GitHub-Theme-for-Emacs/master/github-theme.el"))
      (unless (file-exists-p local-file)
        (url-copy-file url local-file t))
      (add-to-list 'load-path (locate-user-emacs-file "lisp"))
      (load "github-theme.el")
      (load-theme 'github t)
      ))

    ;;(load-theme 'deeper-blue t)
    (load-theme 'wombat t)
    ;; 日本語フォントを設定。フォント名はfc-queryで調べる
    ;;(set-fontset-font t 'japanese-jisx0208 "あずきフォント")
    ;;(set-fontset-font t 'japanese-jisx0208 "azuki_font")
    ;; (set-fontset-font t 'japanese-jisx0208 "Klee One")
    ;; (set-fontset-font t 'japanese-jisx0208 "Zenkurenaido")
    ;; (set-fontset-font t 'japanese-jisx0208 "MogihaPenFont")
    (set-fontset-font t 'japanese-jisx0208 "APJapanesefontT")
    ;; (set-fontset-font t 'japanese-jisx0208 "RiiTegakiN-R")
    (set-frame-font "NotoMono 11")
    (setq face-font-rescale-alist '(
             (".*Zen Kurenaido.**" . 1.2) ;; Zenkurenaido
             (".*APJapanesefont.*" . 1.2) ;; あんずもじ
             (".*azuki.*" . 1.2)          ;; あずきフォント
             (".*Klee.*" . 1.2)          ;; Klee One
             (".*MogihaPenFont.*" . 1.2)          ;;mogiha
             (".*RiiTegakiN.*" . 1.2)          ;;りい手書き
             ))
    (set-face-underline 'hl-line nil)
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
      ("TAB" . copilot-accept-completion-by-word)
      ("C-g" . copilot-clear-overlay)
      ("C-o" . copilot-accept-completion-by-line)
      ("C-n" . copilot-next-completion)
      ("C-p" . copilot-previous-completion)
  )
  ;; copilotとcorfuの同居。C-gでcorfuだけ閉じる
  (bind-keys :map corfu-map
     ("C-g" .      (lambda () (interactive)
       (corfu-quit)
       ;; copilot-modeが有効だったら
       (if (bound-and-true-p copilot-mode)
         (copilot-complete)))))
 (define-key copilot-mode-map (kbd "C-o") 'copilot-complete)


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
  (defun create-read-string-advice (regex fixed-input)
    "Create an advice function that returns FIXED-INPUT if the prompt matches REGEX.
この関数は、指定された正規表現 REGEX に minibuffer のプロンプトが一致した場合に、
FIXED-INPUT を返すアドバイス関数を生成します。"
    (lambda (orig-fun prompt &optional initial-input history default-value inherit-input-method)
      "このラムダ関数は、元の関数と同じ引数を取り、プロンプトが正規表現に一致するかチェックします。"
      (if (string-match-p regex prompt)
        (progn
          (message "Prompt: %s\nIgnoring user input and returning: %s" prompt fixed-input)
          ;;"プロンプトが正規表現に一致した場合、ユーザー入力を無視し、固定値を返します。"
          fixed-input)
        (apply orig-fun prompt initial-input history default-value inherit-input-method))
      ))
  ;; ;; Use the creating function to make the actual advice function
  ;; (setq my-read-string-advice (create-read-string-advice4 "^password" "my-fixed-input"))
  ;; (advice-add 'read-string :around my-read-string-advice)
  ;; (read-string "password")
  ;; (funcall my-read-string-advice 'read-string "password")
  ;; (advice-remove 'read-string  my-read-string-advice)
  (defun my/github-username()
    (shell-command-to-string "awk '{print $1}' ~/private/github"))

  (defun my/github-password()
    (shell-command-to-string "awk '{print $2}' ~/private/github"))
  ;; (my/github-username)
  ;; (my/github-password)
  (defun setup-magit-push-advice (orig-fun &optional args)
    "Set up automatic responses for `magit-push-current-to-pushremote` based on prompts."
    (interactive)
    (print "yesyes")
    ;; Create advice for password prompts
    (let ((password-advice (create-read-string-advice "^Username for 'https://github.com':" (my/github-username)))
           (confirm-advice (create-read-string-advice "^Password for 'https://oonishi870@github.com':" (my/github-password)))
           result)
      ;; Add advice to automatically fill in password
      (advice-add 'read-string :around password-advice)
      (advice-add 'read-string :around confirm-advice)
      (setq result (apply orig-fun args))
      (advice-remove 'read-string  password-advice)
      (advice-remove 'read-string  confirm-advice)
      result
      ))
  ;; (advice-add 'magit-push-current-to-pushremote :around 'setup-magit-push-advice)
  ;; (advice-remove 'magit-push-current-to-pushremote  'setup-magit-push-advice)
  (advice-add 'magit-git-push :around 'setup-magit-push-advice)
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
    )
  
  (leaf corfu-prescient
    :ensure t
    :after corfu
    :config
    (require 'corfu-prescient)
    (with-eval-after-load 'orderless
      (setq corfu-prescient-enable-filtering nil))
    (corfu-prescient-mode +1))
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
