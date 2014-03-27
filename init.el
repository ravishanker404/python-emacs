(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(load-file "~/.emacs.d/emacs-for-python/epy-init.el")

(require 'uniquify)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(defun after-init-hook-hook ()
  (load-theme 'monokai)
  ;; (guru-global-mode +1)
  (add-hook 'python-mode-hook (lambda ()
                              (guru-mode +1)))
  ;;(require 'flymake-python-pyflakes)
  ;;(setq flymake-python-pyflakes-executable "/usr/local/bin/flake8")
  ;;(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
)

(add-hook 'after-init-hook 'after-init-hook-hook)

(set-default-font "Monaco 14")

;;Editor settings
(scroll-bar-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
(setq-default indent-tabs-mode nil)


;; magitshortcut
(global-set-key (kbd "C-x g") 'magit-status)

;;Toggle comment and uncomment
;; Original idea from  http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun toggle-comment-region (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-unset-key (kbd "C-?"))
(global-set-key (kbd "C-?") 'toggle-comment-region)

;;TO STOP POP UPS
(setq pop-up-windows nil)
(setq use-dialog-box nil)
(fset 'yes-or-no-p 'y-or-n-p)

;;(load-theme 'monokai t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("a3d519ee30c0aa4b45a277ae41c4fa1ae80e52f04098a2654979b1ab859ab0bf" "73fe242ddbaf2b985689e6ec12e29fab2ecd59f765453ad0e93bc502e6e478d6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
