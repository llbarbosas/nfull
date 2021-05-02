build: clean
	@ecl --load build.lisp
build-c: clean
	@ecl --eval "(defparameter *args* '(|-c|))" --load build.lisp
clean:
	@rm -r bin 2> /dev/null && mkdir bin
