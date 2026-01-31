;;; emacs-mac: make Right Option be Meta
(when (boundp 'mac-right-option-modifier)
  (setq mac-right-option-modifier 'meta))

;; optional: keep left option also as Meta
(when (boundp 'mac-option-modifier)
  (setq mac-option-modifier 'meta));; $DOOMDIR/early-init.el -*- lexical-binding: t; -*-

;; This runs before Doom's early-init
;; We need to advise after Doom sets its defaults
