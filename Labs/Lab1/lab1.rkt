#lang racket
(provide max-num fizzbuzz)

(define (max-num lst)
  (cond
      [(empty? lst) error "error"]
      [(= 1 (length lst)) (car lst)]
      [(>= (cadr lst) (car lst)) (max-num (cdr lst))]
      [else (max-num (cons (car lst) (cddr lst)))]
  )
)


;; The function counts from 1 to the specified number, printing a string with the result.
;; The rules are:
;;    If a number is divisible by 3 and by 5, instead say "fizzbuzz"
;;    Else if a number is divisible by 3, instead say "fizz"
;;    Else if a number is divisible by 5, instead say "buzz"
;;    Otherwise say the number
;;

(define (fizzbuzz n)
  (if (= n 1)
      (display "1 ")
      (begin (fizzbuzz(- n 1))
             (if (and (= 0 (modulo n 3)) (= 0 (modulo n 5)))
                 (display "fizzbuzz")
                 (if (= 0 (modulo n 3))
                     (display "fizz")
                     (if (= 0 (modulo n 5))
                         (display "buzz")
                         (display n)
                     )
                 )
             )
             (display " ")
      )
  )
)

(fizzbuzz 5)
