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
    '(ivy-avy company-irony jump-tree avy company counsel ivy-posframe tramp jsonrpc editorconfig f posframe mozc-popup mozc cl-lib cape corfu helm-swoop helm poly-markdown swiper undo-tree expand-region blackout el-get hydra leaf-keywords)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
