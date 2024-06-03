(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(load "local-init.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
    '(ivy-avy company-irony jump-tree avy company counsel ivy-posframe tramp jsonrpc editorconfig f posframe mozc-popup mozc cl-lib cape corfu helm-swoop helm poly-markdown swiper undo-tree expand-region blackout el-get hydra leaf-keywords)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
