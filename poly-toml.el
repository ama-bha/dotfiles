(define-hostmode poly-toml-hostmode
  :mode 'toml-mode)


(define-innermode poly-toml-metadata-innermode
  :mode 'yaml-mode
  :head-matcher "\`[ \t\n]*---\n"
  :tail-matcher "^---\n"
  :head-mode 'host
  :tail-mode 'host)

(define-auto-innermode poly-toml-code-innermode
  :head-matcher (cons "^[ \t]*\\(```{?[[:alpha:]].*\n\\)" 1)
  :tail-matcher (cons "^[ \t]*\\(```\\)[ \t]*$" 1)
  :mode-matcher (cons "```[ \t]*{?\\(?:lang *= *\\)?\\([^ \t\n;=,}]+\\)" 1)
  :head-mode 'host
  :tail-mode 'host)

(define-polymode poly-toml-mode
 
  :innermodes '(poly-toml-metadata-innermode
                poly-toml-code-innermode))
