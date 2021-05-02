(load "util.lisp")

(defundefparameter *args* (ext:command-args))
(defparameter *exec-name* (car *args*))

(defun show-usage ()
    (format t "Usage: ~a <number>~%" *exec-name*))

(defun show-help ()
    (format t "Returns a number in english full form~%"))

(defmacro when-t (test &rest forms) 
    "Shorthand for a when that evaluates true"
    `(when ,test (progn ,@forms t)))

(defmacro on-error-print (form) 
    "Shorthand for a when that evaluates true"
    `(handler-case ,form 
        (t (c) (format t "Error: ~a~%" c))))

(defun nfull (n) 
    "Return format ~r of a number string. Returns NIL on not number or format errors"
    (when (stringp n)
        (let ((n (parse-integer n :junk-allowed t)))
            (when-t n (on-error-print (format t "~r~%" n))))))

(defun main (args) 
    (if (find-string "--help" args) (progn (show-usage) (show-help))
        (let ((n (nth 1 args)))
            (when (not (nfull n))
                (show-usage)))))

(main *args*)
(quit)
