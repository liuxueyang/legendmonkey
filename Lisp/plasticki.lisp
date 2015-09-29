;;; Strings Part

;; Problem 1
(defun midverse-word (word)
  "reverse all but the first and last letters"
  (let* ((len (length word)))
    (concatenate 'string
		 (subseq word 0 1)
		 (reverse  (subseq word 1 (1- len)))
		 (subseq word (1- len) len))))

(defun midverse-word-without-length (word)
  "reverse all but the first and last letters"
  (let* ((last-char (subseq (reverse word) 0 1))
	 (rest-str (subseq word 1)))
    (concatenate 'string
		 (subseq word 0 1)
		 (subseq (reverse rest-str) 1)
		 last-char)))


(defun optimize-midverse-word (word)
  "reverse all but the first and last letters"
  (let* ((rev-sub (reverse (subseq word 1))))
    (concatenate 'string
		 (subseq word 0 1)
		 (subseq rev-sub 1)
		 (subseq rev-sub 0 1))))

;;; Problem 2
(defun rotate (word n)
  "rotates a string n characters to the left"
  (concatenate 'string
	       (subseq word n)
	       (subseq word 0 n)))

;;; Testing a Result
;;; Problem 3
(defun piglatin-update (word)
  "update piglatin in Strings"
  (let* ((first-char (subseq word 0 1)))
    (if (or (string= "a" first-char) (string= "e" first-char)
	    (string= "i" first-char) (string= "o" first-char)
	    (string= "u" first-char))
	(concatenate 'string
		     word
		     "way")
	(concatenate 'string
		     (subseq word 1)
		     (subseq word 0 1)
		     "ay"))))
