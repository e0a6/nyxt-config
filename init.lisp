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

