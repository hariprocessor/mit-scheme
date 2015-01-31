(define (even? n) (= 0 (remainder n 2)))

(define (square m) (* m m))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
	(else (remainder (* base (expmod base (- exp 1) m)) m))))


(define (p a n count)
  (cond ((> a n) count)
	((= a (expmod a n n)) (p (+ a 1) n (+ count 1)))
	(else (p (+ a 1) n count))))

(p 0 561 0)

