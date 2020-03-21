;;; doom-one-vapor-theme.el --- inspired by Atom One Dark -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-one-vapor-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-one-vapor-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-one-vapor-theme
  :type 'boolean)

(defcustom doom-one-vapor-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-one-vapor-theme
  :type 'boolean)

(defcustom doom-one-vapor-comment-bg doom-one-vapor-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-one-vapor-theme
  :type 'boolean)

(defcustom doom-one-vapor-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-one-vapor-theme
  :type '(choice integer boolean))

(defface font-lock-soft-face
  '((t :inherit default)) "Face to de-emphasize syntax aspects")

(defvar font-lock-soft-face
  'font-lock-soft-face)

(defface font-lock-punctuation-face
  '((t :inherit default)) "Face to de-emphasize syntax aspects")

(defvar font-lock-punctuation-face
  'font-lock-punctuation-face)

;;
(def-doom-theme doom-one-vapor
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((bg         '("#21242b" nil       nil            ))
   (bg-alt     '("#292c35" nil       nil            ))
   (base0      '("#1B2229" "black"   "black"        ))
   (base1      '("#1c1f24" "#1e1e1e" "brightblack"  ))
   (base2      '("#202328" "#2e2e2e" "brightblack"  ))
   (base3      '("#23272e" "#262626" "brightblack"  ))
   (base4      '("#3f444a" "#3f3f3f" "brightblack"  ))
   (base5      '("#606469" "#525252" "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b" "brightblack"  ))
   (base7      '("#9ca0a4" "#979797" "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf" "white"        ))
   (fg         '("#f2f2f2" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#bbc2cf" "#2d2d2d" "white"        ))

   (grey       base4)
   (red        '("#ff6c6b" "#ff6655" "red"          ))
   (orange     '("#da8548" "#dd8844" "brightred"    ))
   (green      '("#89e098" "#99bb66" "green"        ))
   (teal       '("#85ECAA" "#44b9b1" "brightgreen"  ))
   (yellow     '("#ECBE7B" "#ECBE7B" "yellow"       ))
   (blue       '("#8DBDEC" "#51afef" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   ;; (dark-blue  '("#276089" "#2257A0" "blue"         ))
   (magenta    '("#f382ac" "#c678dd" "brightmagenta"))
   (violet     '("#a9a1e1" "#a9a1e1" "magenta"      ))
   (cyan       '("#55b5db" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-one-vapor-brighter-comments dark-cyan base4))
   (doc-comments   (doom-lighten (if doom-one-vapor-brighter-comments dark-cyan base4) 0.15))
   (constants      violet)
   (functions      blue)
   (keywords       magenta)
   (methods        blue)
   (operators      violet)
   (type           magenta)
   (strings        teal)
   (variables      blue)
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-one-vapor-brighter-modeline)
   (-modeline-pad
    (when doom-one-vapor-padded-modeline
      (if (integerp doom-one-vapor-padded-modeline) doom-one-vapor-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.25) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.2) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))

   ((line-number &override) :foreground (doom-lighten 'bg 0.05))
   ((line-number-current-line &override) :foreground constants :weight 'bold)
   ((show-paren-match &override) :foreground red :background grey)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-one-vapor-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   (font-lock-type-face
    :foreground magenta
    :slant 'normal)
   (font-lock-builtin-face
    :foreground magenta
    :slant 'normal)
   (font-lock-keyword-face
    :foreground magenta
    :slant 'normal)
   (font-lock-preprocessor-face
    :foreground violet
    :slant 'normal)
   (font-lock-constant-face
    :foreground violet)
   (nxml-delimiter
    :foreground base5)
   (nxml-element-colon
    :foreground base5)
   (web-mode-html-tag-bracket-face
    :foreground base5)
   (rjsx-tag-bracket-face
    :foreground base5)

   ;; extra
   (font-lock-soft-face :foreground base5)
   (font-lock-punctuation-face :foreground violet)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; Doom modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)

   ;; ivy-mode
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)


   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)
   (org-level-1 :foreground blue :background bg)
   )

  ;; --- extra variables ---------------------
  ;; ()
  )

(defun vapor-punctuation-matcher (end)
    "Match punctuation characters till END."
  (let (pos (case-fold-search t))
    (while (and (setq pos (re-search-forward "\\s." end t))
                (not (null (nth 8 (syntax-ppss pos)))))) pos))

;; --- syntax specific faces (general) -------
(mapc
 (lambda (mode)
   ;; (font-lock-add-keywords mode '(("\\s." 0 'font-lock-punctuation-face)))
   (font-lock-add-keywords mode '((vapor-punctuation-matcher 0 'font-lock-punctuation-face)))
   (font-lock-add-keywords mode '((";$" 0 'font-lock-soft-face t)))
   (font-lock-add-keywords mode '(("\\s\\$" 0 'font-lock-soft-face)))
   (font-lock-add-keywords mode '(("\\s\(\\|\\s\)\\|\\." 0 'font-lock-soft-face)))
   )
 '(c-mode c++-mode emacs-lisp-mode python-mode js-mode js-jsx-mode js2-mode rjsx-mode typescript-mode clojure-mode))

;; --- syntax specific faces (c/c++) ---------
(mapc
 (lambda (mode)
   (font-lock-add-keywords mode '(("::\\|->" 0 'font-lock-soft-face))))
 '(c-mode c++-mode))

(mapc
 (lambda (mode)
   (font-lock-add-keywords mode '(("=" 0 'font-lock-soft-face))))
 '(web-mode))


;; --- syntax specific faces (c/c++) ---------
(with-eval-after-load "highlight-escape-sequences"
  (hes-mode)
  (add-to-list 'hes-mode-alist '(rjsx-mode . ,hes-js-escape-sequence-re))
  (put 'hes-escape-backslash-face 'face-alias 'font-lock-builtin-face)
  (put 'hes-escape-sequence-face 'face-alias 'font-lock-builtin-face))


;;; doom-one-vapor-theme.el ends here
