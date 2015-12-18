(defun show-squares (start end)
  (do ((i start (1+ i)))
      ((> i end) 'done)
    (format t "~A ~A~%" i (* i i))))

(show-squares 1 10)

(lambda (x)
  (1+ x))

((lambda (x y)
    (+ x y)) 3 4)

(funcall #'(lambda (x) (+ x 100)) 1)
