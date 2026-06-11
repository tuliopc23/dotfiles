;;; emacs-mac: make Right Option be Meta
(when (boundp 'mac-right-option-modifier)
  (setq mac-right-option-modifier 'meta))

;; optional: keep left option also as Meta
(when (boundp 'mac-option-modifier)
  (setq mac-option-modifier 'meta));; $DOOMDIR/early-init.el -*- lexical-binding: t; -*-

;; This runs before Doom's early-init
;; We need to advise after Doom sets its defaults

;; Fix Doom evil :textobj -> symbolp error: text object maps must use define-key
;; directly, not evil-define-key* (which creates state auxiliary keymaps).
(add-hook 'after-load-functions
          (lambda (file)
            (when (and (stringp file)
                       (string-match-p "evil-core\\.el\\'" file)
                       (fboundp 'evil-define-key*))
              (defun ct/evil-define-key*-textobj-fix (orig-fun state keymap key def &rest bindings)
                (let ((outer (when (boundp 'evil-outer-text-objects-map)
                               (symbol-value 'evil-outer-text-objects-map)))
                      (inner (when (boundp 'evil-inner-text-objects-map)
                               (symbol-value 'evil-inner-text-objects-map))))
                  (if (and (keymapp keymap)
                           (or (eq keymap outer) (eq keymap inner)))
                      (progn
                        (while key
                          (define-key keymap key def)
                          (setq key (pop bindings) def (pop bindings)))
                        nil)
                    (apply orig-fun state keymap key def bindings))))
              (advice-add 'evil-define-key* :around #'ct/evil-define-key*-textobj-fix)))
          nil t)
