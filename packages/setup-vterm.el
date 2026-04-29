;; -*- lexical-binding: t; -*-

(use-package vterm
  :ensure t
  :bind (("C-c t" . vterm))
  :custom
  (vterm-max-scrollback 10000)
  (vterm-kill-buffer-on-exit t))
