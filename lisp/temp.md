# test

- test1
- test2

## hello

```math
f\left(x\right) = \int_0^{\infty} \frac{e^{x}-1}{x^2-6} dx

```



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

(leaf web-server
  :ensure t
  :config
  (defvar my/html-file-path (locate-user-emacs-file "files/katex.html")
    "Path to the HTML file to serve.")

  (defun my/serve-html-file (proc)
    "Serve an HTML file for GET requests."
    (with-temp-buffer
      ;; (print "yes4")
      (insert-file-contents my/html-file-path)
      (ws-response-header proc 200 '("Content-Type" . "text/html; charset=UTF-8"))
      ;;(ws-response-header proc 200 '("Content-Type" . "text/plain"))
      (process-send-string proc (buffer-string))
      ;;(process-send-region proc (point-min) (point-max))
      ;;(process-send-string proc "hello")
      ))
      ;;(process-send-region proc (point-min) (point-max))))

  (defun my/serve-buffer-contents (proc buffer-name)
    "Serve the contents of a buffer for POST requests."
    ;; (print "yes10")
    ;; (print buffer-name)
    ;; (print (get-buffer buffer-name))
    (if-let ((buffer (get-buffer buffer-name)))
      (with-current-buffer buffer
          ;;(print "yes3")
          (ws-response-header proc 200 '("Content-Type" . "text/plain"))
          (process-send-string proc (buffer-string)))
      (ws-send-404 proc)))

  (setq svr (ws-start
   '(((:POST . ".*") .
       (lambda (request)
        ;; (print "yes0")
        (with-slots (process headers) request
          ;;(let ((buffer-name (cdr (assoc "buffer" (ws-parse-qs (cdr (assoc "Content-Length" headers)))))))
          (let ((buffer-name (cdr (assoc "buffer" headers))))
            ;; (print buffer-name)
            ;; (print "yes")
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
  )

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

(defvar-local my-enable-xwidget-js nil)

(defun my/markdown-live-preview--reload(&rest _args)
  (when my-enable-xwidget-js ;; バッファローカル変数がtrueの場合のみ
    (let ((js "sendPostRequest();"))
      (xwidget-webkit-execute-script (xwidget-webkit-current-session) js))))

(defun my/markdown-live-preview ()
  (interactive)
  (setq-local my-enable-xwidget-js t)
  (xwidget-webkit-browse-url
    (format "http://localhost:9001/?buffer=%s"
      (replace-regexp-in-string " " "%20" (buffer-name))))
  ;; バッファローカル変数を設定
  ;; アドバイスを追加
  (advice-add 'save-buffer :after #'my/markdown-live-preview--reload))

(advice-add 'my/markdown-live-preview :around
  (lambda (f &rest args)
    (with-current-buffer (pm-base-buffer)
      (apply f args))))

(advice-add 'my/markdown-live-preview--reload :around
  (lambda (f &rest args)
    (with-current-buffer (pm-base-buffer)
      (apply f args))))

;;(advice-remove 'save-buffer nil)
(provide 'my/markdown-live-preview)
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
f\left(x\right) = \frac{e^{x}-1}{x}
```

