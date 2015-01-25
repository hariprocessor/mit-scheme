;good-enough?

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (new-good-enough? guess ex-guess)
  (< (abs (- (/ guess ex-guess) 1)) 0.01))

(define (new-sqrt-iter guess ex-guess x)
  (if (new-good-enough? guess ex-guess)
	  guess
	  (new-sqrt-iter (improve guess x) guess x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))


(sqrt-iter 1.0 3)
(new-sqrt-iter 1.0 1.1 3)
(sqrt-iter 1.0 100)
(new-sqrt-iter 1.0 1.1 100)
