(define (p n)
  (pp n (- n 1) 0))


(define (expmod base exp m)
  (define (even? n) (= (remainder n 2) 0))
  (cond ((= exp 0) 1)
	((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
	(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (pp n a count)
  (cond ((= a 1) count)
	((= a (expmod a n n)) (pp n (- a 1) (+ count 1)))
	(else (pp n (- a 1) count))))

(p 10)
(p 9)
(p 11)
(p 561)
(p 1105)
(p 1729)
(p 2465)
(p 2821)
(p 6601)
