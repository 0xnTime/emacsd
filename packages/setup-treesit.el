;; -*- lexical-binding: t; -*-

(use-package tree-sitter)
(use-package tree-sitter-langs)
(require 'tree-sitter)
(require 'tree-sitter-langs)


(global-tree-sitter-mode)

(setq treesit-font-lock-level 4)

(provide 'setup-treesit)
