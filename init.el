(require 'package)

;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; see remark below
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)



(tool-bar-mode 0)                          ;; Disables menu bar and scroll bar
(menu-bar-mode 0)
(scroll-bar-mode -1)

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
(defun my-theme-switcher ()
  (let ((current-hour (+ (string-to-number (format-time-string "%H"))
                         (/ (string-to-number (format-time-string "%M")) 60.0)))
        (sunrise-hour (car (car (solar-sunrise-sunset (calendar-current-date)))))
        (sunset-hour  (car (car (cdr (solar-sunrise-sunset (calendar-current-date)))))))
    (if (or (< current-hour sunrise-hour) (> current-hour sunset-hour))
        (when (not (eq mytheme 'dark))  (load-theme 'spacemacs-dark t) (setq mytheme 'dark))
        (when (not (eq mytheme 'light)) (load-theme 'spacemacs-light t) (setq mytheme 'light))
      )))
(my-theme-switcher)
;; Run at every 1800 seconds, after 0s delay
(run-with-timer 0 1800 'my-theme-switcher)
;; End of Oliver's setup for pretty format and font
