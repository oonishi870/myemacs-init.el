(defvar position-history nil
  "List of cursor positions as a history with context including the window.")
(defvar history-index 0
  "Current index in the position-history.")

(defun add-position-to-history (&optional args)
  "Add the current buffer, position, and window to the position-history list."
  (let ((entry (list (current-buffer) (point) (selected-window))))
    (unless (equal entry (car position-history))
      (setq position-history (cons entry (nthcdr history-index position-history)))
      (setq history-index 0))))

(defun jump-back ()
  "Jump to the previous position in the position-history, restoring the window."
  (interactive)
  (when (> (+ history-index 1) (length position-history))
    (error "No more history backward"))
  (setq history-index (1+ history-index))
  (let ((entry (nth history-index position-history)))
    (set-window-buffer (nth 2 entry) (car entry))
    (set-window-point (nth 2 entry) (cadr entry))
    (select-window (nth 2 entry))))

(defun jump-forward ()
  "Jump to the next position in the position-history, restoring the window."
  (interactive)
  (when (<= history-index 0)
    (error "No more history forward"))
  (setq history-index (1- history-index))
  (let ((entry (nth history-index position-history)))
    (set-window-buffer (nth 2 entry) (car entry))
    (set-window-point (nth 2 entry) (cadr entry))
    (select-window (nth 2 entry))))


(global-set-key (kbd "C-p") 'jump-back)
(global-set-key (kbd "C-n") 'jump-forward)

(advice-add 'isearch-exit :after #'add-position-to-history)
(advice-add 'goto-line :after #'add-position-to-history)
(advice-add 'find-file :after #'add-position-to-history)
(advice-add 'switch-to-buffer :after #'add-position-to-history)
;;(advice-remove 'switch-to-buffer  #'add-position-to-history)
(advice-add 'beginning-of-buffer :after #'add-position-to-history)  ; Ctrl-Home
(advice-add 'end-of-buffer :after #'add-position-to-history)        ; Ctrl-End
(advice-add 'swiper :after #'add-position-to-history)

;; (print  position-history)
;; (pm-base-buffer)
;; (setq position-history nil)

;;(server-start)
(defun add-position-to-history-poly-advice (original-func &rest args)
  "Advice to modify position history behavior in poly-markdown buffers by adjusting the buffer name."
  (let ((p (point)))
    ;; Call the original function with modified arguments
    (with-current-buffer (pm-base-buffer)
      (save-excursion
        (goto-char p)
        (funcall original-func args)))
    ))

(advice-add 'add-position-to-history :around #'add-position-to-history-poly-advice)
(advice-remove 'add-position-to-history  #'add-position-to-history-poly-advice)


;; (advice-add 'add-position-to-history :around #'add-position-to-history-poly-advice)
;; (pm-get-span )



