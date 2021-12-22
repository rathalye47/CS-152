#lang racket
(provide reverse add-two-lists positive-nums-only)

(define (reverse lst)
  (if (empty? lst)
      lst
      (append(reverse(cdr lst)) (list(car lst))))
)

(define (add-two-lists lst1 lst2)
	(cond
          [(empty? lst1) lst2]
	  [(empty? lst2) lst1]
	  [else (cons (+ (car lst1) (car lst2)) (add-two-lists (cdr lst1) (cdr lst2)))]))
	          
(define (positive-nums-only lst)
  (if (empty? lst)
      lst
      (if (> (car lst) 0)
          (cons (car lst) (positive-nums-only (cdr lst)))
          (positive-nums-only (cdr lst))
      )
  )
)
