;; -*- lexical-binding: t; -*-
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Color all language features
(setq font-lock-maximum-decoration t)

;; Highlight current line
(global-hl-line-mode 0)

;; Include entire file path in title
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

(global-display-line-numbers-mode 1)

;; Be less obnoxious
(blink-cursor-mode -1)
(tooltip-mode -1)

;; Set theme
(load-theme 'default-black)

;; (load-theme 'handmade)

;; (load-theme 'daylight)

;; (set-face-attribute 'default nil :font "Monaco 11")

;; (set-face-attribute 'default nil :font "BlexMono Nerd Font 12")

(set-face-attribute 'default nil :font "Anonymous pro 11")

;; Don't beep. Just blink the modeline on errors.
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

(provide 'appearance)
