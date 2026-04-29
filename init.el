;; -*- lexical-binding: t; -*-
;; Add settings to load-path
(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))

;; Optimize startup of Emacs
(require 'fast-startup)

;; Keep emacs Custom-settings in separate file, not appended to init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'appearance)

;; Configure the package manager
(require 'packages)

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Global keybindings
(require 'keybindings)

;; Whitespace handling per language mode
(require 'setup-whitespace)

;; Load all packages
(dolist (file (directory-files packages-dir t "^[^#].*el$"))
  (when (file-regular-p file)
    (load file)))
