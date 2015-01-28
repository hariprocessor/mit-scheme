;Pascal's triangle

(define (p a b)
  (cond ((= b 0) 1)
	((= a b) 1)
	(else (+ (p (- a 1) (- b 1)) (p (- a 1) b)))))
(p 4 2)

