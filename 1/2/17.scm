(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))))

(define (double n) (* n 2))

(define (halve n) (/ n 2))

(define (even? n) (= (remainder n 2) 0))


(define (fast-mul a b)
  (cond ((= b 0) 0)
	((even? b) (fast-mul (double a) (halve b)))
	(else (+ a (fast-mul a (- b 1))))))

(fast-mul 3 7)
