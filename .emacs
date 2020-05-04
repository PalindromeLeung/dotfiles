
;; Open .v files with Proof General's Coq mode
(load "~/.emacs.d/lisp/PG/generic/proof-site")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coq-prog-name "/Users/isprime/.opam/4.07.0/bin/coqtop")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (emmet-mode haskell-tab-indent cl-libify cl-lib-highlight unicode-fonts proof-general org-link-minor-mode multiple-cursors haskell-mode fstar-mode f dash-functional company-coq)))
 '(proof-three-window-enable t)
 '(proof-three-window-mode-policy (quote hybrid)))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives
               (cons "melpa" (concat proto "://melpa.org/packages/")) t))
(package-initialize)

(require 'package)

(require 'package)

(package-initialize)


;; set theme
(load-theme 'misterioso)
(put 'set-goal-column 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;put all the emacs backup files in one directory
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
(put 'upcase-region 'disabled nil)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
