# test

- test1
- test2

## hello

```math
\begin{equation}
    y = \sin x  \label{eq:1}
\end{equation}

\begin{equation}
    y = \cos x  \label{eq:2}
\end{equation}

後半の数式~\eqref{eq:2} だけに数式番号が付く.

\end{document}
```



\[
\displaystyle f\left(x\right) = \int_0^{\infty} \frac{ \sum_{k=1}^nk}{ \prod_{k=1}^{n}k} \, dx
\]

$$ 
\displaystyle f(x) =  \int_0^{\infty} \frac{ \sum_{k=1}^n k}{\displaystyle \prod_{k=1}^n k} \, dx
$$

$$



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
\displaystyle
\int_{0}^{\infty}f\left(x\right) = \frac{e^{x}-1}{x^3 - 1}

```

```py
import win32com.client
# Excelを開始
excel = win32com.client.Dispatch("Excel.Application")
excel.Visible = True  # Excelを可視状態で開く

# ブックを開く
# \\172.16.19.171\大分県畜産共通システム基盤構築\233480_「大分県畜産共通システム構築」第２次開発\50_データ移行\03_データ分析\01_データ分析\子牛登記情報(令和６年出生分).xlsx
#book = excel.Workbooks.Open(r'C:\Users\oonishi\Downloads\県内家畜市場取引結果_玖珠子牛.xlsx')
#book = excel.Workbooks(r'コピー子牛登記情報(令和５年出生分).xlsx')
book = excel.Workbooks(r'子牛登記情報(令和６年出生分).xlsx')
#book = excel.Workbooks(r'母牛登録情報(令和４年、５年登録分).xlsx')
#book = excel.Workbooks(r'母牛異動情報(BOGYUIDO).xlsx')

sheet = book.Worksheets(2)

prev_c1 = prev_c2 = ""
for i in range(2, 330):
    # print(dir(sheet.Cells(5, i)))
    c1 = sheet.Cells(1, i).Formula or prev_c1
    if prev_c1 != c1:
        prev_c2 = ''
    prev_c1 = c1
    c2 = sheet.Cells(2, i).Formula or prev_c2
    prev_c2 = c2
    c3 = sheet.Cells(3, i).Formula

    colname = f'{c1}.{c2}.{c3}'.rstrip('.').replace('\n', '')

    f = sheet.Cells(5, i).Formula
    if not f: continue
    begin,last = f.split(",")[1:]
    last = last.rstrip(')')
    print(begin,last, f'{(i-1):03d}_{colname}', sep='\t')


```

日本語



emacsのweb-serverでPOSTパラメータを取り出す方法を教えて

(cl-letf* (
  (save-buffer-org #'write-file)
  (save-buffer (lambda (&rest args)
    (interactive)
    (write-file "/tmp/test.txt")
  )))
    (chatgpt-shell-save-session-transcript)
  )
(advice-add 'save-buffer :after 
  (lambda (&rest _)
    (print "yes")
  ))
(advice-remove 'save-buffer nil) 
(advice-remove 'write-file nil) 
(let ((buffer-file-name (format-time-string "/tmp/host/%Y%m%d%H%M%S.txt")))
  ;;(set-visited-file-name (format-time-string "/tmp/host/%Y%m%d%H%M%S.txt"))
  ;;(chatgpt-shell-save-session-transcript)
  ;;(chatgpt-shell-clear-buffer)
  (print (buffer-file-name))
)
(print buffer-file-name)

(read-file-name "/tmp/test.txt")    
(cl-letf* (
  (read-file-name-org #'read-file-name)
  (read-file-name (lambda (&rest args)
    (interactive)
    "/tmp/test.txt"
  )))
    (chatgpt-shell-save-session-transcript)
  )

(defun my/chatgpt-shell-save-and-clear()
  (interactive)
  (cl-letf(
      (ad/read-file-name
        (lambda (fn &rest args)
          (interactive)
          (expand-file-name 
            (format-time-string "~/transcripts/%Y%m%d%H%M%S.txt")))
      )
  )
    (advice-add 'read-file-name :around ad/read-file-name)
    (unwind-protect
      (progn 
        (chatgpt-shell-save-session-transcript)
        (chatgpt-shell-clear-buffer))
      (advice-remove 'read-file-name ad/read-file-name))
  )
)


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


(provide 'my/chatgpt-shell-save-and-clear)
(advice-remove 'write-file nil)
(advice-remove 'save-buffer nil)
  )
(expand-file-name "~/hello")
