#lang racket

(define-syntax switch
  (syntax-rules ()
    [(switch y [value result]) result]
    [(switch y [value result] rest ...)
     (if (eqv? y value)
         result
         (switch y rest ...))]))

(define x 99)
(switch x
    [3 (displayln "x is 3")]
    [4 (displayln "x is 4")]
    [5 (displayln "x is 5")]
    [default (displayln "none of the above")])
     
(define (is-even? n)
   (switch (modulo n 2)
      [0 #t]
      [1 #f]))
(is-even? 9)
(is-even? 8)
