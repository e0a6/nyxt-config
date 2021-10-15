(defvar *my-search-engines*
  (list
   '("doi" "https://dx.doi.org/~a" "https://dx.doi.org/")
   '("py3" "https://docs.python.org/3/search.html?q=~a" "https://docs.python.org/3")
   '("ggl" "https://www.google.com/search?q=~a" "https://www.google.com/")))

(define-configuration buffer
  ((search-engines (append %slot-default%
                           (mapcar (lambda (engine) (apply 'make-search-engine engine))
                                   *my-search-engines*)))))
(define-configuration buffer
  ((default-modes (append '(nyxt::emacs-mode) %slot-default%))))

;;; Message buffer is the small line down below where all the messages
;;; are displayed. echo-area in Emacs parlance?
(define-configuration window
  ((message-buffer-style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "black"
         :color "white")))))))

;;; Color config for prompt-buffer (minibuffer in Emacs parlance).
(define-configuration prompt-buffer
  ((style (str:concat
           %slot-default%
           (cl-css:css
            '((body
               :background-color "black"
               :color "white")
              ("#prompt-area"
               :background-color "black")
              ;; The area you input text in.
              ("#input"
               :background-color "white")
              (".source-name"
               :color "black"
               :background-color "#556B2F")
              (".source-content"
               :background-color "black")
              (".source-content th"
               :border "1px solid #556B2F"
               :background-color "black")
              ;; The currently highlighted option.
              ("#selection"
               :background-color "#CD5C5C"
               :color "black")
              (.marked :background-color "#8B3A3A"
                       :font-weight "bold"
                       :color "white")
              (.selected :background-color "black"
                         :color "white")))))))

;;; Status buffer is the strip above the message buffer/echo area.
;;; Modeline in Emacs parlance.
(define-configuration status-buffer
  ((style (str:concat
           %slot-default%
           (cl-css:css
            ;; Arrows on the left.
            '(("#controls"
               :border-top "1px solid white"
               :background-color "#CD5C5C")
              ;; To the right of the arrows.
              ("#url"
               :background-color "black"
               :color "white"
               :border-top "1px solid white")
              ;; Far to the right.
              ("#modes"
               :background-color "black"
               :border-top "1px solid white")
              ;; The center segment.
              ("#tabs"
               :background-color "#CD5C5C"
               :color "black"
               :border-top "1px solid white")))))))

