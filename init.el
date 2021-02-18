(require 'package)

;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; see remark below
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)



(tool-bar-mode 0)                          ;; Disables menu bar and scroll bar
(menu-bar-mode 0)
(scroll-bar-mode -1)

;; no backup files
(setq make-backup-files nil)

;; set theme
(load-theme 'tango-dark)
(put 'set-goal-column 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Load company-coq when opening Coq files
(add-hook 'coq-mode-hook #'company-coq-mode)


;; Oliver's setup for pretty format and font
;set your location data here

(setq calendar-latitude 40.427520)
(setq calendar-longitude -86.916975)
(setq calendar-location-name "West Lafayette, IN")
(require 'solar)
(setq mytheme 'init)
;; (defun my-theme-switcher ()
;;   (let ((current-hour (+ (string-to-number (format-time-string "%H"))
;;                          (/ (string-to-number (format-time-string "%M")) 60.0)))
;;         (sunrise-hour (car (car (solar-sunrise-sunset (calendar-current-date)))))
;;         (sunset-hour  (car (car (cdr (solar-sunrise-sunset (calendar-current-date)))))))
;;     (if (or (< current-hour sunrise-hour) (> current-hour sunset-hour))
;;         (when (not (eq mytheme 'dark))  (load-theme 'spacemacs-dark t) (setq mytheme 'dark))
;;         (when (not (eq mytheme 'light)) (load-theme 'spacemacs-light t) (setq mytheme 'light))
;;       )))
(my-theme-switcher)
;; Run at every 1800 seconds, after 0s delay
(run-with-timer 0 1800 'my-theme-switcher)
;; End of Oliver's setup for pretty format and font

(setq visible-bell t)

;; remap the meta key in MacOS
(setq ns-alternate-modifier 'meta)
(setq ns-right-alternate-modifier 'none)
(setq ns-command-modifier 'super)
(setq ns-right-command-modifier 'left)
(setq ns-control-modifier 'control)
(setq ns-right-control-modifier 'left)
(setq ns-function-modifier 'none)


;; add path of the gnu-global
(add-to-list 'tramp-remote-path "/usr/local/bin/global")

;; add path of the gtags 
(setq load-path (cons "/usr/local/bin/gtags" load-path))
(autoload 'gtags-mode "gtags" "" t)

;; setup the helm-tags hook
(require 'setup-helm)
(require 'setup-helm-gtags)



;; setup key bindings of the ggtags 
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; set upt the helm-tag key bindings
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
