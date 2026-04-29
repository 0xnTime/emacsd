;; -*- lexical-binding: t; -*-
;; Global keybindings that don't belong to any single package's setup file.

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(global-set-key (kbd "C-,") 'duplicate-dwim)

(global-set-key (kbd "C-c c c") 'compile)

(global-set-key (kbd "C-c c c") 'compile)

(defun my/page-down-centered ()
  (interactive)
  (forward-line (/ (window-body-height) 2))
  (recenter))

(defun my/page-up-centered ()
  (interactive)
  (forward-line (- (/ (window-body-height) 2)))
  (recenter))

(global-set-key (kbd "C-v") 'my/page-down-centered)
(global-set-key (kbd "M-v") 'my/page-up-centered)

(use-package multiple-cursors
  :ensure t
  :bind (("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-S-c C-S-c" . mc/edit-lines)))

(provide 'keybindings)
