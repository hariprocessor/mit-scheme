(define (f n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

(f 17)

(define (f-iter a b c count max-count)
  (cond ((< max-count 3) max-count)
	((= count 2) a)
	(else (f-iter (+ a (* b 2) (* c 3)) a b (- count 1) max-count))))

(define (f n) (f-iter 2 1 0 n n))

(f 17)
