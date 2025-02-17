#lang racket

; Global variables with optimized data structures
(define integer #f)
(define table (make-hash))
(define filename "")
(define array (vector))

; Buffer size for chunked output
(define BUFFER-SIZE 1048576) ; 1MB buffer

; Optimized output function for large datasets
(define (output-chunk lst port)
  (for ([item lst])
    (display item port)
    (display " " port)))

; Modified chunked output function that handles lists of any size
(define (chunked-output items chunk-size)
  (let loop ([remaining items])
    (when (not (null? remaining))
      (let ([current-chunk-size (min chunk-size (length remaining))])
        (output-chunk (take remaining current-chunk-size) (current-output-port))
        (when (> (length remaining) current-chunk-size)
          (loop (drop remaining current-chunk-size)))))))

; Optimized Function1 using chunked output
(define (function1 bool)
  (if integer
      ; For value-frequency pairs
      (begin
        (display "(")
        (let ([pairs (for/list ([i (in-range (vector-length array))])
                      (let ([val (vector-ref array i)]
                            [freq (hash-ref table (vector-ref array i))])
                        (format "(~a ~a)" val freq)))])
          (chunked-output pairs 1000))
        (display ")"))
      ; For repeated integers
      (let ([expanded-list 
             (for*/list ([val (in-vector array)])
               (let ([freq (hash-ref table val 0)]) ; Default to 0 if not found
                 (make-list freq val)))] ) ; Repeat the value based on its frequency
        (chunked-output (apply append expanded-list) 1000)))
  (newline)
  (restart))

; Optimized Function2 with direct sorting
(define (partition vec left right)
  (let ([pivot (vector-ref vec right)])
    (let loop ([i left]
               [j left]
               [store-index left])
      (cond
        [(> j (- right 1)) 
         (begin
           (let ([temp (vector-ref vec right)])
             (vector-set! vec right (vector-ref vec store-index))
             (vector-set! vec store-index temp))
           store-index)]
        [else
         (if (< (vector-ref vec j) pivot)
             (begin
               (let ([temp (vector-ref vec j)])
                 (vector-set! vec j (vector-ref vec store-index))
                 (vector-set! vec store-index temp))
               (loop i (+ j 1) (+ store-index 1)))
             (loop i (+ j 1) store-index))]))))

(define (iterative-quicksort vec)
  (let ([stack '()])  ; Use a list as stack instead of fixed-size vector
    ; Push initial range
    (set! stack (list (- (vector-length vec) 1) 0))
    
    (let sort-loop ()
      (when (not (null? stack))
        (let ([right (car stack)]
              [left (cadr stack)])
          (set! stack (cddr stack))
          
          (let ([pivot-index (partition vec left right)])
            ; Push sub-arrays to stack
            (when (< (+ pivot-index 1) right)
              (set! stack (cons right (cons (+ pivot-index 1) stack))))
            
            (when (> (- pivot-index 1) left)
              (set! stack (cons (- pivot-index 1) (cons left stack))))
            
            (sort-loop))))))
  vec)

(define (function2)
  (let ([keys-vector (list->vector (hash-keys table))])
    (set! array (iterative-quicksort keys-vector))
    (function1 integer)))

; Optimized Function3 with buffered reading
(define (function3 filename)
  (with-input-from-file filename
    (lambda ()
      (let ([in (current-input-port)])
        (let loop ()
          (let ([chunk (read-bytes BUFFER-SIZE in)])
            (when (positive? (bytes-length chunk))
              (for ([num (string-split (bytes->string/utf-8 chunk))])
                (let ([n (string->number num)])
                  (when n  ; Skip invalid numbers
                    (hash-update! table n add1 0))))
              (when (= (bytes-length chunk) BUFFER-SIZE)
                (loop))))))))
  (function2))

; Optimized Function4 with streaming read
(define (function4 filename)
  (with-input-from-file filename
    (lambda ()
      (let ([pairs (read)])
        (for ([pair pairs])
          (let ([value (first pair)]
                [freq (second pair)])
            (hash-set! table value freq))))))
  (function2))

; Optimized Function5 with faster file checking
(define (function5)
  (display "Enter the name of the input file: ")
  (set! filename (read-line))
  (call-with-input-file filename
    (lambda (in)
      (let loop ()
        (let ([c (read-byte in)])
          (cond
            [(eof-object? c) (void)]
            [(or (= c 32) (= c 9) (= c 10) (= c 13)) (loop)]  ; Skip whitespace
            [else
             (set! integer (or (and (>= c 48) (<= c 57))      ; 0-9
                              (= c 45)))                       ; -
             (if integer
                 (function3 filename)
                 (function4 filename))]))))))

; Optimized restart function
(define (restart)
  (set! filename #f)
  (set! array #f)
  (set! integer #f)
  (hash-clear! table)
  (display "\nMenu:\n1. Reset\n2. Quit\nEnter your choice: ")
  (flush-output)  ; Ensure prompt is displayed immediately
  (let ([choice (read-line)])
    (cond
      [(equal? choice "1") (function5)]
      [(equal? choice "2") (display "End of program\n")])))

(provide (all-defined-out))

; Main function
(define (main)
  (function5))

(main)
