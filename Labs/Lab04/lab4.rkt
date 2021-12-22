#lang racket
(provide sumofsquares1 sumofsquares2 join-strings make-html-tags)

;; Given a list of numbers, produce the sum of their squares. 
;; Use foldr, not recursion.
(define (sumofsquares1 lst)
  (foldr (lambda (value sum) (+ (sqr value) sum)) 0 lst)
)

;; Repeat with foldl
(define (sumofsquares2 lst)
  (foldl (lambda (value sum) (+ (sqr value) sum)) 0 lst)
)

;; Using foldl, combine a list of strings into a single string,
;; separated by the specified separator.  Separators should only
;; appear between words
(define (join-strings list-of-strings separator)
      (foldl (lambda (word result)
               (if (equal? result "")
                   word
                   (string-append result separator word)
               )
             )
               "" list-of-strings)
)

;; Make matching open and close tags, using the list of tag-names
(define (make-html-tags tag-names)
  (string-append
   (foldl
    (lambda (open result1) (string-append result1 "<" open ">")) "" tag-names)
   (foldr
    (lambda (closed result2) (string-append result2 "</" closed ">")) "" tag-names)
  )
)
