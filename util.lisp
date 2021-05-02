(defmacro defundefparameter (par default) 
    `(when (not (boundp ',par)) (defparameter ,par ,default)))

(defun find-string (s list) 
    (find s list :test #'string=))

(defun move-files (path &rest files) 
    (dolist (f files) (rename-file f (concatenate 'string path "/" f))))