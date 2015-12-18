(defmacro while (test &rest body)
  `(do ()
       ((not ,test))
     ,@body))

(let ((x 0))
  (while (< x 10)
    (princ x)
    (incf x)))

(defmacro ntimes (n &rest body)
  `(do ((x 0 (1+ x)))
       ((>= x ,n))
     ,@body))

(ntimes 3
        (princ "."))

(macroexpand-1 '(ntimes 3 (princ ".")))


(macroexpand-1 '(ntimes 5 (setf x (1+ x))))

(ntimes 5 (setf x (1+ x)))
