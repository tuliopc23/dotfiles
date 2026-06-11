;;; mode-line-hud.el --- Lightweight modeline HUD -*- lexical-binding: t; -*-

(require 'cl-lib)

(defgroup mode-line-hud nil
  "Display transient status messages in the mode line."
  :group 'convenience)

(defcustom mode-line-hud-default-seconds 3
  "Default duration for transient HUD messages."
  :type 'number)

(defvar mode-line-hud--text nil)
(defvar mode-line-hud--timer nil)
(defvar mode-line-hud--notification-id 0)
(defvar mode-line-hud--call-log nil)

(defun mode-line-hud--update-display ()
  (force-mode-line-update t))

(defun mode-line-hud--reset-timer ()
  (when (timerp mode-line-hud--timer)
    (cancel-timer mode-line-hud--timer))
  (setq mode-line-hud--timer nil))

(defun mode-line-hud--log-call (fn &rest args)
  (push (list :time (float-time) :fn fn :args args) mode-line-hud--call-log)
  (when (> (length mode-line-hud--call-log) 200)
    (setcdr (nthcdr 199 mode-line-hud--call-log) nil)))

(defun mode-line-segment-hud ()
  "Return the current HUD text for the mode line."
  (or mode-line-hud--text ""))

;;;###autoload
(defun mode-line-hud:show-call-log ()
  "Display the HUD call log in a buffer."
  (interactive)
  (let ((buf (get-buffer-create "*mode-line-hud:call-log*")))
    (with-current-buffer buf
      (setq buffer-read-only nil)
      (erase-buffer)
      (dolist (entry (reverse mode-line-hud--call-log))
        (insert (prin1-to-string entry) "\n"))
      (setq buffer-read-only t)
      (goto-char (point-min)))
    (pop-to-buffer buf)))

;;;###autoload
(cl-defun mode-line-hud:update (&key message)
  "Update modeline with MESSAGE immediately.
This overrides any existing message and cancels active timers."
  (mode-line-hud--log-call 'mode-line-hud:update :message message)
  (mode-line-hud--reset-timer)
  (setq mode-line-hud--text message)
  (mode-line-hud--update-display))

;;;###autoload
(cl-defun mode-line-hud:updateWith (&key message delay)
  "Update modeline with MESSAGE after DELAY seconds."
  (mode-line-hud--log-call 'mode-line-hud:updateWith :message message :delay delay)
  (mode-line-hud--reset-timer)
  (setq mode-line-hud--timer
        (run-at-time (or delay 0) nil
                     (lambda ()
                       (setq mode-line-hud--timer nil)
                       (mode-line-hud:update :message message)))))

;;;###autoload
(cl-defun mode-line-hud:notification (&key message seconds (reset nil))
  "Display MESSAGE for SECONDS seconds in the mode line.
If RESET is non-nil, clear the message after SECONDS."
  (mode-line-hud--log-call 'mode-line-hud:notification :message message :seconds seconds :reset reset)
  (cl-incf mode-line-hud--notification-id)
  (let ((id mode-line-hud--notification-id))
    (mode-line-hud--reset-timer)
    (setq mode-line-hud--text message)
    (mode-line-hud--update-display)
    (setq mode-line-hud--timer
          (run-at-time (or seconds mode-line-hud-default-seconds) nil
                       (lambda ()
                         (when (and reset (= id mode-line-hud--notification-id))
                           (setq mode-line-hud--text nil)
                           (mode-line-hud--update-display))
                         (setq mode-line-hud--timer nil))))))

;;;###autoload
(defun mode-line-hud:toggle-debug ()
  "Toggle HUD debug logging."
  (interactive)
  (if mode-line-hud--call-log
      (setq mode-line-hud--call-log nil)
    (setq mode-line-hud--call-log (list)))
  (message "mode-line-hud debug %s" (if mode-line-hud--call-log "enabled" "disabled")))

(provide 'mode-line-hud)

;;; mode-line-hud.el ends here

