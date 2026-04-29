;; -*- lexical-binding: t; -*-

(use-package avy
  :ensure t
  :bind (("C-:"   . avy-goto-char-timer)
         ("M-g w" . avy-goto-word-1)
         ("M-g l" . avy-goto-line)))
