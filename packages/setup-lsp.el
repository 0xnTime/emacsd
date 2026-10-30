;; -*- lexical-binding: t; -*-
;; LSP via Eglot (built into Emacs 29+).

(use-package eglot
  :ensure nil  ;; built-in
  :hook ((rust-mode          . eglot-ensure)
         (typescript-ts-mode . eglot-ensure)
         (tsx-ts-mode        . eglot-ensure)
         (c-mode             . eglot-ensure)
         (c++-mode           . eglot-ensure))
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
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode) . ("clangd"))))

(provide 'setup-lsp)
