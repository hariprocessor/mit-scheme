(define (fast-expt b n)
  (define (square x) (* x x))
  (define (even? n) (= (remainder n 2) 0))
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

(define (fast-expt-iter product counter b)
  (define (square x) (* x x))
  (define (even? n) (= (remainder n 2) 0))
  (cond ((= counter 0) product)
	((even? counter) (fast-expt-iter product  (/ counter 2) (square b)))
	(else (fast-expt-iter (* product b) (- counter 1) b))))

(define (fast-expt-i b n) (fast-expt-iter 1 n b))

(fast-expt-i 2 11)
