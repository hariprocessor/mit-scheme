(define (sine angle)
 (if (not (> (abs angle) 0.1))
     angle
     (p (sine (/ angle 3.0)))))

;; a.
;; 12.15/3.0^x <= 0.1
;; 5 times
