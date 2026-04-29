;; -*- lexical-binding: t; -*-

(use-package vertico
  :ensure t
  :init (vertico-mode 1)
  :custom
  (vertico-cycle t)
  (vertico-count 15))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides
   '((file (styles basic partial-completion)))))

(use-package marginalia
  :ensure t
  :init (marginalia-mode 1))

(use-package consult
  :ensure t
  :bind (("C-x b"   . consult-buffer)        
         ("C-x C-r" . consult-recent-file)   
         ("C-s"     . consult-line)          
         ("M-y"     . consult-yank-pop)      
         ("M-g g"   . consult-goto-line)
         ("C-c p g" . consult-ripgrep)))

;; Persist minibuffer history across sessions
(use-package savehist
  :ensure nil
  :init (savehist-mode 1))

(global-set-key (kbd "C-c p f") 'project-find-file)
(global-set-key (kbd "C-c p s") 'project-switch-project)

;; Use ripgrep for xref's project-wide search fallbacks. Requires `rg' on PATH.
(setq xref-search-program 'ripgrep)
