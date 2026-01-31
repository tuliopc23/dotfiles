;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; Theme
(setq doom-theme 'doom-xcode)

;; Set font size
(setq doom-font (font-spec :family "Liga SFMono Nerd Font" :size 13))
(setq default-text-scale 0)

;;; Line numbers
(setq display-line-numbers-type t)

;;; Org directory
(setq org-directory "~/org/")

;;; ============================================================================
;;; macOS Aesthetics (xenodium.com/awesome-emacs-on-macos)
;;; ============================================================================
;; Option = Meta (both left and right).
(setq ns-option-modifier 'meta)
;; emacs-mac: Right Option and Left Option as Meta (set here so mac-* vars are loaded).
(when (boundp 'mac-right-option-modifier)
  (setq mac-right-option-modifier 'meta))
(when (boundp 'mac-option-modifier)
  (setq mac-option-modifier 'meta))
;; GNU Emacs Cocoa fallback: Right Option as Meta.
(when (boundp 'ns-right-alternate-modifier)
  (setq ns-right-alternate-modifier 'meta))
;; When using Karabiner to send Hyper for Right Option, translate Hyper to Meta.
(dolist (char (append (number-sequence 97 122) (number-sequence 65 90) (number-sequence 32 126)))
  (let ((hyper-key (kbd (format "H-%c" char)))
        (meta-key (kbd (format "M-%c" char))))
    (define-key key-translation-map hyper-key meta-key)))
;; Frame settings
(setq ns-pop-up-frames nil)

;; Prevent hangs during init/frame creation
(setq recentf-auto-cleanup 'never) ; Stop checking for old files on startup
(setq shell-file-name "/bin/sh")   ; Use standard sh for internal commands (faster than fish)

;; Stop terminal feature detection from hanging (common 30-40s timeout cause)
(setq xterm-extra-capabilities '(screen label))

;; GUI Aesthetics
(when (display-graphic-p)
  (setq ns-use-srgb-colorspace nil)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  ;; Enable toolbar and menu-bar only in GUI
  (tool-bar-mode 1)
  (menu-bar-mode 1)
  (setq tool-bar-style 'image)) ; icons only (no text labels)

;; Terminal (TTY) Optimizations
(unless (display-graphic-p)
  ;; Simplify dashboard to avoid slow filesystem/TRAMP lookups
  (setq doom-dashboard-widgets '(banner shortmenu))
  ;; Ensure menu-bar is off in terminal
  (menu-bar-mode -1))

;; Force Evil mode to work immediately in terminal frames (fix read-only delay)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (when (eq (framep frame) 'tty)
              (with-selected-frame frame
                (unless (featurep 'evil) (require 'evil))
                (evil-mode 1)
                (evil-normal-state)))))

;; Use macOS trash
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash")

;;; ============================================================================
;;; SF Symbols for Tab Numbers (GUI only)
;;; ============================================================================

(when (and (featurep :system 'macos) (display-graphic-p))
  (defun ct/tab-bar-tab-name-format-sf-symbol (tab i)
    (let* ((current-p (eq (car tab) 'current-tab))
           (sf-symbols ["" "􀃋" "􀃍" "􀃏" "􀃑" "􀃓" "􀃕" "􀃗" "􀃙" "􀃛" "􀘾"])
           (sf-symbol (if (<= i 10)
                          (aref sf-symbols i)
                        (number-to-string i))))
      (propertize
       (concat " " sf-symbol " "
               (alist-get 'name tab)
               (or (and (alist-get 'close-button tab)
                        (not (eq (alist-get 'close-button tab) ""))
                        (concat " " (alist-get 'close-button tab)))
                   "")
               " ")
       'face (funcall tab-bar-tab-face-function tab))))
  (setq tab-bar-tab-name-format-function #'ct/tab-bar-tab-name-format-sf-symbol))

;;; ============================================================================
;;; gptel - LLM interface
;;; ============================================================================

(use-package! gptel
  :config
  (setq gptel-model 'gpt-4o
        gptel-default-mode 'org-mode))

;;; ============================================================================
;;; agent-shell - AI coding assistants with ACP
;;; ============================================================================

(use-package! agent-shell
  :commands (agent-shell-opencode agent-shell-claude-code agent-shell-droid agent-shell-codex)
  :config
  (setq agent-shell-default-backend 'droid))

;;; ============================================================================
;;; Eshell macOS banner
;;; ============================================================================

(use-package! em-banner
  :custom
  (eshell-banner-message "
\x1b[32m                             'c.                    \x1b[0m
\x1b[32m                          ,xNMM.                    \x1b[0m
\x1b[32m                        .OMMMMo                     \x1b[0m
\x1b[32m                        OMMM0,                      \x1b[0m
\x1b[32m              .;loddo:' loolloddol;.                \x1b[0m
\x1b[32m            cKMMMMMMMMMMNWMMMMMMMMMM0:              \x1b[0m
\x1b[33m          .KMMMMMMMMMMMMMMMMMMMMMMMWd.              \x1b[0m
\x1b[33m          XMMMMMMMMMMMMMMMMMMMMMMMX.                \x1b[0m
\x1b[31m        ;MMMMMMMMMMMMMMMMMMMMMMMM:                  \x1b[0m
\x1b[31m        :MMMMMMMMMMMMMMMMMMMMMMMM:                  \x1b[0m
\x1b[31m        .MMMMMMMMMMMMMMMMMMMMMMMMX.                 \x1b[0m
\x1b[31m         kMMMMMMMMMMMMMMMMMMMMMMMMWd.               \x1b[0m
\x1b[35m          .XMMMMMMMMMMMMMMMMMMMMMMMMMMk             \x1b[0m
\x1b[35m           .XMMMMMMMMMMMMMMMMMMMMMMMMK.             \x1b[0m
\x1b[34m             kMMMMMMMMMMMMMMMMMMMMMMd               \x1b[0m
\x1b[34m              ;KMMMMMMMWXXWMMMMMMMk.                \x1b[0m
\x1b[34m                .cooc,.    .,coo:.                  \x1b[0m
"))
