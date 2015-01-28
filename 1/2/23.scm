(define (smallest-divisor n)
  (find-divisor n 2))

;; (define (find-divisor n test-divisor)
;;   (cond ((> (square test-divisor) n) n)
;; 	((divides? test-divisor n) test-divisor)
;; 	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(smallest-divisor 17)


(define (find-divisor n test-divisor)
  (define (even? n) (= (remainder n 2) 0))
  (cond ((> (square test-divisor) n) n)
	((and (even? test-divisor) (> test-divisor 2)) (find-divisor n (+ test-divisor 1)))
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 2)))))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

(define (search-for-prime n a)
  (define (even? n) (= (remainder n 2) 0))
  (cond ((= a 0))
	((even? n) (search-for-prime (+ n 1) a))
	((timed-prime-test n) (newline)(search-for-prime (+ n 1) (- a 1)))
	(else (search-for-prime (+ n 1) a))))

;; (search-for-prime 100000000000000 3) ;; 17.52 -> 14.37
;; (search-for-prime 10000000000000 3) ;; 5.53 -> 4.55
;; (search-for-prime 1000000000000 3) ;; 1.75 -> 1.46

;; not twice
;; the order of growth is not theta of n
;; 1.21
