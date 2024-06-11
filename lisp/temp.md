
```elisp
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
```



```elisp
(require 'web-server)

(defvar my/html-file-path (locate-user-emacs-file "files/katex.html")
  "Path to the HTML file to serve.")

(defun my/serve-html-file (proc)
  "Serve an HTML file for GET requests."
  (with-temp-buffer
    (insert-file-contents my/html-file-path)
    (ws-response-header proc 200 '("Content-Type" . "text/html"))
    (process-send-region proc (point-min) (point-max))))

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
       ;;(print "yes0")
      (with-slots (process headers) request
        ;;(let ((buffer-name (cdr (assoc "buffer" (ws-parse-qs (cdr (assoc "Content-Length" headers)))))))
        (let ((buffer-name (cdr (assoc "buffer" headers))))
        ;;(print buffer-name)
        ;;(print "yes")
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

;;(setq svr (ws-start 'my/web-server-handler 9001))
;;(ws-stop svr)

;;(locate-user-emacs-file "files/katex.html")

```
