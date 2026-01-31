;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; LLM / AI coding assistants
(package! gptel)
(package! agent-shell
  :recipe (:host github :repo "xenodium/agent-shell"))

;; SF Symbols & Toolbar (macOS)
(package! calle24
  :recipe (:host github :repo "kickingvegas/calle24"))
