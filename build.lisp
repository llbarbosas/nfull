(load "util.lisp")

(defundefparameter *args* '())

(ext:install-c-compiler)

(ensure-directories-exist "./bin")

(cond
    ((find-string "-c" *args*) (progn 
        (compile-file "nfull.lisp" :c-file t :h-file t :data-file t :system-p t)
        (move-files "bin" "nfull.c" "nfull.eclh" "nfull.data" "nfull.o")))
    (t (progn 
        (compile-file "nfull.lisp" :system-p t)
        (c:build-program "nfull" :lisp-files '("nfull.o"))
        (move-files "bin" "nfull" "nfull.o"))))

(quit)
