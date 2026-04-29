;; -*- lexical-binding: t; -*-
;; LSP via Eglot (built into Emacs 29+).

(require 'simpc-mode)

;; Use simpc-mode for C source/header files, overriding the built-in c-mode.
(add-to-list 'auto-mode-alist '("\\.[ch]\\'" . simpc-mode))

(use-package eglot
  :ensure nil  ;; built-in
  :hook ((go-ts-mode         . eglot-ensure)
         (python-ts-mode     . eglot-ensure)
         (typescript-ts-mode . eglot-ensure)
         (tsx-ts-mode        . eglot-ensure)
         (simpc-mode         . eglot-ensure))
  :bind (:map eglot-mode-map
              ;; Navigation
              ("M-."     . xref-find-definitions)        
              ("M-?"     . xref-find-references)         
              ("M-,"     . xref-go-back)                 
              ("C-c l d" . xref-find-definitions)
              ("C-c l R" . xref-find-references)
              ("C-c l i" . eglot-find-implementation)
              ("C-c l t" . eglot-find-typeDefinition)
              ("C-c l D" . eglot-find-declaration)
              ;; Edit
              ("C-c l r" . eglot-rename)
              ("C-c l a" . eglot-code-actions)
              ("C-c l f" . eglot-format)
              ;; Help
              ("C-c l h" . eldoc-doc-buffer))
  :custom
  (eglot-autoshutdown t)
  (eglot-sync-connect 0)
  :config
  ;; Eglot derives the LSP language-id from the major-mode name; simpc-mode
  ;; would send "simpc", which clangd does not understand. Override to "c".
  (add-to-list 'eglot-server-programs
               '((simpc-mode :language-id "c") . ("clangd"))))

(provide 'setup-lsp)
