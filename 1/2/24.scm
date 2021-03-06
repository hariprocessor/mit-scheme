(define (even? n) (= (remainder n 2) 0))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
	(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a) (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))


(define (timed-prime-test n)
;;  (newline)
;;  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10000)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

;; (define (smallest-divisor n)
;;   (find-divisor n 2))

;; (define (find-divisor n test-divisor)
;;   (cond ((> (square test-divisor) n) n)
;; 	((divides? test-divisor n) test-divisor)
;; 	(else (find-divisor n (+ test-divisor 1)))))

;; (define (divides? a b) (= (remainder b a) 0))

;; (define (prime? n)
;;   (= n (smallest-divisor n)))


(define (search-for-prime n a)
  (define (even? n) (= (remainder n 2) 0))
  (cond ((= a 0))
	((even? n) (search-for-prime (+ n 1) a))
	((timed-prime-test n) (search-for-prime (+ n 1) (- a 1)))
	(else (search-for-prime (+ n 1) a))))

;;(search-for-prime 100000000000000 3) ;; 17.53 17.52 17.51
;;(search-for-prime 10000000000000 3) ;; 5.53 5.56 5.51
;;(search-for-prime 1000000000000 3) ;; 1.75 1.75 1.76
(search-for-prime 1000000000 3)
(search-for-prime 1000000000000000000 3)

;; 1.24
;; expect -> twice different
;; good
