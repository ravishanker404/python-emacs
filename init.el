;;
;;
;;Editor settings
(scroll-bar-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
(setq-default indent-tabs-mode nil)

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/sublime-themes/")
(load-theme 'graham t)
(add-to-list 'load-path  "~/.emacs.d/themes/tomorrow/")
;; (load-theme 'tomorrow-night t)

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


(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
;; (load-file "~/.emacs.d/packages.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("dc46381844ec8fcf9607a319aa6b442244d8c7a734a2625dac6a1f63e34bc4a6" "8874901e0011a7b07e546b65be1726c4cc3f35cf1a60f8805e6cb5bb59ba305c" "6f3060ac8300275c990116794e1ba897b6a8af97c51a0cb226a98759752cddcf" "978bd4603630ecb1f01793af60beb52cb44734fc14b95c62e7b1a05f89b6c811" "d293542c9d4be8a9e9ec8afd6938c7304ac3d0d39110344908706614ed5861c9" "d0ff5ea54497471567ed15eb7279c37aef3465713fb97a50d46d95fe11ab4739" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
