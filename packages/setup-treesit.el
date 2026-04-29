;; -*- lexical-binding: t; -*-

(require 'treesit)

(setq treesit-language-source-alist
      '((go         . ("https://github.com/tree-sitter/tree-sitter-go"))
        (python     . ("https://github.com/tree-sitter/tree-sitter-python"))
        (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
        (tsx        . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))))

(defun setup-treesit-install-grammars ()
  "Install any tree-sitter grammars from `treesit-language-source-alist'
that are not yet available."
  (interactive)
  (dolist (lang (mapcar #'car treesit-language-source-alist))
    (unless (treesit-language-available-p lang)
      (message "Installing tree-sitter grammar for %s..." lang)
      (treesit-install-language-grammar lang))))

(dolist (mapping '((go-mode         . go-ts-mode)
                   (python-mode     . python-ts-mode)
                   (typescript-mode . typescript-ts-mode)))
  (add-to-list 'major-mode-remap-alist mapping))

(add-to-list 'auto-mode-alist '("\\.go\\'"  . go-ts-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'"  . python-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'"  . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

;; Maximum decoration
(setq treesit-font-lock-level 4)

(provide 'setup-treesit)
