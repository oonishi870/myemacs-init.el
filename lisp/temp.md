(buffer-name)
test
```bash
#!/bin/bash

```

```math
\frac{\int\frac{\sum_{k=1}^nk}{888} \mathrm{d}x}{\partial{x_i}} 
```

```math
\begin{pmatrix}
a & b \\
c & d 
\end{pmatrix} 

\begin{pmatrix}
x \\
y  
\end{pmatrix} 
=
\begin{pmatrix}
k \\
t  
\end{pmatrix} 

```


# test

- test1
- test2

```bash
echo yes

```

```math
f (x )
```

```math
\int_{0}^{\infty}f(x) = \frac{e^{x}-1}{x^3 - 1}

```


test
```elisp
(print "yes")
```

```math
\begin{aligned}
f(x) & = (y - 1)^2 \\\\
                & = y^2 - 2y + 1 \\\\
                & = \frac { \sum_{k=1}^{n}{k}}{ \prod_{k=1}^{n}{k}}
                   +  \int_0^{\infty}g(t) dt
                   +  \int_0^{\infty}g(t) dt
                   +  \int_0^{\infty}g(t) dt \\\\
\frac{1}{x^2-1} \\\\
\end{aligned}

```

```math
\int_{0}^{\infty}f(x) = \frac{e^{x}-1}{x^3 - 1}

```


```elisp
(let*(
      (line
        ;; 現在行の文字列を取得(改行は含まない)
        (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
        (space-only (string-match-p "^[ \t]*$" line))
      )
  ;; lineが空白、タブだけの場合
  (if (string-match-p "^[ \t]*$" line)
    (message "空行です")
    (message "空行ではありません"))
            
  )

(defun test()
  (interactive)
  (print "yes1")
  ;; 関数を終了
  ()
  (print "yes2")
  )
(test)

```




## hello




\[
\displaystyle f\left(x\right) = \int_0^{\infty} \frac{ \sum_{k=1}^nk}{ \prod_{k=1}^{n}k} \, dx
\]

$$ 
\displaystyle f(x) =  \int_0^{\infty} \frac{ \sum_{k=1}^n k}{\displaystyle \prod_{k=1}^n k} \, dx
$$

$$


(poly-markdown-mode 1)

```elisp
(defun my/edit-region-in-indirect-buffer (start end)
  "Edit the region specified by START and END in an indirect buffer.
   Only the region is visible in the indirect buffer, thanks to `narrow-to-region`."
  (interactive "r")
ivy-prescient--old-ivy-sort-matches-completion-in-region-function  (let ((buffer-name (generate-new-buffer-name "*Indirect Region Edit*"))
        (origin-buffer (current-buffer)))
    ;; 1. 間接バッファを作成
    (with-current-buffer (make-indirect-buffer origin-buffer buffer-name t)
      ;; 2. 新しいバッファで選択範囲を狭める
      (narrow-to-region start end)
      ;; 3. 新しいバッファを表示し、ユーザーに編集させる
      (switch-to-buffer-other-window (current-buffer))
      ;; オプション: この時点で追加の設定やモードの変更を行う
      )))
```


```elisp

;; バッファの先頭に移動し、buffer-nameを実行、その後もとの位置に戻る
(defun my/execute-and-return-to-original-position (buffer-name)
  "Execute BUFFER-NAME and return to the original position."
  (let((p (point)))
    (save-excursion
    (goto-char (point-min))
    (print (pm-base-buffer)))(pm-base-buffer)
    (goto-char p ))
    
    (pm-base-buffer))
  
  (pm--span-at-point (point-min)))
(print pm-root)
(print pm-chunkmode)
(with-current-buffer (pm-base-buffer)
  (buffer-name))
(pm-chunk-range)
(pm-span-buffer )
(goto-char 1206)
(pm-innermost-range)
  (pm-span-to-range (pm-span-buffer))
  (pm-span-to-range (pm-span-buffer))
  (pm-map-over-spans (lambda(b)(pm--outspan-p (pm-span-buffer))))
  (pm-map-over-spans '(head))
    (pm-get-span 'OBJECT)
(pm-get-span)
(get-buffer "temp.md")

;; poly-markdown開始時にhelloと表示
(defun my/poly-markdown-mode-hook(&rest _)
  (message (buffer-name (pm-base-buffer))))
(add-hook 'poly-markdown-mode 'my/poly-markdown-mode-hook)
(remove-hook 'poly-markdown-mode 'my/poly-markdown-mode-hook)
(remove-hook 'markdown-mode 'my/poly-markdown-mode-hook)
(add-hook 'polymode-before-switch-buffer-hook 'my/poly-markdown-mode-hook)


(pm-get-span markdown-root)
;; 現在のmajor-modeを取得
(defun my/get-major-mode()
  (interactive)
  (print major-mode)
  )
(polymode-with-current-base-buffer #'buffer-name)
(polymode-next-chunk 0)
(poly-markdown-mode 1)
```

(polymode-next-chunk 1)
(polymode-with-current-base-buffer #'buffer-name)

(print major-mode)

```elisp

```
(get-buffer "temp.md")
(pm-chunk-range)
(pm-span-buffer)
(pm-get-span 'BEG)

```elisp
(require 'web-server)

(leaf web-server
  :ensure t
  :config
  (defvar my/html-file-path (locate-user-emacs-file "files/katex.html"))
  (defvar my/bashe-html-file-path (locate-user-emacs-file "files/base.html"))
  (defvar my/markdown-html-file-path (locate-user-emacs-file "files/default.html")
    "Path to the HTML file to serve.")

  (defun my/serve-html-file (proc)
    "Serve an HTML file for GET requests."
    (with-temp-buffer
      (print "yes4")
      ;;(insert-file-contents my/html-file-path)
      (insert (my/server-html-string))
      (ws-response-header proc 200 '("Content-Type" . "text/html; charset=UTF-8"))
      (print "yes4")
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
        ;;(print "yes2")
      ;; SSIタグを解析し、ファイル内容を挿入

        (let* (
            ;;(include-file (match-string 1))
            (contents
              (with-temp-buffer
                (insert-file-contents my/markdown-html-file-path)
                  (buffer-string))))
          (if (re-search-forward "<!-- #include file -->" nil t)
            (replace-match contents))
          (buffer-string))
      ;;(buffer-string)
      ))

  (defun my/serve-buffer-contents (proc buffer-name)
    "Serve the contents of a buffer for POST requests."
    (print "yes11")
    (print buffer-name)
    (print (get-buffer buffer-name))
    (if-let ((buffer (get-buffer buffer-name)))
      (with-current-buffer buffer
          (print "yes3")
          (print buffer)
          (ws-response-header proc 200 '("Content-Type" . "text/plain"))
          (process-send-string proc (buffer-string)))
      (ws-send-404 proc)))

  (setq svr (ws-start
   '(((:POST . ".*") .
       (lambda (request)
        (print "yes0")
        (with-slots (process headers) request
          ;;(let ((buffer-name (cdr (assoc "buffer" (ws-parse-qs (cdr (assoc "Content-Length" headers)))))))
          (print "yes2")
          (let ((buffer-name (cdr (assoc "buffer" headers))))
          ;;(let ((buffer-name ""))
            (print "yes10")
            (print headers)
            (print buffer-name)
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
    (let ((js "sendPostRequest();"))
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

(derived-mode-p 'markdown-mode 'poly-markdown-mode)
(print
  (xwidget-webkit-browse-url
    (format "http://localhost:9001/?buffer=%s"
      (replace-regexp-in-string  " " "%20" (buffer-name (pm-base-buffer)))))
  )
(defun execute-js-in-webkit ()
  (interactive)
  ;;(let ((js "alert('Hello from Emacs!');"))
  (let ((js "sendPostRequest();"))
    (xwidget-webkit-execute-script (xwidget-webkit-current-session) js))
  )
(defun my-after-save-actions (&rest _args)
  "Execute JavaScript in xwidget-webkit after saving the buffer."
  (when (derived-mode-p 'xwidget-webkit-mode) ;; 現在のバッファがxwidget-webkitの場合のみ実行
    (let ((js "sendPostRequest();"))
      (xwidget-webkit-execute-script (xwidget-webkit-current-session) js))))

(defun my/markdown-live-preview(&optional)
  (interactive)
  (xwidget-webkit-browse-url
    (format "http://localhost:9001/?buffer=%s"
      (replace-regexp-in-string  " " "%20" (buffer-name (pm-base-buffer)))))
  (advice-add 'save-buffer :after (lambda (&rest _args)
    (when (derived-mode-p 'xwidget-webkit-mode) ;; 現在のバッファがxwidget-webkitの場合のみ実行
      (let ((js "sendPostRequest();"))
        (xwidget-webkit-execute-script (xwidget-webkit-current-session) js))))))

(with-current-buffer (pm-base-buffer)
  (print my/markdown-live-preview-buffer))

;;(advice-remove 'save-buffer nil)
;; (advice-remove 'save-buffer nil)
;;(setq svr (ws-start 'my/web-server-handler 9001))
;;(ws-stop svr)
;; (buffer-list)
;; (get-buffer ")
;; (buffer-name (current-buffer))
;; (buffer-name(pm-base-buffer ))
;;(locate-user-emacs-file "files/katex.html")

```

```math
\int_{0}^{\infty}f(x) = \frac{e^{x}-1}{x^3 - 1}

```



```lisp

;; copilot-completeにadviceを追加
(defun hello() (print "hello"))
(advice-add 'copilot-complete :before #'hello)
(advice-remove 'copilot-complete #'hello)

(let ()
    ;; copilot-completeの実行時にcorfuをoffにする
  (defun my/corfu-disable()
    (corfu-quit)
    (corfu-mode -1)
    )
    (advice-add 'copilot-complete :before #'my/corfu-disable)
    ;;(advice-remove 'copilot-complete  #'my/corfu-disable)

  ;; print関数を別の関数として保存する
  (setf (symbol-function 'print3) (symbol-function 'print))
  
  (defalias 'print2 'print)
  (print3 "yes")
  
  ;; print2関数をprintに設定
  (set 'print2 #'print)

  ;; pritn2関数を実行
  (print2 "yes")
  (set 'print2 #'print)
  (print2 "yes")
  (print2 "yes")
  (company-mode -1)
  (corfu-mode -1)
  (cape-mode -1)
  (print corfu-mode)
  )

;; corfuのポップアップが表示されるときにhello-worldを表示
(defun hello1(&rest _)
  (print "yes13")
  (print (bound-and-true-p corfu--popup-show))
  (if (and (bound-and-true-p corfu-mode) (bound-and-true-p corfu--overlay))
    (print "yes1")))

  (advice-add 'corfu--popup-show :after #'hello1)
  ;;(advice-remove 'corfu-show  #'hello1)
(corfu-mode 1)
(print corfu-preview-current)
(print corfu-mode)
(print corfu-mode)
(print corfu-mode)
(print (corfu--overlay)
  (corfu--popup-show)
  (print corfu--on)
  (corfu-reset)
  (copilot--overlay-visible)


  (defun hello1(&rest _)
    copilot--display-overlay-completion COMPLETION UUID START END

(defun hello2(&rest args)
  (print "hello2")
  (corfu-quit)
  )
(advice-add 'copilot--display-overlay-completion :after #'hello2)
    
    (copilot-mode -1)
    (buffer
      (corfu--post-command)
      (corfu--update (point) )
      ;; これ！      
      (corfu--auto-complete-deferred)
  
      (corfu--update nil)

      
  ;; copilot-clear-overlayで補完が終わったときにcorfuをONにする
  (defun my/corfu-enable-when-t(&optional value)
    (print3 (buffer-name))
    (print3 value)
    (print3 corfu-mode)
    (if (and (not value) (not corfu-mode))
      (progn
         (print3 "yes3")
          (print3 (buffer-name))
        ;;(corfu-mode 1)
        (corfu--auto-complete-deferred)
        )))
  (advice-add 'copilot-clear-overlay :before #'my/corfu-enable-when-t)
  ;;(advice-remove 'copilot-clear-overlay  #'my/corfu-enable-when-t)
)
    
;; hello-worldを表示

    
(corfu-mode 1)

(defun hello(f &rest args)
  (print "hello")
  (apply f args)
  (print "good-bye")
  )

(advice-add 'copilot-complete :around #'hello)


;; copilotのoverlayバッファが表示されたときにhello-worldを表示
(defun hello1(&rest _)
  (if (overlayp copilot--keymap-overlay)
    
  ))

(advice-add 'copilot-complete :after #'hello1)

;; hello-worldを表示
(defun hello2(&rest args)
  (print "hello2")
  (print args))
(advice-add 'copilot-clear-overlay :after #'hello2)
(advice-remove 'copilot-clear-overlay #'hello2)



;; copilot-completeにadviceを追加
(defun hello3() (print "hello3"))

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

;; copilot-completeにadviceを追加
(copilot-current-completion)
;; マイナーモードの一覧を取得
(print minor-mode-list)


;; dynamic-completion-mode-hookにhookを仕掛ける
(add-hook 'dynamic-completion-mode-hook 'hello)
(add-remove 'dynamic-completion-mode-hook 'hello)

;; copilotの補完が表示されているときだけキーバインドを変える
(defun my/copilot-complete()
  (interactive)
  (if (bound-and-true-p copilot-mode)
    (progn
      (print "yes")
      )
    (progn
      (print "no")
      )
    )
)

(add-hook 'copilot-mode-hook 'my/copilot-complete)
(remove-hook 'copilot-mode-hook 'my/copilot-complete)



```


```elisp
;; copilot-clear-overlayで補完が終わったときにcorfuをONにする
(defun my/corfu-enable-when-t(&optional value)
  (print3 (buffer-name))
  (print3 value)
  (print3 corfu-mode)
  (if (and (not value) (not corfu-mode))
    (progn
       (print3 "yes3")
        (print3 (buffer-name))
      ;;(corfu-mode 1)
      (corfu--auto-complete-deferred)
      )))
(advice-add 'copilot-clear-overlay :before #'my/corfu-enable-when-t)
;;(advice-remove 'copilot-clear-overlay  #'my/corfu-enable-when-t)

(print copilot--overlay)
(overlays-at (point))


(current-tab-width)
(derived-mode-p 'emacs-lisp-mode)

(defun hello(f &rest args)
  (print "hello")
  (apply f args)
  (print "good-bye")
  )

(advice-add 'copilot-complete :around #'hello)


;; hello-worldを表示


;; corfuのポップアップが表示されるときにhello-worldを表示
(defun hello1(&rest _)
  (print "yes13")
  (print (bound-and-true-p corfu--popup-show))
  (if (and (bound-and-true-p corfu-mode) (bound-and-true-p corfu--overlay))
    (print "yes1")))

  (advice-add 'corfu--popup-show :after #'hello1)

;; copilotの補完が表示中の場合は、corfu--popup-showを中止する
(defun corfu-quit-when-copilot-completing(f &rest _)
  ;; overlayが表示されている場合
  ;;(print "yes1")
  (let ((result))
    (if (not (overlays-at (point)))
      (setq result (apply f _)))
    (print result)
    result)
  )
    
(advice-add    'corfu--popup-show :around 'corfu-quit-when-copilot-completing)
(advice-remove 'corfu--popup-show  'corfu-quit-when-copilot-completing)

;; corfuのポップアップが表示中のときはcopilotを表示しない
(defun copilot-quit-when-corfu-show(f &rest _)
  (let ((result))
    (if (not (overlays-at (point)))
      (setq result (apply f _)))))
(advice-add    'copilot--show-completion :around 'copilot-quit-when-corfu-show)


;; corfuのポップアップが表示されるときにhello-worldを表示
(defun hello1(&rest _)
  (if (overlayp copilot--keymap-overlay)
    (print "yes1")))


(print (my/corfu-enable-when-t))
(my/markdown-live-preview

;; copilotの補完が表示のときにcorfuをoffにする
(defun my/corfu-disable()
  (corfu-quit)
  (corfu-mode -1)
  )
(advice-add    'copilot-complete :before #'my/corfu-disable)
(advice-remove 'copilot-complete  #'my/corfu-disable)


;; copilotの補完の終了時にcorfuを表示する
(defun my/corfu-enable-when-copilot-close(&optional val)
  (if (not val)
    (progn
      (corfu-mode 1)
      (corfu--auto-complete-deferred)
  )))
(advice-add    'copilot-clear-overlay :before #'my/corfu-enable-when-copilot-close)
(advice-remove 'copilot-clear-overlay  #'my/corfu-enable-when-copilot-close)


;; copilot--show-completion
;; copilotの補完を表示するときにcorfuを終了する
(defun my/corfu-quit-when-copilot-show-completion(&rest _)
  (corfu-quit)
  ;;(corfu-mode -1)
  )
(advice-add    'copilot--show-completion :before #'my/corfu-quit-when-copilot-show-completion)
(advice-remove 'copilot--show-completion  #'my/corfu-quit-when-copilot-show-completion)

(overlays-at (point))



;; corfuの表示中はcopilotは表示しない
(defun my/copilot-quit-when-corfu-show(&rest _)
  (if (bound-and-true-p corfu--overlay)

    (corfu-mode 1)

(corfu-mode -1)

(bind-keys :map copilot-completion-map
    ("TAB" . copilot-accept-completion-by-word)
    ("C-w" . copilot-accept-completion-by-word)
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

;; after-change-functionsでcopilot--overlayが表示されている場合、corfuを非表示にする
(defun check-overlay-visibility(&rest _)
  (if (= (overlays-at (point)) copilot--overlay)
    (progn
      (corfu-quit)
      (corfu-mode -1))
    (progn
      (corfu-mode 1)
      (corfu--auto-complete-deferred)
      )
    ))
    


(add-hook 'after-change-functions 'check-overlay-visibility)

(remove-hook 'after-change-functions 'check-overlay-visibility)



;; counsel-companyの実行後にcompany-modeを無効にする
(defun my/company-mode-disable(&rest _)
  (company-mode -1)
  )
(advice-add 'counsel-company :after #'my/company-mode-disable)
(print company-mode)
    
    
    


    
(defun my/markdown-html-file-path()
  (locate-user-emacs-file "files/default.html")
  )


    
;; corfuのデフォルトの選択状態を変更する


;; copilotの補完が表示されているときだけキーバインドを変える

  (overlay-get copilot--overlay 'display )
    (if (print copilot--overlay)
    
    (corfu
  (if (bound-and-true-p copilot--overlay
(overlays-in (point-min) (point-max))

        (message (format "%s" (overlay-properties copilot--overlay)))
        (overlay-get copilot--overlay ')
        (overlays-at (point
                       ))
        ;; hello-worldを表示


  (bind-keys :map corfu-map
      ("<RET>" . nil) ;; 2018/06/27 tmux用
    )

(defun my-corfu-unselect-first ()
  "Unselect the first completion candidate in Corfu."
  (interactive)
  (when (corfu--popup-showing-p)
    ;; Move selection to a non-existing candidate to unselect all.
    ;;(corfu--goto nil)
    (corfu--index nil)
    ))
(corfu--goto)
(use-package corfu
  :init
  (corfu-global-mode)  ; Corfu をグローバルに有効にする
  :config
  (add-hook 'corfu-popup-hook 'my-corfu-unselect-first))
        (remove-hook 'corfu-popup-hook 'my-corfu-unselect-first)


        (corfu-mode -1)
        (company-mode 1)
(company-complete-common)

  (bind-keys :map corfu-map
      ("C-w" . corfu-expand)
      ("C-e" . corfu-expand)
    )
  (bind-keys :map company-mode-map
      ("C-w" . company-common)
      ("C-e" . company-common)
      ("<tab>" . company-common)
    )
        my/cmar
        (corfu-next nil)
        (global-copilot-mode -1)

        (corfu-complete)
        
        (corfu-mode -1)
        (company-mode 1)
        (corfu-mode 1)
        (company-mode -1)

        (setq company-prefix 2)

  (setq completion-ignore-case t)
  (setq company-idle-delay 0)                    ;; 待ち時間を0秒にする
  (setq company-minimum-prefix-length 2)         ;; 補完できそうな文字が2文字以上入力されたら候補を表示
  (setq company-selection-wrap-around t)         ;; 候補の一番下でさらに下に行こうとすると一番上に戻る
        (setq company-transformers '(company-sort-by-occurrence company-sort-by-backend-importance))) ;; 利用頻度が高いものを候補の上に表示する


    (setq-local completion-at-point-functions
   '(company-bbdb company-semantic company-cmake company-capf company-clang company-files
  (company-dabbrev-code company-gtags company-etags company-keywords)
     company-oddmuse company-dabbrev))

    (setq-local completion-at-point-functions
      '(cape-keyword cape-dabbrev tags-completion-at-point-function))
    (corfu-mode 1)

    

    ;; markdown-previewを起動する
    (defun my/markdown-preview()
      (interactive)
      (let ((buf (current-buffer)))
        (xwidget-webkit-browse-url
          (format "http://localhost:9001/?buffer=%s"
      
    

(print completion-at-point-functions)
```

```elisp
(global-corfu-mode -1)

(leaf company
  (leaf company-statistics
    :ensure t
    :config
    (company-statistics-mode))
  :ensure t
  ;;:after company-statistics
  ;; :bind (("M-<tab>" . company-complete) ;; Tabで自動補完を起動する
  ;;        :map company-active-map
  ;;        ;; C-n, C-pで補完候補を次/前の候補を選択
  ;;        ("M-n" . nil)                      ;; M-nで次の候補への移動をキャンセル
  ;;        ("M-p" . nil)                      ;; M-pでの前の候補への移動をキャンセル
  ;;        ("C-n" . company-select-next)      ;; 次の補完候補を選択
  ;;        ("C-p" . company-select-previous);; 前の補完候補を選択
  ;;        ("C-s" . company-filter-candidates) ;; C-sで絞り込む
  ;;        :map company-search-map
  ;;        ;; 検索候補の移動をC-nとC-pで移動する
  ;;        ("C-n" . company-select-next)
  ;;        ("C-p" . company-select-previous))
  :config
  ;; 全バッファで有効にする
  (global-company-mode)
  :config
  (define-key emacs-lisp-mode-map (kbd "C-M-i") nil) ;; CUI版のためにemacs-lisp-modeでバインドされるC-M-iをアンバインド
  (global-set-key (kbd "C-M-i") 'company-complete)   ;; CUI版ではM-<tab>はC-M-iに変換されるのでそれを利用
  (setq completion-ignore-case t)
  (setq company-idle-delay 0)                    ;; 待ち時間を0秒にする
  (setq company-minimum-prefix-length 2)         ;; 補完できそうな文字が2文字以上入力されたら候補を表示
  (setq company-selection-wrap-around t)         ;; 候補の一番下でさらに下に行こうとすると一番上に戻る
  (setq company-transformers '(company-sort-by-occurrence company-sort-by-backend-importance))) ;; 利用頻度が高いものを候補の上に表示する




;; auto-completeに近い挙動で候補の絞り込みができる
(use-package company-dwim
  :straight '(company-dwim
              :type git
              :host github
              :repo "zk-phi/company-dwim")
  :ensure t
  :init
  (define-key company-active-map (kbd "TAB") 'company-dwim)
  (setq company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend
        company-dwim-frontend
        company-echo-metadata-frontend)))

;; カーソルの位置がどこであってもcompanyを起動できる
(use-package company-anywhere
  :straight '(company-anywhere
              :type git
              :host github
              :repo "zk-phi/company-anywhere")
  :ensure t)

;; プログラムの関数、変数のキーワード補完を強化
(use-package company-same-mode-buffers
  :straight '(company-same-mode-buffers
              :type git
              :host github
              :repo "zk-phi/company-same-mode-buffers")
  :after company
  :ensure t
  :init
  (require 'company-same-mode-buffers)
  (company-same-mode-buffers-initialize)
  ;;
  :config
  (setq company-backends
        '((company-capf :with company-same-mode-buffers)
          (company-dabbrev-code :with company-same-mode-buffers)
          company-keywords
          company-files
          company-dabbrev)))


```
