(setq test-ws (websocket-open
               "ws://localhost:5001"
               :on-message (lambda (_websocket frame)
                             (setq wstest-msg (websocket-frame-text frame))
			     (with-temp-buffer (insert wstest-msg) (eval-buffer))
			     )
               :on-close (lambda (_websocket) (setq wstest-closed t))))

(websocket-close test-ws)

(websocket-send-text test-ws "x")
