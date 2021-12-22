#lang racket

;; Sum a list of numbers
(define (sum-list lst)
  (cond [(empty? lst) 0]
        [else (+ (car lst)
                 (sum-list (cdr lst)))]))

(sum-list '(1 2 3 4 5))


;; Multiply a list of numbers
(define (multiply-list lst)
  (cond [(empty? lst) 1]
        [else (* (car lst)
                 (multiply-list (cdr lst)))]))

(multiply-list '(1 2 3 4 5))

;; Combine a list, more general approach
(define (combine-right fn base lst)
  (cond [(empty? lst) base]
        [else (fn (car lst)
                  (combine-right fn
                             base
                             (cdr lst)))]))

(combine-right (λ(b y) (+ b y)) 0 '(1 2 3 4 5))
(combine-right (λ(b y) (* b y)) 1 '(1 2 3 4 5))

(foldr (λ(a y) (+ a y)) 0 '(1 2 3 4 5))
(foldr + 0 '(1 2 3 4 5))
(foldr * 1 '(1 2 3 4 5))

;; Combine a list, left-to-right version.
;; Note the difference in how the base case is defined.
;; This version is tail-recursive.
(define (combine-left fn acc lst)
  (cond [(empty? lst) acc]
        [else (combine-left fn
                            (fn (car lst) acc)
                            (cdr lst))]))

;; Note the difference between these two functions.
(combine-right cons null '(1 2 3 4))
(combine-left cons null '(1 2 3 4))

;; Foldr is right-to-left.
(foldr string-append "." '("go" " " "spartans"))

;; Foldl is left-to-right.
(foldl string-append "." '("go" " " "spartans"))