# test

(buffer-name)
test

```bash
#!/bin/bash

cat <<EOF
$(echo "test")
EOF

echo $(echo "test")

for i in $(seq 10);
do
    echo $i
done

```

```math
\frac{\int\frac{\sum_{k=1}^nk}{888} \mathrm{d}x}{\partial{x_i}} 
```

```math

\begin{pmatrix}
a & b \\
c & d 
\end{pmatrix}

(yas-minor-mode 1)

\begin{pmatrix}
x \\
y  
\end{pmatrix} 
=
(require 'yasnippet)

\begin{pmatrix}
k \\
t  
\end{pmatrix}  


\begin{pmatrix}
a & b \\
c & d 
\end{pmatrix}

\int_{}^{} x \mathrm{d}x

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
(company-mode 1)
activate-mark-hook

(leaf company
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

(setq company-transformers '(company-sort-by-occurrence company-sort-by-occurrence ))
(setq company-transformers nil)
coding-category-utf-16-auto
(setq-default company-selection-default nil)
(setq-default company-selection nil)

(setq corfu-preselected t)




abbrev-expand-function
a

  (bind-keys :map company-active-map
      ("C-m" . nil)
      ("C-j" . nil)
      ("<RET>" . nil)
      ;;("C-m" . (lambda (&rest _)(interactive)(print "yes")))
      ("C-w" . (lambda (&rest _)(interactive)(print "yes")))
    )



abbrev--suggest-saved-recommendations
abbrev--suggest-saved-recommendations
abbrev--suggest-saved-recommendations
abbrev--suggest-saved-recommendations

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
company-active-map
company-selection


(bind-keys :map company-active-map
  ("<return>" .
    (lambda (&rest _)
      (interactive)
      (print "yes")))
  ("<S-return>" . (lambda (&rest _)(interactive)(print "yes4")))
  ("<RET>" . (lambda (&rest _)(interactive)(print "yes")))
  ("S-<RET>" . (lambda (&rest _)(interactive)(print "yes4")))
  ("<RETURN>" . (lambda (&rest _)(interactive)(print "yes")))
  ("S-<RETURN>" . (lambda (&rest _)(interactive)(print "yes4")))
  ("<ret>" . (lambda (&rest _)(interactive)(print "yes")))
  ("C-m" . (lambda (&rest _)(interactive)(print "yes2")))
  ("C-j" . (lambda (&rest _)(interactive)(print "yes3")))
  )

(bind-keys :map company-active-map
  ("<return>" .
    (lambda (&rest _)
      (interactive)
      (if (not company-selection)
        (newline)
        (company-complete)
      ))
    ))

(print

(describe-keymap (current-active-maps))
(print (current-active-maps))
(global-set-key [return] '(lambda (&rest _)(interactive)(print "yes6")))a

(insert "\n")
(print company-active-map)

(require 'corfu)
(corfu-mode 1)
(company-mode -1)
my/*file
  (setq corfu-preselect 'prompt)
  (print corfu-preselected)
  ;; test test
  my/markdown-live-preview-buffer
  my/markdown-html-file-path

  my/markdown-html-file-path
  
;; 
(defun my/generate-temp-buffer ()
  (interactive)
  (switch-to-buffer (concat (make-temp-name "*scratch") "*"))
  )


(let (
    (agpath (locate-user-emacs-file "bin/ag"))
    (shell-command (format "mkdir -p %s" (locate-user-emacs-file "bin")))
    (s "\
#!/bin/sh
ssh localhost ag $@
")) 
    (with-temp-file agpath
      (insert s)
    )
    (shell-command (format "chmod +x %s" agpath))
    (setq counsel-ag-command agpath)
)


(setq counsel-ag-command nil)
  (shell-command-to-string "ssh localhost ag -G 'sql$' usi ./")

  (vertico-mode 1)
  (vertico-posframe-mode 1)
  (consult-line "*consult-line")
  
```


```elisp
(defun my/set-auto-inednt(&rest _)
  (interactive)
  (electric-indent-mode 1)
  (setq indent-line-function #'indent-relative)
  (setq electric-indent-inhibit t))

;; 特定のモードのときに自動で設定する
(let()
  (add-hook  'emacs-lisp-mode-hook  'my/set-auto-inednt)
  (add-hook  'python-mode-hook      'my/set-auto-inednt)
  (add-hook  'c-mode-hook           'my/set-auto-inednt)
  (add-hook  'c++mode-hook          'my/set-auto-inednt)
  (add-hook  'sql-mode-hook         'my/set-auto-inednt)
  (add-hook  'sh-mode               'my/set-auto-inednt)
  
)



  
;; 文字列から「;」を検索する。ただし「'’」「""」「/**/」の囲み、行頭「--」は無視する
(defun my/search-semicolon()
  (interactive)
  (let ((p (point))
        (s (buffer-substring-no-properties (point-min) (point-max)))
        (result))
    (setq result (string-match ";"
      ;; 文字列から「'’」「""」「/**/」の囲み、行頭「--」を「 」に置き換える
        (my/my/search-semicolon--replace-sequences s)
      )
    (if result
      (goto-char (+ (point-min) result))
      (goto-char p))
    )
  )

(defun my/my/search-semicolon--replace-sequences (s)
  ;; 「\’」「\"」「\\」を「  」に置き換える
  (setq s (replace-regexp-in-string "\\\\" "  " s))
  (setq s (replace-regexp-in-string "\\'" "  " s))
  (setq s (replace-regexp-in-string "\\\"" "  " s))
  ;; 「'’」「""」「/**/」の囲み、行頭「--」を同じ長さの「 」に置き換える
  ;; ただし改行は維持する
  (string-match "\\('[^']*'\\|\"[^\"]*\"\\|/\\*[^*]*\\*/\\|^--.*$\\)" s)
  (match-string 1 s)
)
(message (my/my/search-semicolon--replace-sequences "test'12\n3'test"))

(ivy-migemo-toggle-fuzzy -1)
  
```

```elisp
(defun my/headered-buffer--get-window-header-windowds (win)
  (let (hwin)
    (if 
      (and
        (window-valid-p win)
        (setq hwin (window-prev-sibling win)))
        (if (window-parameter hwin 'my/headered-buffer--winprm--is-header-window)
          (append (my/headered-buffer--get-window-header-windowds hwin) (list hwin))
          nil
        )
      nil
    )
  )
)


(setq a '(1 2 3))
(number-sequence 1 (max (length win) count))
(number-sequence 3 1)

(mapcar* (quote +) '(1 2 3) '(4 5 6))


(defun mapcar* (function &rest args)
  "Apply FUNCTION to successive cars of all ARGS.
Return the list of results."
  ;; リストが消費されていなければ、
  (if (not (memq nil args))
      ;; CARに関数を適用する。
      (cons (apply function (mapcar 'car args))
            (apply 'mapcar* function
                   ;; 残りの要素のための再帰。
                   (mapcar 'cdr args)))))

(defun my/headered-buffer--update-header-window (target-win count)

  (setq wins (my/headered-buffer--get-window-header-windowds target-win))
  (mapcar*
   (lambda (win ith) 
     (if (not win)
         (progn 
           (setq hwin (split-window win (- (window-height win) 3) 'above))
           (set-window-dedicated-p hwin nil)
           ;;(set-window-buffer hwin hbuffer)
           (run-hook-with-args 'my/headered-buffer--reflesh-header-window target-win hwin ith)
           (set-window-dedicated-p hwin t)
           (set-window-parameter hwin 'no-other-window t)
           (set-window-parameter hwin 'my/headered-buffer--winprm--is-header-window t)
           )))
  (mapcar
      (lambda (ith) (nth (- ith 1) wins))
      (number-sequence 1 count) )
  (number-sequence 1 count))


  (mapcar 
   (lambda (win) 
     (if win (delete-window win)))
   (mapcar
      (lambda (ith) (nth ith wins))
      (number-sequence count (length wins)))
  )
)


(defun my/test2(target-win header-win ith)
  (print "Yes")
  (set-window-buffer header-win "*scratch*")
  (with-current-buffer (window-buffer header-win)
    (setq mode-line-format nil)
    )
  ;;(setq window-min-height 0)
  (window-resize header-win (- 2 (window-height header-win)))
  (window-resize header-win (- 2 (line-pixel-height)) nil t t)
)
(require 'cl-lib)
(my/headered-buffer--update-header-window (get-buffer-window) 0)


(add-hook 'my/headered-buffer--reflesh-header-window 'my/test2)
(remove-hook 'my/headered-buffer--reflesh-header-window 'my/test2)


(defun my/test(frame)
  (remove-hook 'window-buffer-change-functions 'my/test)
  (mapcar
   (lambda (win)
     (if (and (window-valid-p win) (string= (buffer-name (window-buffer win)) "*test1*") )
       (my/headered-buffer--create-header-window win (get-buffer "*scratch*") 4)
       (my/headered-buffer--delete-header-window win)
       ))
   (window-list)
   )
  (add-hook 'window-buffer-change-functions 'my/test)
  )
(my/test)
(get-frame)
(current-frame-configuration)


(add-hook 'window-buffer-change-functions 'my/test)
(remove-hook 'window-buffer-change-functions 'my/test)

(add-hook 'test-hook (lambda (&optional a b)(message "test-hook %S %S" a b)))
(remove-hook 'test-hook (lambda (&optional a b)(message "test-hook %S %S" a b)))
(run-hook-with-args 'test-hook 1 2)


(setq mode-line-compact t)
```

```elisp

(defun my/headered-buffer--create-header-window (win hbuffer hbuffer-size)
  (let (hwin)
    (setq hwin (window-prev-sibling win))
    (if (not (window-parameter hwin 'my/headered-buffer--winprm--is-header-window))
        (setq hwin (split-window win (- (window-height win) hbuffer-size) 'above)))

    (set-window-dedicated-p hwin nil)
    (set-window-buffer hwin hbuffer)
    (set-window-dedicated-p hwin t)
    (with-current-buffer (window-buffer hwin)
      (setq mode-line-format nil)
    )

    (set-window-parameter hwin 'no-other-window t)
    (set-window-parameter hwin 'my/headered-buffer--winprm--is-header-window t)
    hwin
))


;;(my/headered-buffer--create-header-window (get-buffer-window (current-buffer)) (get-buffer "*scratch*") 4)


(defun my/headered-buffer--delete-header-window (win)
  (while (and 
          (window-valid-p win) 
          (setq hwin (window-prev-sibling win))
          (window-parameter hwin 'my/headered-buffer--winprm--is-header-window))
    (delete-window hwin))
)

;;(my/headered-buffer--delete-header-window (get-buffer-window (current-buffer)))


(defun my/test(frame)
  (remove-hook 'window-buffer-change-functions 'my/test)
  (mapcar 
   (lambda (win)
     (if (and (window-valid-p win) (string= (buffer-name (window-buffer win)) "*test1*") )
       (my/headered-buffer--create-header-window win (get-buffer "*scratch*") 4)
       (my/headered-buffer--delete-header-window win)
       ))
   (window-list)
   )
  (add-hook 'window-buffer-change-functions 'my/test)
)

(add-hook 'window-buffer-change-functions 'my/test)
(remove-hook 'window-buffer-change-functions 'my/test)

;; helm-find-filesで選択されたファイル名をクリップボードにコピーする
(leaf helm-clipboard
  :config
  (defun my/helm-clipboard-action ()
    (interactive)
    ;; helmでカーソル位置のアイテムを取得
    (let ((candidate (helm-get-selection
    (print candidate)
    (kill-new candidate)
    (message "%s => kill-ring" candidate))
  ;; Returnでファイルを開く代わりにファイル名をクリップボードにコピーする
  (bind-keys :map helm-find-files-map
    ("C-c C-y" . my/helm-clipboard-action))
  
  

            )

  (bind-keys :map helm-find-files-map
    ("<tab>" . helm-ff-RET)
    ("<return>".
      (lambda (&optional args)
        (interactive)
        ;; ディレクトリならdired。ファイルなら開く
        (if (file-directory-p (helm-get-selection))
          (helm-exit-and-execute-action
            (lambda (x) (dired x)))
          (helm-execute-persistent-action))))
    )
  ;; diredバッファでhelm-find-filesを開いたときに同じウィンドウにhelmバッファを開く
  (defun my/helm-find-files-other-window (&optional args)
    (interactive)
    ;; currentバッファがdiredバッファなら
    (if (eq major-mode 'dired-mode)
      (progn
        ;; helmバッファをカレントバッファの下に表示
        (let ((display-buffer-overriding-action
                '(display-buffer-same-window)))
          (helm-find-files args)))
        

        (helm-find-files args)))
(define-key input-decode-map [control up] [C-up])
(global-set-key [C-up] (lambda () (interactive) (message "Control key released!")))

(defvar my-last-ctrl-state nil "Last state of the CTRL key.")

(defun check-ctrl-release (&rest _)
  (let ((current-state (memq 'control (event-modifiers (read-event "Press any key: " nil 0.1)))))
    (when (and my-last-ctrl-state (not current-state))
      (message "Control key released!"))
    (setq my-last-ctrl-state current-state)))
(check-ctrl-release)
(setq tt (run-with-idle-timer 0.1 t 'check-ctrl-release))
           
           (cancel-timer tt)

           (check-ctrl-release)
           (this-command-keys)
(defun test()
  (interactive)
  ;; (this-command-keys)がC-<tab>かチェック
  (unless (or
        (equal (kbd "C-<tab>") (this-command-keys))
        (equal (kbd "C-<iso-lefttab>") (this-command-keys)))
    
    )
  )
(type-of (this-command-keys))
(type-of (kbd "C-<tab>"))
           
(add-hook 'pre-command-hook #'test)
(remove-hook 'pre-command-hook #'test)

           
           (print (buffer-list))
           (switch-to-buffer (nth 1 (window-prev-buffers)))
(let()
  (define-minor-mode my/buffer-switch-mode
    "My custom minor mode example."
    :lighter " MyCustom"
    :keymap  '() 
    :global t
    )
           
  (defvar my/buffer-switch--buffer-list nil)
  (defvar my/buffer-switch--buffer-list-index 0)

  ;; 除外するバッファリスト
  (defvar my/buffer-switch--exclude-buffer-regexp
    '("\\*ivy-.*" "\\*Minibuf.*" "^helm.*" ".*completion.*" "\\*Echo"
       "\\*copilot-" "\\*corfu" "\\*company" "\\*eldoc" "\\*migemo"))
  (defun my/buffer-switch--buffer-list-function()
    ;; minibufferやivyバッファを除外する
    (cl-remove-if
      (lambda (x)
        (cl-some
          (lambda (y)
            (string-match y (buffer-name x)))
          my/buffer-switch--exclude-buffer-regexp))
          (cl-remove-duplicates
            ;;(append (nth 0 (window-prev-buffers)) (buffer-list))
            (append (mapcar #'car (window-prev-buffers)) (buffer-list))
            :test 'eq))
    )
  (defun my/buffer-switch-mode-hook-init(&rest _)
    ;; (window-prev-buffers)と(buffer-list)のユニークなリスト
    (setq my/buffer-switch--buffer-list (my/buffer-switch--buffer-list-function))
    (setq my/buffer-switch--buffer-list-index 0)
    (add-hook 'pre-command-hook #'my/buffer-switch-mode--cancel)
    (global-my/buffer-switch-mode 1)
    )

  (defun my/buffer-switch-mode-hook-exit(&rest _)
    ;; (window-prev-buffers)と(buffer-list)のユニークなリスト
    (setq my/buffer-switch--buffer-list nil)
    (setq my/buffer-switch--buffer-list-index 0)
    (remove-hook 'pre-command-hook #'my/buffer-switch--cancel)
    (global-my/buffer-switch-mode -1)
    )
  (defun my/buffer-switch-next()
    (interactive)
    (print my/buffer-switch--buffer-list-index)
    (setq my/buffer-switch--buffer-list-index
      (mod (1+ my/buffer-switch--buffer-list-index)
        (length my/buffer-switch--buffer-list)))
    (switch-to-buffer (nth my/buffer-switch--buffer-list-index my/buffer-switch--buffer-list))
    )
  (defun my/buffer-switch-prev()
    (interactive)
    (setq my/buffer-switch--buffer-list-index
      (mod (1- my/buffer-switch--buffer-list-index)
        (length my/buffer-switch--buffer-list)))
    (switch-to-buffer (nth my/buffer-switch--buffer-list-index my/buffer-switch--buffer-list))
    )
  (bind-keys :map my/buffer-switch-mode-map
    ( "C-<tab>" . my/buffer-switch-next)
    ( "C-<iso-lefttab>" . my/buffer-switch-prev)
    )
  (defun my/buffer-switch--cancel(&rest _)
    (interactive)
    ;; (this-command-keys)がC-<tab>かチェック
    (print (this-command-keys))
    (unless (or
          (equal (kbd "C-<tab>") (this-command-keys))
          (equal (kbd "C-<iso-lefttab>") (this-command-keys)))
      ;;(my/buffer-switch-mode -1)
      (my/buffer-switch-mode-hook-exit)
      )
    )
  (define-globalized-minor-mode global-my/buffer-switch-mode my/buffer-switch-mode my/buffer-switch-mode-on)

  (defun my/buffer-switch-mode-on ()
    "Enable `my/buffer-switch-mode'."
    (unless (minibufferp)
      (my/buffer-switch-mode 1)))

  (defun my/buffer-switch(&optional _)
    (interactive)
    (my/buffer-switch-mode-hook-init)
    (my/buffer-switch-next))
  )
(require 'expand-region)

(defvar my-expand-region-max-lines 10
  "The maximum number of lines expand-region is allowed to select.")

(defun my-expand-region-limit (start end)
  "Limit the selection to a maximum of `my-expand-region-max-lines` lines."
  (let ((lines (count-lines start end)))
    (if (> lines my-expand-region-max-lines)
        (progn
          (message "Selection limited to %d lines." my-expand-region-max-lines)
          nil)
      t)))

(defun my-er-add-limit ()
  "Add a limit to expand-region's expansion functions."
  (print "yes")
  (add-to-list 'er/try-expand-list 'my-expand-region-limit t))

(add-hook 'er/prepare-expansion-functions-hook 'my-er-add-limit)

(global-set-key (kbd "C-=") 'er/expand-region)




           
(require 'expand-region)

(defvar my-expand-region-max-lines 10
  "The maximum number of lines expand-region is allowed to select.")

(defun my-expand-region-advice (orig-fun &rest args)
  "Advice to limit expand-region to `my-expand-region-max-lines` lines."
  (let ((initial-point (point))
        (initial-mark (mark)))
    (apply orig-fun args)
    (let ((line-count (count-lines (region-beginning) (region-end))))
      (when (> line-count my-expand-region-max-lines)
        (goto-char initial-point)
        (set-mark initial-mark)
        (message "Selection limited to %d lines." my-expand-region-max-lines)))))

(advice-add 'er/expand-region :around #'my-expand-region-advice)

(global-set-key (kbd "C-=") 'er/expand-region)


```

```elisp

(defun er/add-sh-mode-expansions ()
  "Expansions for `sh-mode'."
  (set (make-local-variable 'er/try-expand-list)
       (append er/try-expand-list
               '(
                  er/mark-sh-variable
                  er/mark-sh-function))))

(defun er/mark-sh-function ()
  "Mark the current shell function."
  (interactive)
  (let ((start (point))
        (end (point)))
    (save-excursion
      (sh-beginning-of-command)
      (setq start (point))
      (sh-end-of-command)
      (setq end (point)))
    (set-mark start)
    (goto-char end)))

(defun er/mark-sh-variable ()
  "Mark the current shell variable."
  (interactive)
  (let ((start (point))
        (end (point)))
    (save-excursion
      (skip-syntax-backward "w_")
      (setq start (point))
      (skip-syntax-forward "w_")
      (setq end (point)))
    (set-mark start)
    (goto-char end)))

(remove-hook 'sh-mode-hook 'er/add-sh-mode-expansions)
(add-hook 'sh-mode-hook 'er/add-sh-mode-expansions)


(setq counsel-ag-base-command '("ag" "--skip-vcs-ignores" "--vimgrep" "%s"))

(er/mark-word)
(er/mark-next-accessor)
(er/mark-method-call)
(looking-at "\\sw")aaaaa
/home/owner/emacs.d/init.elaa

(er/looking-back-on-line "\\w")
(looking-back "\\w")
(
  init init test/init.init
  )



(progn
  (defun test(f &rest _)
    (let ((result))
      (print f)
      (print (list (region-beginning) (region-end)))
      (setq result (apply f _))
      (print (list (region-beginning) (region-end)))
      result
      ))
  (advice-add 'er/mark-word :around #'test)
  (advice-add 'er/mark-symbol :around #'test)
  (advice-add 'er/mark-symbol-with-prefix :around #'test)
  (advice-add 'er/mark-next-accessor :around #'test)
  (advice-add 'er/mark-method-call :around #'test)
  (advice-add 'er/mark-line :around #'test)
  (advice-add 'er/mark-inside-quotes :around #'test)
  (advice-add 'er/mark-outside-quotes :around #'test)
  (advice-add 'er/mark-inside-pairs :around #'test)
  (advice-add 'er/mark-outside-pairs :around #'test)
)
(progn
  (advice-remove 'er/mark-word  #'test)
  (advice-remove 'er/mark-symbol  #'test)
  (advice-remove 'er/mark-symbol-with-prefix  #'test)
  (advice-remove 'er/mark-next-accessor  #'test)
  (advice-remove 'er/mark-method-call  #'test)
  (advice-remove 'er/mark-line  #'test)
  (advice-remove 'er/mark-inside-quotes  #'test)
  (advice-remove 'er/mark-outside-quotes  #'test)
 t (advice-remove 'er/mark-inside-pairs  #'test)
  (advice-remove 'er/mark-outside-pairs  #'test)
)

(defun er/mark-line ()
  "Mark the entire line from beginning to end."
  (interactive)
  (beginning-of-line)
  (set-mark (point))
  (end-of-line)
  ;; This ensures the mark is activated for visual feedback
  (exchange-point-and-mark))

(defun er/mark-slash ()
  "Mark the current symbol (including slashes) until the next non-symbol character or space."
  (interactive)
  (let ((symbol-regexp "\\(\\s_\\|\\sw\\|/\\)+"))
    (when (or (looking-at symbol-regexp)
            (er/looking-back-on-line symbol-regexp))
      (print "yes1")
      (skip-syntax-backward "/")
      (set-mark (point))
      (when (looking-at symbol-regexp)
        (print "yes2")
        (goto-char (match-end 0)))
      (exchange-point-and-mark))))

(setq er/try-expand-list)
(require 'expand-region)
(setq-local er/try-expand-list
      (append '(er/mark-word
                er/mark-symbol
                ;;er/mark-symbol-with-prefix
                er/mark-method-call
                er/mark-next-accessor
                ;;er/mark-slash
                 

                er/mark-line
                 
                er/mark-inside-quotes
                er/mark-outside-quotes
                er/mark-inside-pairs
                er/mark-outside-pairs
                er/mark-comment
                er/mark-url
                er/mark-email
                er/mark-defun)
                er/try-expand-list))

```

```bash
#!/bi/bash



```

```python
#!/bin/bash


x = xxx + bnhdbb(test)*aaaa, cccc

(print (syntax-table))

```

```elisp

;; shift選択した状態をmarkで選択した状態に変更する
(defun my/mark-enable()
  (interactive)
  (if (region-active-p)
    (let ((start (region-beginning))
           (end (region-end)))
      ;; expand-regionの独自拡張対策
      (advice-remove 'handle-shift-selection #'my/unset-mark-on-next-move)
      ;; 通常のshift選択用
      (deactivate-mark)
      (set-mark-command nil)
      (goto-char start)
      (set-mark-command nil)
      (goto-char end)
      (message "Mark enabled"))))

;; hook handle-shift-selectionの実行
(run-hooks 'handle-shift-selection)

;; リージョン選択の前後を入れ替える
(defun my/exchange-point-and-mark()
  (interactive)
  ;; expand-regionの独自拡張対策
  (advice-remove 'handle-shift-selection #'my/unset-mark-on-next-move)
  (exchange-point-and-mark))
  
(search-backward-regexp "(\\|\\[\\|{")
(search-forward-regexp ")\\|\\]\\|}")
[]
testaaaaaa-test

(defun p() (interactive)(print "yes"))
(add-hook 'handle-shift-selection 'p)
(remove-hook 'handle-shift-selection 'p)
(remove-hook 'handle-shift-selection 'p)
(advice-add 'handle-shift-selection :before #'p)
(advice-remove 'handle-shift-selection  #'p)
(advice-remove 'handle-shift-selection #'my/unset-mark-on-next-move)
(advice-get 'handle-shift-selection )
;; C-wに割り当てる
(bind-keys :map global-map
  ("C-w" . my/mark-enable)
  ("C-a" . my/exchange-point-and-mark)
  ("M-<left>" . (lambda (&rest _)
                  (interactive)
                  ;; (print (and shift-select-mode this-command-keys-shift-translated))
                  ;; (print mark-active)
                  (search-backward-regexp "(\\|\\[\\|{")
                  (handle-shift-selection)))
  ("M-<right>" . (lambda (&rest _)
                  (interactive)
                  ;; (print (and shift-select-mode this-command-keys-shift-translated))
                  ;; (print mark-active)
                  (search-forward-regexp ")\\|\\]\\|}")
                  (handle-shift-selection)))
  )
(consult-ag "~/note.d" "mdcodrun hook")
(consult-line "*" (point-min))
(setq consult-line-start-from-top nil)

```

```elisp

(defun my-consult-query-transform (input &rest _)
  "Transform spaces in INPUT to asterisks."
  (print "yes")
  (replace-regexp-in-string " " "*" input))


(defun my-consult-line ()
  "Consult line with space-to-asterisk transformation."
  (interactive)
  ;;(cl-letf (((symbol-function 'consult--read) #'my-consult-query-transform))
  (cl-letf (((symbol-function 'consult--regexp-compiler) #'my-consult-query-transform))
    ;;(consult-line)))
    (consult-buffer)))

(advice-add 'consult--regexp-compiler :around #'my-consult-query-transform)
(advice-remove 'consult--regexp-compiler  #'my-consult-query-transform)
(provide 'my-consult-line)
(toggle-input-method)

(defun my/replace-space2asterisk(f &rest args)
  (let ((result (apply f args)))
    (replace-regexp-in-string " " "*" result)
    ))


(defun my/add-narrow(f &rest args)
  (print args)
  (let ((result (apply f  (append args (list :narrow '())))))
    result
  ))

(append (list 1 2 3) (list 4))
(list (consult--source-hidden-buffer consult--source-modified-buffer consult--source-buffer consult--source-recent-file consult--source-file-register consult--source-bookmark consult--source-project-buffer-hidden consult--source-project-recent-file-hidden) :require-match confirm-after-completion :prompt "Switch to: " :history consult--buffer-history :sort nil)

test-completion
(keymap)

(advice-add 'exit-minibuffer :before (lambda (&rest _)(print "yes")))
(advice-add 'exit-minibuffer :before
  (lambda (&rest _)
    (print "yes")
    ;;(advice-remove 'test-completion  #'my/test-completion)
    (advice-remove 'minibuffer-contents-no-properties  #'my/test-completion2)
    ))



(defun my/test-completion(f content &rest args)
  (print (replace-regexp-in-string " " "*" content))
  (apply f (replace-regexp-in-string " " "*" content) args ))

(advice-add 'test-completion :around #'my/test-completion)
(advice-remove 'test-completion  #'my/test-completion)


(defun my/test-completion2(f &rest args)
  ;;(print (replace-regexp-in-string " " "*" content))
  (replace-regexp-in-string " " "*" (apply f  args )))


(advice-add 'minibuffer-contents-no-properties :around #'my/test-completion2)
(advice-remove 'minibuffer-contents-no-properties  #'my/test-completion2)

(defun test(&rest _)
  (print "yes")
  ;;(advice-remove 'test-completion  #'my/test-completion)
  (advice-remove 'minibuffer-contents-no-properties  #'my/test-completion2)
  )
vertico-exit
(advice-add 'vertico-exit :before #'test)

(defun my/replace-space2asterisk(f &rest args)
  (let ((result (apply f args)))
    (replace-regexp-in-string " " "*" result)
    ))
(advice-add 'minibuffer-contents-no-properties :around #'my/replace-space2asterisk)
(advice-remove 'minibuffer-contents-no-properties  #'my/replace-space2asterisk)
(advice-add 'consult--multi :around #'my/add-narrow)
(advice-remove 'consult--multi  #'my/add-narrow)

(setq completion-ignore-case t)

(replace-regexp-in-string "t" "a" "test")

(consult-buffer)

comp-ctxt

(print completion-in-region)
(completion-in-region (point) (1+ (point)))

(corfu-complete)
(print completion-at-point-functions)
(advice--p 'corfu-complete)

(consult-ag--builder "test")

(advice-mapc #'print #'corfu-complete)
(advice-mapc #'print #'complete)
(advice-mapc #'print #'comint-dynamic-complete)
(advice-mapc #'print #'completion-at-point-functions)
(advice-mapc #'print #'comint-completion-at-point)
(advice-mapc #'print #'corfu--exit-function)
(advice-mapc #'print #'corfu--done)
(print #'corfu--exit-function)


(defun test(&rest _)
  (print "yes")
  ;;(print (backtrace-frame 9))
  (print completion-extra-properties)
  )
(advice-add #'insert :before #'test)
(advice-remove #'insert  #'test)



(print pcomplete-suffix-list)
(require 'comint)
(comint-dynamic-complete)
(setq comint-redirect-completed nil)

(character 47)
(char 47)

(print company-after-completion-hook nil)
(print company-after-completion-hook)
```


```elisp : cape.el:850付近
                 (lambda (input)
                   (let ((cands (cape--company-call backend 'candidates input)))
                     ;; The candidate string including text properties should be
                     ;; restored in the :exit-function, if the UI does not
                     ;; guarantee this itself.  Restoration is not necessary for
                     ;; Corfu since the introduction of `corfu--exit-function'.
                     (unless (and (bound-and-true-p corfu-mode) (fboundp 'corfu--exit-function))
                       (setq restore-props cands))
                     (cons (apply-partially valid input) cands))))
                :category backend
                :sort (not (cape--company-call backend 'sorted))))
              :exclusive 'no
              :company-prefix-length (cdr-safe prefix)
              :company-doc-buffer (lambda (x) (cape--company-call backend 'doc-buffer x))
              :company-location (lambda (x) (cape--company-call backend 'location x))
              :company-docsig (lambda (x) (cape--company-call backend 'meta x))
              :company-deprecated (lambda (x) (cape--company-call backend 'deprecated x))
              :company-kind (lambda (x) (cape--company-call backend 'kind x))
              :annotation-function (lambda (x)
                                     (when-let (ann (cape--company-call backend 'annotation x))
                                       (concat " " (string-trim ann))))
              :exit-function (lambda (x _status)
                               ;; Restore the candidate string including
                               ;; properties if restore-props is non-nil.  See
                               ;; the comment above.
                               (setq x (or (car (member x restore-props)) x))
                               (cape--company-call backend 'post-completion x)))))))
```


```elisp
;; consultで*を打つのがめんどくさいので、" "を"*"に変換する

;; " "->"*"変換+先頭に"*"を追加
(defun my/minibuffer-contents-no-properties(f &rest args)
    (concat "*" (replace-regexp-in-string " " "*" (apply f  args ))))
  

(defun my/cancel-advice--minibuffer-contents-no-properties(&rest args)
  (advice-remove 'minibuffer-contents-no-properties  #'my/minibuffer-contents-no-properties))

;; advice関数
(defun my/advice-smart-consult(f &rest args)
  ;; C-gでキャンセルの場合も解除
  (let ((result))
    (unwind-protect
      (progn
        ;; minibuffer-contents-no-propertiesにアドバイスを追加し実行後解除する
        (advice-add 'minibuffer-contents-no-properties :around #'my/minibuffer-contents-no-properties)
        ;; verico-exitの中で上記を解除する（解除しないとenterで確定できない
        (advice-add 'vertico-exit :before #'my/cancel-advice--minibuffer-contents-no-properties)
        (advice-add 'minibuffer-contents-no-properties :around #'my/minibuffer-contents-no-properties)
        (setq result (apply f args)))
      (progn
        (advice-remove 'minibuffer-contents-no-properties  #'my/minibuffer-contents-no-properties)
        (advice-remove 'vertico-exit  #'my/cancel-advice--minibuffer-contents-no-properties))
      result)
    ))


(advice-add 'consult-line   :around  #'my/advice-smart-consult)
(advice-add 'consult-buffer :around  #'my/advice-smart-consult)
(advice-add 'consult-yank-pop :around  #'my/advice-smart-consult)
(advice-remove 'consult-line       #'my/advice-smart-consult)
(advice-remove 'consult-buffer     #'my/advice-smart-consult)
(advice-add 'consult-ag   :around  #'my/advice-smart-consult)
(advice-remove 'consult-ag  #'my/advice-smart-consult)

(setq vertico-preselect 'prompt)

(defun consult-ag (&optional target initial)
  "Consult ag for query in TARGET file(s) with INITIAL input."
  (interactive)
  (print initial)
  (pcase-let* ((`(,prompt ,paths ,dir) (consult--directory-prompt "Consult ag: " target))
               (default-directory dir))
    (consult--read (consult--async-command #'consult-ag--builder
                     (consult--async-map #'consult-ag--format))
                   :prompt prompt
                   :lookup #'consult--lookup-member
                   :state (consult-ag--grep-state)
                   :initial (consult--async-split-initial initial)
                   :require-match t
                   :category 'file
                   :sort nil)))

(defun consult-ag--builder (input)
  "Build command line given INPUT."
  (print input)
  (pcase-let* ((cmd (split-string-and-unquote "ag --vimgrep"))
               (`(,arg . ,opts) (consult--command-split input)))
    `(,@cmd ,@opts ,arg ".")))



(consult-ag--builder "test")
(list "ag" "--vimgrep" "--skip-vcs-ignores" "--ignore" "*~")

;; 一時的に元の関数 y を保存する変数を用意
(defvar _original/consult-ag--builder (symbol-function 'consult-ag--builder))

(defun my/consult-ag--builder(&rest args)
  ;;(message "yes")
  (funcall _original/consult-ag--builder  args))

(cl-letf* (
            ((symbol-function 'consult-ag--builder) #'my/consult-ag--builder))
  (consult-ag))

(consult-ag--builder "")

(popup-page-next 'popup)
(ac-show-menu)
(print ac-menu)

(vertico-next-group)
(vertico)
(vertico-posframe-get-size (current-buffer))
(message "%s" (vertico-posframe-get-size vertico-posframe--buffer))

(scroll-down-command)
(consult-n)
(cl-defun consult--read-1 (table &key
                                 prompt predicate require-match history default
                                 keymap category initial narrow add-history annotate
                                 state preview-key sort lookup group inherit-input-method)
  "See `consult--read' for the documentation of the arguments."
  ;;(message "yes")
  (consult--minibuffer-with-setup-hook
      (:append (lambda ()
                 (add-hook 'after-change-functions #'consult--tofu-hide-in-minibuffer nil 'local)
                 (consult--setup-keymap keymap (consult--async-p table) narrow preview-key)
                 (setq-local minibuffer-default-add-function
                             (apply-partially #'consult--add-history (consult--async-p table) add-history))))
    (consult--with-async (async table)
      (consult--with-preview
          preview-key state
          (lambda (narrow input cand)
            (funcall lookup cand (funcall async nil) input narrow))
          (apply-partially #'run-hook-with-args-until-success
                           'consult--completion-candidate-hook)
          (pcase-exhaustive history
            (`(:input ,var) var)
            ((pred symbolp)))
        ;; Do not unnecessarily let-bind the lambdas to avoid over-capturing in
        ;; the interpreter.  This will make closures and the lambda string
        ;; representation larger, which makes debugging much worse.  Fortunately
        ;; the over-capturing problem does not affect the bytecode interpreter
        ;; which does a proper scope analysis.
        (let* ((metadata `(metadata
                           ,@(when category `((category . ,category)))
                           ,@(when group `((group-function . ,group)))
                           ,@(when annotate
                               `((affixation-function
                                  . ,(apply-partially #'consult--read-affixate annotate))
                                 (annotation-function
                                  . ,(apply-partially #'consult--read-annotate annotate))))
                           ,@(unless sort '((cycle-sort-function . identity)
                                            (display-sort-function . identity)))))
               (consult--annotate-align-width 0)
               (selected
                (completing-read
                 prompt
                 (lambda (str pred action)
                   (let ((result (complete-with-action action (funcall async nil) str pred)))
                     (if (eq action 'metadata)
                         (if (and (eq (car result) 'metadata) (cdr result))
                             ;; Merge metadata
                             `(metadata ,@(cdr metadata) ,@(cdr result))
                           metadata)
                       result)))
                 predicate require-match initial
                 (if (symbolp history) history (cadr history))
                 default
                 inherit-input-method)))
          ;; Repair the null completion semantics. `completing-read' may return
          ;; an empty string even if REQUIRE-MATCH is non-nil. One can always
          ;; opt-in to null completion by passing the empty string for DEFAULT.
          (when (and (eq require-match t) (not default) (equal selected ""))
            (user-error "No selection"))
          selected)))))

(progn
  (message "yes")
  (message "yes2"))
(defun vertico--exhibit (&rest _)
  "Exhibit completion UI."
  (message "yes2")
  (let ((buffer-undo-list t)) ;; Overlays affect point position and undo list!
    (message "yes5")
    (vertico--update 'interruptible)
    (message "yes6")
    (vertico--prompt-selection)
    (message "yes7")
    (vertico--display-count)
    (message "yes8")
    (vertico--display-candidates (vertico--arrange-candidates))
    (message "yes4")
    ))
(defun vertico--update (&optional interruptible)
  "Update state, optionally INTERRUPTIBLE."
  (let* ((pt (max 0 (- (point) (minibuffer-prompt-end))))
         (content (minibuffer-contents-no-properties))
         (input (cons content pt)))
    (unless (or (and interruptible (input-pending-p)) (equal vertico--input input))
      ;; Redisplay to make input immediately visible before expensive candidate
      ;; recomputation (gh:minad/vertico#89).  No redisplay during init because
      ;; of flicker.
      (when (and interruptible (consp vertico--input))
        ;; Prevent recursive exhibit from timer (`consult-vertico--refresh').
        (cl-letf (((symbol-function #'vertico--exhibit) #'ignore)) (redisplay)))
      (pcase (let ((vertico--metadata (completion-metadata (substring content 0 pt)
                                                           minibuffer-completion-table
                                                           minibuffer-completion-predicate)))
               ;; If Tramp is used, do not compute the candidates in an
               ;; interruptible fashion, since this will break the Tramp
               ;; password and user name prompts (See gh:minad/vertico#23).
               (if (or (not interruptible)
                       (and (eq 'file (vertico--metadata-get 'category))
                            (or (vertico--remote-p content) (vertico--remote-p default-directory))))
                   (vertico--recompute pt content)
                 (let ((non-essential t))
                   (while-no-input (vertico--recompute pt content)))))
        ('nil (abort-recursive-edit))
        ((and state (pred consp))
         (setq vertico--input input)
          (dolist (s state) (set (car s) (cdr s))))))))


(cl-defgeneric vertico--prepare (&rest _)
  "Ensure that the state is prepared before running the next command."
  (when (and (symbolp this-command) (string-prefhix-p "vertico-" (symbol-name this-command)))
    (vertico--update)))

(consult-ag :INTIAL "a")
(consult-ag--builder "test")

(setf org_message #'message)
;;;###autoload
(defun consult-ag (&optional target initial)
  "Consult ag for query in TARGET file(s) with INITIAL input."
  (interactive)
  (setq xxx "yes")
  (apply org_message (list initial))
  (pcase-let* ((`(,prompt ,paths ,dir) (consult--directory-prompt "Consult ag: " target))
               (default-directory dir))
    (consult--read (consult--async-command #'consult-ag--builder
                     (consult--async-map #'consult-ag--format))
                   :prompt prompt
                   :lookup #'consult--lookup-member
                   :state (consult-ag--grep-state)
      :initial (consult--async-split-initial initial)
      ;;:initial initial
                   :require-match t
                   :category 'file
      :sort nil)))
(consult-ag--format "test")
(apply org_message '("yes"))
(print xxx)
```



```elisp

(defun setup-cape-dict (dict-file)
  "Set up cape-dict with the specified DICT-FILE."
  (setq-local cape-dict-file dict-file)
  ;; (setq-local completion-at-point-functions
  ;;   (list #'cape-dict))
  (add-hook 'completion-at-point-functions #'cape-dict)
  )

(defun my/tex-mode-setup ()
  "Set up cape-dict for text-mode."
  (setup-cape-dict "/path/to/text-mode-dictionary.txt"))

(remove-hook 'text-mode-hook nil)
(remove-hook 'tex-mode-hook nil)

(make-local-variable 'tex-mode-hook)
(add-hook 'plain-tex-mode-hook
  (lambda (&rest _)
    (print "yes")
    (make-local-variable 'completion-at-point-functions)
    (setup-cape-dict
      (locate-user-emacs-file "files/dictionary-tex.txt"))))

(defun my-prog-mode-setup ()
  "Set up cape-dict for prog-mode."
  (setup-cape-dict "/path/to/prog-mode-dictionary.txt"))

(add-hook 'text-mode-hook #'my-text-mode-setup)
(add-hook 'prog-mode-hook #'my-prog-mode-setup)

(corfu-prescient-mode -1)


(leaf orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides nil)

  (with-eval-after-load 'migemo
    ;; orderlessをmigemo対応
    (defun orderless-migemo (component)
      (let ((pattern (downcase (migemo-get-pattern component))))
        (condition-case nil
            (progn (string-match-p pattern "") pattern)
          (invalid-regexp nil))))
    (add-to-list 'orderless-matching-styles 'orderless-migemo))

  (with-eval-after-load 'corfu
    (defun orderless-fast-dispatch (word index total)
      (and (= index 0) (= total 1) (length< word 3)
           `(orderless-regexp . ,(concat "^" (regexp-quote word)))))

    (orderless-define-completion-style orderless-fast
      (orderless-style-dispatchers '(orderless-fast-dispatch))
      (orderless-matching-styles '(orderless-flex)))

    (add-hook 'corfu-mode-hook
              (lambda ()
                (setq-local corfu-auto-delay 0
                            corfu-auto-prefix 1
                  compleion-styles '(orderless-fast basic))))))



;; Abbrev mode を有効にする
(setq-default abbrev-mode t)


;; 変更を保存するファイルを指定
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")

;; 保存された abbrev を読み込む
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

;; 定義された abbrev を保存
(setq save-abbrevs 'silently)

;; Abbrev 定義を追加
(define-abbrev-table 'global-abbrev-table '(
    ("ba" "testtesttest2" nil 0)
    ("aa" "testtesttest" nil 0)
    ("()" "\\left(\\right)" nil 0)
    ("__" "\\left(\\right)" nil 0)
    ("kk" "\\left(\\right)" nil 0)
    ("[]" "\\left(\\right)" nil 0)
))

(add-hook 'completion-at-point-functions #'cape-abbrev)

(setq-local completion-at-point-functions
  (list (cape-capf-super #'cape-dabbrev
          #'cape-abbrev 
          ;; Python専用のキーワード補完を追加
          (cape-capf-buster #'python-keywords))))

testtesttest2
\left(\right)

testtesttest
testtesttest2

kkkk


__

testtesttest

testtesttest2
__

(let()
  (modify-syntax-entry ?\( "w")
  (modify-syntax-entry ?\) "w")
)
\left(\right)
\left(\right)
\left( \right)



```


```elisp

(consult-line-multi t "hello")

```



```html
<!DOCTYPE html>
<!-- SlickGridを使ってcsvを表示する。getパラメータでcsvファイル名を指定する -->
<html>
<head>
  <meta charset="utf-8">
  <title>CSV Viewer</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slickgrid/2.3.6/slick.grid.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slickgrid/2.3.6/slick-default-theme.css">
  <style>
    .slick-cell {
      padding: 0px;
      margin: 0px;
    }
  </style>
  <script>
    function loadCSV() {
      var url = new URL(window.location.href);
      var csv = url.searchParams.get("csv");
      if (!csv) {
        alert("csv parameter is required.");
        return;
      }
      var grid;
      var columns = [];
      var data = [];
      var options = {
        enableCellNavigation: true,
        enableColumnReorder: false
      };
      var req = new XMLHttpRequest();
      req.open("GET", csv);
      req.onload = function() {
        var lines = req.responseText.split("\n");
        columns = lines[0].split(",");
        for (var i = 1; i < lines.length; i++) {
          var values = lines[i].split(",");
          var row = {};
          for (var j = 0; j < columns.length; j++) {
            row[columns[j]] = values[j];
          }
          data.push(row);
        }
        grid = new Slick.Grid("#myGrid", data, columns, options);
      };
      req.send();
    }
    function init() {
      loadCSV();
    }

    window.onload = init;     
</script>
</head>
<body>
  <div id="myGrid" style="width:100%;height:500px;"></div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slickgrid/2.3.6/slick.core.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slickgrid/2.3.6/slick.grid.js"></script>
</body>
</html>
```


```elisp
(straight-use-package '(fussy :type git :host github :repo "jojojames/fussy"))
;; (straight-use-package '(flx-rs :repo "jcs-elpa/flx-rs" :fetcher github :files (:defaults "bin")))
(straight-use-package '(fzf-native :repo "dangduc/fzf-native" :host github :files (:defaults "bin")))
;; (straight-use-package '(fuz-bin :repo "jcs-elpa/fuz-bin" :fetcher github :files (:defaults "bin")))
;; (straight-use-package 'liquidmetal)
;; (straight-use-package '(sublime-fuzzy :repo "jcs-elpa/sublime-fuzzy" :fetcher github :files (:defaults "bin")))
;; (straight-use-package 'hotfuzz)
;; (straight-use-package 'orderless)

(require 'fussy)

(setq completion-styles '(fussy)
      completion-category-defaults nil
      compleiton-category-overrides nil
      ;;fussy-score-fn #'flx-score
      ;; fussy-score-fn 'flx-rs-score
      ;;fussy-score-fn 'fussy-fzf-native-score
      ;; fussy-score-fn 'fussy-fuz-bin-score
      ;; fussy-score-fn 'fussy-liquidmetal-score
      ;; fussy-score-fn 'fussy-sublime-fuzzy-score
      ;; fussy-score-fn 'fussy-hotfuzz-score
      ;; fussy-filter-fn 'fussy-filter-flex
      ;;fussy-filter-fn 'fussy-filter-default
      ;; fussy-filter-fn 'fussy-filter-orderless-flex
      ;;fussy-filter-fn 'fussy-filter-orderless
      ;;fussy-filter-fn 'fussy-filter-flex
      )

(leaf fussy
  :el-get (
    jojojames/fussy
    :type github
    :pkgname "jojojames/fussy"
    ;;:branch "main"
            )
  :ensure t
  (setq completion-styles '(fussy)
      completion-category-defaults nil
      compleiton-category-overrides nil)
  )

(print completion-styles)
(add-hook 'vertico-mode-hook
  (lambda (&rest _)
        ;;(message "yessssssssss" )
        (setq-local completion-styles '(basic partial-completion emacs22))
    ))

(remove-hook 'vertico-posframe-mode-hook nil)
(remove-hook 'vertico-mode-hook nil)
(setq completion-styles '(basic partial-completion emacs22))

(setq completion-styles '(basic partial-completion emacs22))

(vertico--filter-completions

```


```tex


(add-hook 'tex-mode-hook
  (lambda ()
    ;; (modify-syntax-entry ?\( "w")
    ;; (modify-syntax-entry ?\) "w")
    (modify-syntax-entry ?\\ "w")
    ))
    
(add-hook 'tex-mode-hook (lambda () (modify-syntax-entry ?\) "w")))
(add-hook 'tex-mode-hook (lambda () (modify-syntax-entry ?\\ "w")))
(let()
  (modify-syntax-entry ?\( "w")
  (modify-syntax-entry ?\) "w")
  )
testtesttest
left
ensure    
(print major-mode)
(setq major-mode nil)

```


```elisp

  (define-minor-mode my/buffer-switch-mode
    "My custom minor mode example."
    :lighter " MyCustom"
    :keymap  '() 
    :global t
    )

  (defvar my/buffer-switch--buffer-list nil)
  (defvar my/buffer-switch--buffer-list-index 0)

  ;; 除外するバッファリスト
  (defvar my/buffer-switch--exclude-buffer-regexp
    '("\\*ivy-.*" "\\*Minibuf.*" "^helm.*" ".*completion.*" "\\*Echo"
       "\\*copilot-" "\\*corfu" "\\*company" "\\*eldoc" "\\*migemo"))
  
  (defun my/buffer-switch--buffer-list-function()
    ;; minibufferやivyバッファを除外する
    (cl-remove-if
      (lambda (x)
        (cl-some
          (lambda (y)
            (string-match y (buffer-name x)))
          my/buffer-switch--exclude-buffer-regexp))
          (cl-remove-duplicates
            ;;(append (nth 0 (window-prev-buffers)) (buffer-list))
            (append (mapcar #'car (window-prev-buffers)) (buffer-list))
            :test 'eq))
    )
  
  (defun my/buffer-switch-mode-hook-init(&rest _)
    ;; (window-prev-buffers)と(buffer-list)のユニークなリスト
    (setq my/buffer-switch--buffer-list (my/buffer-switch--buffer-list-function))
    (setq my/buffer-switch--buffer-list-index 0)
    (add-hook 'pre-command-hook #'my/buffer-switch-mode--cancel)
    (global-my/buffer-switch-mode 1)
    )

  (defun my/buffer-switch-mode-hook-exit(&rest _)
    ;; (window-prev-buffers)と(buffer-list)のユニークなリスト
    (setq my/buffer-switch--buffer-list nil)
    (setq my/buffer-switch--buffer-list-index 0)
    (remove-hook 'pre-command-hook #'my/buffer-switch--cancel)
    (global-my/buffer-switch-mode -1)
    )
  (defun my/buffer-switch-next()
    (interactive)
    (print my/buffer-switch--buffer-list-index)
    (setq my/buffer-switch--buffer-list-index
      (mod (1+ my/buffer-switch--buffer-list-index)
        (length my/buffer-switch--buffer-list)))
    (switch-to-buffer (nth my/buffer-switch--buffer-list-index my/buffer-switch--buffer-list))
    )
  (defun my/buffer-switch-prev()
    (interactive)
    (setq my/buffer-switch--buffer-list-index
      (mod (1- my/buffer-switch--buffer-list-index)
        (length my/buffer-switch--buffer-list)))
    (switch-to-buffer (nth my/buffer-switch--buffer-list-index my/buffer-switch--buffer-list))
    )
  (bind-keys :map my/buffer-switch-mode-map
    ( "C-<tab>" . my/buffer-switch-next)
    ( "C-<iso-lefttab>" . my/buffer-switch-prev)
    )
  
  (defun my/buffer-switch--cancel(&rest _)
    (interactive)
    ;; (this-command-keys)がC-<tab>かチェック
    (print (this-command-keys))
    (unless (or
          (equal (kbd "C-<tab>") (this-command-keys))
          (equal (kbd "C-<iso-lefttab>") (this-command-keys)))
      ;;(my/buffer-switch-mode -1)
      (my/buffer-switch-mode-hook-exit)
      )
    )
  (define-globalized-minor-mode global-my/buffer-switch-mode my/buffer-switch-mode my/buffer-switch-mode-on)

  (defun my/buffer-switch-mode-on ()
    "Enable `my/buffer-switch-mode'."
    (unless (minibufferp)
      (my/buffer-switch-mode 1)))

  (defun my/buffer-switch(&optional _)
    (interactive)
    (my/buffer-switch-mode-hook-init)
    (my/buffer-switch-next))


```


```elisp
(leaf yaml-mode
  :ensure t
  :config
  (require 'yaml-mode)
  )

```

# ansibleでdockerをセットアップ



```hosts
43.206.95.230  webservers
```

```config
[webservers]
43.206.95.230

[webservers:vars]
ansible_port=22
ansible_user=ubuntu
#ansible_ssh_pass=(パスワード)
#ansible_ssh_private_key_file=/ssh/ubuntu-test2.pem

```

```bash
#!/bin/bash
cd $(mktemp -d)
~/bin/mdcoderun --show --index [::index-2::] [::mdpath::] > hosts
~/bin/mdcoderun --show --index [::index-1::] [::mdpath::] > ubuntu.net
~/bin/mdcoderun --show --index [::index+1::] [::mdpath::] > ubuntu.yml
~/bin/mdcoderun --show --index [::index+2::] [::mdpath::] > Dockerfile
# docker build -t local/ansible .
# exit 
docker run -it --rm --name ansible      \
       -v /home:/home                   \
       -v /tmp:/tmp/host                \
       -v /mnt:/mnt                     \
       -e HOME=$HOME                    \
       -e DISPLAY=$DISPLAY              \
       -e GTK_IM_MODULE=$GTK_IM_MODULE  \
       -e QT_IM_MODULE=$QT_IM_MODULE    \
       -e LANG=C.UTF-8                  \
       -e LANGUAGE=en_US:               \
       -e XMODIFIERS=$XMODIFIERS        \
       -v /etc/passwd:/etc/passwd:ro    \
       -v /etc/group:/etc/group:ro      \
       -v /etc/shadow:/etc/shadow:ro    \
       -v ./hosts:/etc/hosts            \
       -v $(pwd):$(pwd)                 \
       -w $(pwd)                        \
       --network=host                   \
       --user $(id -u):$(id -g)         \
       local/ansible bash
       #local/ansible ansible-playbook -i ubuntu.net ubuntu.yml
       
#       -v ~/Downloads/ubuntu-test2.pem:/ssh/ubuntu-test2.pem \
#       -v ~/ubuntu-test3.pem:/ssh/ubuntu-test2.pem \
# ls /mnt/c/Users/oonishi/Downloads/ubuntu-g4-3.pem
# ssh-agent bash
# cat /mnt/c/Users/oonishi/Downloads/ubuntu-g4-3.pem|ssh-add -
# ssh -l ubuntu 43.206.95.230
```

```yml
---
- name: Install Docker on Ubuntu
  hosts: all
  become: yes
  tasks:
    - name: Add docker GPG key
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
      become: yes
    
    - name: Install basic list of packages
      apt:
        name: "{{ packages }}"
        state: present
        update_cache: yes
      vars:
        packages:
          - apt-transport-https
          - ca-certificates
          - curl
          - gnupg-agent
          - software-properties-common
      become: yes
    
    - name: Add apt repository
      apt_repository:
        repo: "deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ ansible_distribution_release }} stable"
      become: yes
    
    - name: Install Docker packages
      apt:
        name: "{{ packages }}"
        state: present
      vars:
        packages:
          - docker-ce
          - docker-ce-cli
          - containerd.io
      become: yes
    
    - name: Add user to docker group
      user:
        name: "{{ ansible_user }}"
        groups: docker
        append: yes
      become: yes
    
    - name: Ensure docker service is enabled
      systemd:
        name: docker
        state: started
        enabled: yes
      become: yes
    
    - name: Install docker-compose
      get_url:
        url: "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-{{ ansible_system | lower }}-{{ ansible_architecture }}"
        dest: /usr/local/bin/docker-compose
        mode: +x
      become: yes

    - name: Create a directory for Dockerfile
      file:
        path: /opt/docker_build
        state: directory

    - name: Upload Dockerfile
      copy:
        src: ./Dockerfile
        dest: /opt/docker_build/Dockerfile

    - name: Build Docker image
      command: docker build -t my_docker_image /opt/docker_build

    - name: Remove Dockerfile from remote host
      file:
        path: /opt/docker_build/Dockerfile
        state: absent
    - name: Add Docker’s official GPG key
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Add Docker APT repository
      apt_repository:
        repo: deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
        state: present
        update_cache: yes

    - name: Install Docker CE
      apt:
        name: docker-ce
        state: present

    - name: Add the nvidia-docker repository
      shell: |
        distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
        curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
        curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

    - name: Install NVIDIA Docker toolkit
      apt:
        name: nvidia-docker
        state: present
        update_cache: yes

    - name: Restart Docker
      service:
        name: docker
        state: restarted
```

```Dockerfile
FROM python:3.10
RUN pip install ansible

```


```Dockerfile
# Dockerfile example
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y nginx
CMD ["nginx", "-g", "daemon off;"]

```

```yml
---
- name: Install curl on Ubuntu
  hosts: all
  become: yes
  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes

    - name: Install curl
      apt:
        name: curl
        state: present
```



```bash
#!/bin/bash
cd $(mktemp -d)
~/bin/mdcoderun --show --index [::index-1::] [::mdpath::] > Dockerfile

docker build -t local/ansible . 

```

https://docs.conda.io/en/latest/miniconda.html
https://developer.nvidia.com/cuda-downloads?target_os=Windows

sudo apt install ubuntu-drivers-common
ubuntu-drivers devices
sudo apt install nvidia-headless-535-server

/home/ubuntu/anaconda3/bin/conda env create -f lip_env.yml

# end



```python
    accesskey = 's5djzIafhco8TFGnFi2yrFrn9'
    access_secret = 's00GxWoVdU8NF2w7dK75nTy5Qh0Glq1tu0kBgVI8'
    date: str = str(int(datetime.utcnow().replace(tzinfo=timezone.utc).timestamp()))
    data: str = json.dumps({
        'coefont': '2b174967-1a8a-42e4-b1ae-5f6548cfa05d', # 声の種類
        'text': script
    })
    signature = hmac.new(bytes(access_secret, 'utf-8'), (date+data).encode('utf-8'), hashlib.sha256).hexdigest()
    response = requests.post('https://api.coefont.cloud/v2/text2speech', data=data, headers={
        'Content-Type': 'application/json',
        'Authorization': accesskey,
        'X-Coefont-Date': date,
        'X-Coefont-Content': signature
    })
```

curl -X POST https://api.coefont.cloud/v2/text2speech \
    -H "Content-Type: application/json" \
    -H "Authorization: s5djzIafhco8TFGnFi2yrFrn9" \
    -H "X-Coefont-Date: GENERATED_DATE" \
    -H "X-Coefont-Content: GENERATED_SIGNATURE" \
    -d '{"coefont": "2b174967-1a8a-42e4-b1ae-5f6548cfa05d", "text": "SCRIPT"}'




```bash

cd $(mktemp -d -p /tmp/host)
docker run -it --rm --name anaconda3    \
       -v /home:/home                   \
       -v /mnt:/mnt                     \
       -v /tmp:/tmp/host                \
       -e HOME=$HOME                    \
       -e LANG=C.UTF-8                  \
       -e LANGUAGE=en_US:               \
       -v /etc/passwd:/etc/passwd:ro    \
       -v /etc/group:/etc/group:ro      \
       -v /etc/shadow:/etc/shadow:ro    \
       --network=host                   \
       --user $(id -u):$(id -g)         \
       -w $(pwd) \
       continuumio/anaconda3 bash 

```


```Dockerfile
FROM python:3.10
RUN pip install mediapipe opencv-python
RUN apt update -y
RUN apt install -y libgl-dev
RUN pip install streamlit
RUN pip install av
RUN pip install streamlit-webrtc
```


```bash
#!/bin/bash
cd $(mktemp -d)
~/bin/mdcoderun --show --index [::index-1::] [::mdpath::] > Dockerfile

docker build -t loycal/mediapipe . 

```

```bash
#!/bin/bash
cd $(mktemp -d)
~/bin/mdcoderun --show --index [::index-2::] [::mdpath::] > Dockerfile

ssh-agent bash <<EOF
cat /mnt/c/Users/oonishi/Downloads/ubuntu-g4-3.pem|ssh-add -
scp -r $(pwd) ubuntu@43.206.95.230:$(pwd)
ssh -l ubuntu 43.206.95.230 cd $(pwd) \&\& docker build -t local/mediapipe . 
#ssh -l ubuntu 43.206.95.230:$(pwd) docker build -t local/mediapipe . 
EOF

#docker build -t loycal/mediapipe . 

```

```bash
#!/bin/bash
cd $(mktemp -d)
~/bin/mdcoderun --show --index [::index+1::] [::mdpath::] > test.sh
cp ~/note.d/test0724_2.py ./

ssh-agent bash <<EOF
cat /mnt/c/Users/oonishi/Downloads/ubuntu-g4-3.pem|ssh-add -
scp -r $(pwd) ubuntu@43.206.95.230:$(pwd)
ssh -l ubuntu 43.206.95.230 cd $(pwd) \&\& bash test.sh
#ssh -l ubuntu 43.206.95.230:$(pwd) docker build -t loycal/mediapipe . 
EOF

#docker build -t loycal/mediapipe . 

```

```bash
#!/bin/bash
ln -s /tmp /tmp/host 
#cd $(mktemp -d -p /tmp/host)
#docker run -it --rm --name mediapipe    \

docker run -i --rm --name mediapipe    \
       -v /home:/home                   \
       -v /mnt:/mnt                     \
       -v $(pwd):$(pwd)                \
       -e HOME=$HOME                    \
       -e LANG=C.UTF-8                  \
       -e LANGUAGE=en_US:               \
       -v /etc/passwd:/etc/passwd:ro    \
       -v /etc/group:/etc/group:ro      \
       -v /etc/shadow:/etc/shadow:ro    \
       --network=host                   \
       --user $(id -u):$(id -g)         \
       -w $(pwd)                        \
       --gpus all \
       local/mediapipe  streamlit run test0724_2.py

#       local/mediapipe  streamlit run ~/note.d/test0724_2.py 
#       -v /tmp:/tmp/host                \
    
```



```bash
#!/bin/bash
cd $(mktemp -d)

ssh-agent bash <<EOF
cat /mnt/c/Users/oonishi/Downloads/ubuntu-g4-3.pem|ssh-add -
ssh -N -L 8501:localhost:8501  -l ubuntu 43.206.95.230
EOF

#docker build -t loycal/mediapipe . 

```

sudo apt install ubuntu-drivers-common

ubuntu-drivers devices

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-driver-535





$ wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb

$ sudo dpkg -i cuda-keyring_1.1-1_all.deb

$ sudo tee /etc/apt/sources.list.d/jammy.list << EOF
deb http://archive.ubuntu.com/ubuntu/ jammy universe
EOF

$ sudo tee /etc/apt/preferences.d/pin-jammy <<EOF
Package: *
Pin: release n=jammy
Pin-Priority: -10

Package: libtinfo5
Pin: release n=jammy
Pin-Priority: 990
EOF

$ sudo apt-get update

$ sudo apt-get -y install cuda-toolkit
