;product <- counter * product
;linear recursive process
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))


;counter <- counter + 1
;linear iterative process
(define (factorial-t n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
		 (+ counter 1)
		 max-count)))

(factorial-t 5 )
