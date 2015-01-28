(define (fast-mul-iter a b product)
  (cond ((= b 0) product)
	((even? b) (fast-mul-iter (double a) (halve b) product))
	(else (fast-mul-iter a (- b 1) (+ a product)))))



(define (fast-mul a b) (fast-mul-iter a b 0))

(fast-mul 3 7)
