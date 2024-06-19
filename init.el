(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(load "mysettings.el")
(load "local-settings.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
    '("5e5771e6ea0c9500aa87e987ace1d9f401585e22a976777b6090a1554f3771c6" default))
 '(package-selected-packages
    '(company-shell uuid uuidgen my/markdown-preview web-server pulsar tree-sitter treesit-auto expreg dimmer ivy-with-migemo migemo corfu-prescient ivy-prescient prescient magit ivy-avy company-irony jump-tree avy company counsel ivy-posframe tramp jsonrpc editorconfig f posframe mozc-popup mozc cl-lib cape corfu helm-swoop helm poly-markdown swiper undo-tree expand-region blackout el-get hydra leaf-keywords)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#1E2430" :foreground "#E8EEF9" :extend t))))
 '(ediff-current-diff-A ((t (:background "#363c48" :foreground "#ECEFF4" :extend t))))
 '(ediff-current-diff-B ((t (:background "#363c48" :foreground "#ECEFF4" :extend t))))
 '(ediff-even-diff-A ((t (:background "#464c58" :extend t))))
 '(ediff-even-diff-B ((t (:background "#464c58" :extend t))))
 '(ediff-odd-diff-A ((t (:background "#464c58" :extend t))))
 '(ediff-odd-diff-B ((t (:background "#464c58" :extend t))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#B080B0" :extend t))))
 '(font-lock-comment-face ((t (:foreground "#B080B0" :extend t))))
 '(font-lock-doc-face ((t (:foreground "#B080B0" :extend t))))
 '(helm-ff-file ((t (:background "#2E3440" :foreground "#ECEFF4"))))
 '(helm-match ((t (:foreground "#81A1C1" :background "#2E3440" :weight bold))))
 '(helm-selection ((t (:background "#434C5E" :foreground "#E5E9F0"))))
 '(helm-source-header ((t (:background "#4C566A" :foreground "#ECEFF4" :weight bold :height 1.3 :family "Sans Serif"))))
 '(helm-visible-mark ((t (:foreground "#2E3440" :background "#8FBCBB"))))
 '(ivy-current-match ((t (:background "#4C566A" :foreground "#ECEFF4" :extend t))))
 '(ivy-minibuffer-match-face-1 ((t (:background "#4C566A" :foreground "#D8DEE9" :weight bold))))
 '(ivy-minibuffer-match-face-2 ((t (:background "#434C5E" :foreground "#D8DEE9" :weight bold))))
 '(ivy-minibuffer-match-face-3 ((t (:background "#3B4252" :foreground "#D8DEE9" :weight bold))))
 '(ivy-minibuffer-match-face-4 ((t (:background "#2E3440" :foreground "#D8DEE9" :weight bold))))
 '(magit-diff-file-heading-highlight ((t (:background "#363c48" :foreground "#ECEFF4" :extend t))))
 '(sh-heredoc ((t (:foreground "#FF6dad" :extend t))))
 '(sh-quoted-exec ((t (:foreground "#FFB0B0" :extend t))))
 '(shadow ((t (:foreground "#7C869A" :extend t)))))
