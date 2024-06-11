(leaf local-bindings
  :after overriding-minor-mode
  :config
  ;; かえうちの設定が間違っておりC-S-がdvorakの配置で認識される。応急処置
  (bind-keys :map overriding-minor-mode-map
    ("C-S-y" . (lambda (&rest args)(interactive)(other-window -1)))
    ( "C-S-d" . er/contract-region)
    )
;;  (global-set-key (kbd "C-S-y") (lambda (&rest args)(interactive)(other-window -1)))
  )
