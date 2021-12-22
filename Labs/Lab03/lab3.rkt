#lang racket
(provide strings-to-nums make-names employees managers-only)

(define (strings-to-nums lst)
  (map string->number lst)
  )

(define (make-names fnames lnames)
  (map (lambda (lst1 lst2) (string-append lst1 " " lst2)) fnames lnames)
  )

(define employees
  '( ("Robert" "Tables" 100000 "Manager")
     ("Alice" "Liddell" 50000 "Copy editor")
     ("Tweedle" "Dee" 46000 "entry level")
     ("Tweedle" "Dum" 46000 "entry level")
     ("William" "Gates" 100000000000 "Manager")
     ("Marcus" "Aurelius" 0 "Manager")))

(define (managers-only lst)
  (filter (lambda (emp) (equal? (last emp) "Manager")) lst)
  )
