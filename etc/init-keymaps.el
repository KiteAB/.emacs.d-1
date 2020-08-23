;;;; This file is used for the keybindings
(define-prefix-command 'ctl-z-map)		 ; Create the C-z map
(global-set-key (kbd "C-z") 'ctl-z-map)		 ; Set the C-z
(global-set-key (kbd "C-z i") 'open-config-file) ; Open the init.el
(global-set-key (kbd "C-z p") 'package-list-packages) ; Open the package interface
(global-set-key (kbd "C-z C-b") 'buffer-menu) ; Open the buffer menu
(global-set-key (kbd "C-z C-i") 'erc) ;Open the erc
(global-set-key (kbd "C-z C-p") 'previous-buffer) ; Goto previous buffer
(global-set-key (kbd "C-z C-n") 'next-buffer)	  ;Goto Next buffer
(global-set-key (kbd "C-z m") 'set-mark-command) ; The mark key map
(global-set-key (kbd "<f12>") 'tab-bar-mode) ; Open or close the tab-bar-mode
(global-set-key (kbd "C-z c") 'open-etc-config) ; Open the etc config dir
(global-set-key (kbd "C-z C-m w") 'window-move) ; Move the window
(global-set-key (kbd "C-z C-a") 'set-alpha) ; Set the emacs' alpha
(global-set-key (kbd "C-z C-o") 'open-the-dir) ; Open the gtd/github directory
(global-set-key (kbd "C-z u") 'undo-only) ; Undo without redo
(global-set-key (kbd "C-z r") 'undo-redo) ; Redo
(global-set-key (kbd "C-z t") 'make-empty-file) ; Touch file
(global-set-key (kbd "C-z s") 'sudo-save) ; Use sudo permission to save the file
(global-set-key (kbd "C-z w") 'write-scratch) ; New a write scratch buffer
(global-set-key (kbd "C-z f") 'mark-defun) ; Mark the function SAME LIKE C-M-h
(global-set-key (kbd "C-z e") 'eshell) ; Open eshell
(global-set-key (kbd "C-z C-t") 'load-the-theme) ; Load theme
(global-set-key (kbd "C-x t O") 'tab-bar-switch-to-prev-tab) ; tab-previous
(global-set-key (kbd "C-z C-s") 'spring/error-show) ; Show the all-the-config-errors
(global-set-key (kbd "C-z k") 'kill-unwanted-buffer) ; Kill the unwanted buffers made in init load
(global-set-key (kbd "C-x t 3") 'tab-bar-new-with-buffer) ; Create a new tab then select a buffer

;; Macros
(global-set-key (kbd "C-z C-k i") 'insert-placeholder) ; Insert Placeholder
(global-set-key (kbd "C-z C-k r") 'replace-placeholder) ; Replace Placeholder

(provide 'init-keymaps)
