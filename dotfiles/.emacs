;; Wlasne biblioteki warto trzymac w odrebnym katalogu ktory nalezy dodac do 
;;sciezki ladowania.
(setq load-path
      (append (list "~/.emacs-addons")
              load-path))

;; domyslny slownik ispell
(setq ispell-dictionary "british")
(setq ispell-highlight-face 'region)

;; sprawdzanie pisowni na biezaco w trybie tekstowym
(add-hook 'text-mode-hook 'flyspell-mode)

;; Syntax highlighting:
;; kolorowanie skladni wszedzie, gdzie sie da
(global-font-lock-mode t)

;; Dzieki temu po wlaczeniu Emacsa nie pojawia sie ekran z przywitaniem. 
(setq inhibit-startup-message t)


;;(global-set-key [f1] 'goto-line)  ;; goto line number
;;(global-set-key [select] 'set-mark-command)  ;; set mark


(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)

(setq matlab-indent-function-body t)  
(setq matlab-verify-on-save-flag nil) 
(defun my-matlab-mode-hook ()
(setq fill-column 76))
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(defun my-matlab-shell-mode-hook ()
	'())
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)



(autoload 'mlint-minor-mode "mlint" nil t)
(add-hook 'matlab-mode-hook (lambda () (mlint-minor-mode 1)))

(autoload 'tlc-mode "tlc" "tlc Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.tlc$" . tlc-mode))
(setq tlc-indent-function t)


(setq auto-mode-alist
	        (append
			         '((".*\.p$" . fundamental-mode)
					            (".*\.f$" . fundamental-mode))
					        auto-mode-alist))
(cond (window-system
		(global-font-lock-mode t)
		)
	  )
(setq inhibit-default-init 1)

(setq nxml-mode-hook
'(lambda () "Defauts for nxml mode."
(ispell-change-dictionary "american")
))

;; Wyswietlanie numerow linii na pionowej belce
;;(column-number-mode 1)

;; Numerowanie linii
(autoload 'setnu-mode "setnu" nil t)

