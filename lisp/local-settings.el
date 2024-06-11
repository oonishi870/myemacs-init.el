(leaf local-bindings
  :after overriding-minor-mode
  :config
  (bind-keys :map overriding-minor-mode-map
    ("C-S-y" . (lambda (&rest args)(interactive)(other-window -1))) ;; 2018/06/27 tmux用
    )
;;  (global-set-key (kbd "C-S-y") (lambda (&rest args)(interactive)(other-window -1)))
  )
