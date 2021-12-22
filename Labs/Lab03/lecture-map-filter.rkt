#lang racket

;; PART 1

;; Implement a function that adds one to every number
(define (add-one-to-each-elem lst)
  (cond [(empty? lst) lst]
        [else (cons (+ (car lst) 1)
                    (add-one-to-each-elem (cdr lst)))]))

(add-one-to-each-elem '(1 2 3 4))

;; Implement a function that subtracts two from every number
(define (subtract-two-from-each-elem lst)
  (cond [(empty? lst) lst]
        [else (cons (- (car lst) 2)
                    (subtract-two-from-each-elem (cdr lst)))]))

(subtract-two-from-each-elem '(1 2 3 4))


;; Make a general version
(define (do-to-each-elem fn lst)
  (cond [(empty? lst) lst]
        [else (cons (fn (car lst))
                    (do-to-each-elem fn (cdr lst)))]))

(do-to-each-elem (lambda(x) (+ x 1)) '(1 2 3 4))
(do-to-each-elem (lambda(x) (- x 1)) '(1 2 3 4))
(do-to-each-elem (lambda(x) (* x x)) '(1 2 3 4))

(map (lambda(x) (+ x 1)) '(1 2 3 4))
(map (lambda(x) (- x 1)) '(1 2 3 4))
(map (lambda(x) (* x x)) '(1 2 3 4))

;; Map can also apply to multiple arguments in Racket,
;; though this is not true of all functional languages.
(map + '(1 2 3) '(4 5 6))
(map list '('a 'b 'c) '(1 2 3) '("r" "g" "b"))

;; Adding a newline before part 2
(displayln "")

;; PART 2

(define (pos-nums-only lst)
  (cond
    [(empty? lst) '()]
    [(<= 0 (car lst)) (cons (car lst) (pos-nums-only (cdr lst)))]
    [else (pos-nums-only (cdr lst))]))

(pos-nums-only '(99 2 -5 0 3 7 -12))

(define (get-nums lst)
  (cond
    [(empty? lst) '()]
    [(number? (car lst)) (cons (car lst) (get-nums (cdr lst)))]
    [else (get-nums (cdr lst))]))

(get-nums '(3 "hello" 92))

(define (extract-elems fn lst)
  (cond
    [(empty? lst) '()]
    [(fn (car lst)) (cons (car lst) (extract-elems fn (cdr lst)))]
    [else (extract-elems fn (cdr lst))]))

(extract-elems number? '(3 "hello" 92))
(filter number? '(3 "hello" 92))
(filter (lambda(x)(= 0 (modulo x 2))) '(1 2 3 4 5 6 7 8 9 10))
