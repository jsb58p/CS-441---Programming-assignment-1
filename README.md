# CS-441---Programming-assignment-1

# The prompt

---

Use racket to write the following program:

## Step 1:

Create a Boolean variable called “integer” set to false.

## Step 2:

Create a mutable hash table data structure called “table”.
 
## Step 3:

Create a string variable “filename”.
 
## Step 4:

Create a vector called “array”.
 
## Step 5:

Create a function called “restart”.

•	Set the value of “filename” to “#f”. 

•	Set the value of “array” to “#f”.

•	Set the value of “integer” to false.

•	Clear the hash “table”.

•	Give the user a menu with 2 cases: “Quit” or “Reset”.

•	In the case that the user selects “1”, call Function5.

•	In the case that the user selects “2”, output the message: “End of program”. 

•	Wait for user keyboard input. Do not create an infinite loop. 

•	End function.

## Step 6: 

Create the following functions:

## Function1: 

•	Parameter: Boolean variable

•	If the value of the Boolean variable “integer” is true, output the contents of the “array” as (value frequency) pairs in the form “(value frequency)” on a single row, each separated by a space.

•	Else, output the contents of “table” as integers on a single row, each separated by a space. Each integer should be repeated the amount of their frequency in “table”.

•	Call the function “restart”.

•	End function.

## Function2: 

•	There should be no “if” statements in this function.

•	Read values from “table” into “array”.

•	Use a custom quick sort method on “array”.

•	Call Function1 with the parameter “integer”.

•	End function.

## Function3:

•	Parameter: string variable containing the name of an input text file located in the program folder.

•	Open the file of the filename given in the Function3 Parameter. It is located in the program folder

•	The file will contain integers separated by a space. If there is a “-“ symbol in front of an integer it should be read as a negative integer.

•	Read the integers into the mutable hash table “table”.

•	Call Function2.

•	End function.

## Function4:

•	Parameter: string variable containing the name of an input text file located in the program folder

•	The file will contain a single list of (value frequency) pairs in the format: ( (value1 freq1) (value2 freq2) (value3 freq3) ...). 

•	Each value-frequency pair consists of two integers: the value and its frequency 

•	The entire list is enclosed in parentheses, and each pair is also enclosed in parentheses

•	Read the (value frequency) pairs into the mutable hash table “table”. The “value” should be duplicated in the table “frequency” amount of times.  

•	Call Function2.

•	End function.


## Function5: 

•	This function should be the only function called in the main function of the program.

•	Prompt the user to type the name of an input text file located in the program folder.

•	Assign the user input string to the string variable “filename”.

•	Look at the first non-space character in the text file. 

•	If the first non-space character is an integer or a “-“ symbol, set the Boolean variable “integer” to true and call Function3 with the parameter “filename”. 

•	Else, call Function4 with the parameter “filename”.

End function.

---

## Use of AI

-This prompt went through several different iterations while I was trying to use ChatGPT and CoPilot. I originally just wrote a paragraph with all of the steps. When asking ChatGPT how to make better prompts, it gave examples using formatted text with bullet points and lists. I decided to adopt this approach. It definitely helped me with iterating and modifying my prompt more easily. However, the results that I got from ChatGPT were not desirable. 

This was no doubt partially due to the fact that my prompt doesn't give every last detail necessary to implement the program. But it was mostly due to the fact that ChatGPT refused to do what I told it to do, and insisted on doing things that I told it not to do. You can see remnants of my struggles with ChatGPT in this prompt, such as the line "There should be no “if” statements in this function." in Function2. ChatGPT insisted on using "if" statements even when it wasn't necessary, and always forgot to provide a coinciding "else" or "#f". This is just one of the numerous errors that displayed ChatGPTs lack of understanding of Racket. Even after telling the AI what mistake it was making and how to correct it, it continued making that same mistake. 

Other problems with ChatGPT and CoPilot mostly revolved around it doing the exact opposite of what I told it to do. If I say Quick Sort, ChatGPT provides a Merge Sort method. If I say use vectors for sorting, ChatGPT uses lists for sorting. If I tell ChatGPT not to use functions from other libraries, ChatGPT will either import other libraries anyways, or simply use functions from other libraries without importing them. If I say the program should have balanced parentheses, ChatGPT provides unbalanced parentheses.

I spent many hours trying to get ChatGPT to cooperate. I tried many different methods. I scrapped many prompt ideas and tested out many things. I am not joking when I say that as of the Saturday before this assignment was due, I was planning on turning in a document with over 500 pages of prompts and responses to implement a code using ChatGPT that didn't even fully function as intended. I tried several different methods. Some of the methods I tried included

-Giving small descriptions of a simple program, generating a response, then giving more small descriptions to add, then generating a response, repeat, bugfix, etc.

-Giving a self-contained description of a single function. Reset the AI. Give a self-contained description of the next function. Reset the AI. Repeat.

-Giving an example of input, and an example of the desired output. Let the AI generate its own solution, then tell it to change things where necessary (such as using a specified sorting algorithm instead of default Racket library sort.)

The last example I gave was the only one that was able to generate a working solution (which resulted in the 500+ page document that I nearly submitted for this assignment), but it was far from perfect. For example, even though I specified that the sorting algorithm should be a Quick Sort, ChatGPT provided a Merge Sort. 

At this point I had tried Claude a couple of times in the week prior to the assignment being due, but Claude can only generate about 6 responses every several hours, so I decided to stick with ChatGPT and CoPilot. But I decided to make some modifications to the prompt at the top of this page (mainly just making sure the variables are cleared in the "restart" function) and entered it into Claude. 

Miraculously, Claude was able to do everything that I asked on the first try. However, I noticed the output was very slow for the large input file. So I asked Claude to figure out what the issue was and to come up with a solution. There were a few errors along the way, but within a couple of responses Claude was able to resolve these issues and develop a solution for the slow output. 

Unfortunately, in the process of these optimizations, Claude decided to remove my Quick Sort function. I gave Claude the function in isolation, and asked it to change the method to a custom Quick Sort. Within a couple of prompts, Claude was able to provide a working solution. 









## Main functions of the program

-The AI used to make this program is "Claude".

-This program asks the user to input the name of a text file. 

-If the text file contains integers, the program will consolidate and sort the list into (value frequency) pairs. These sorted pairs will be output to the console. 

-If the text file contains a list of (value frequency) pairs, the program will sort them and output the integers to the console, repeated the amount of their frequency. 

-Program uses a custom quick sort function created by the AI (Claude) to do the sorting.

-After output, the program asks the user if they would like to process another file.

## Each Significant Block of Code

  -I used a single prompt to generate most of the code, then asked Claude to make suggestions afterwards.

    ; Global variables with optimized data structures
    (define integer #f)
    (define table (make-hash))
    (define filename "")
    (define array (vector))

  -This block of code creates the identifiers that will be used throughout the program. Claude had no issue creating the variables.

  ---

  ---

  ## Output Functions

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
                 (for*/list ([(k v) (in-hash table)]
                            [i (in-range v)])
                   k)])
            (chunked-output expanded-list 1000)))
      (newline)
      (restart))

-This block of code was made by because I requested Claude to provide an alternative method of producing output that would handle large input files more effectively using "chunked output" than the original solution it produced. This required minimal prompting and bug-fixing with Claude. I didn't specify how I wanted it to improve performance. If you look at my prompts, you will see that I asked for a suggestion and this is what Claude provided. 

---

-The original code was much simpler, and the output was very slow for the large input file.

    ; Function1
    (define (function1 bool)
      (if integer
          (begin
            (display "(")
            (for ([i (in-range (vector-length array))])
              (let ([val (vector-ref array i)]
                    [freq (hash-ref table (vector-ref array i))])
                (display (format "(~a ~a) " val freq))))
            (display ")"))
          (for ([(k v) (in-hash table)])
            (for ([i (in-range v)])
              (display (format "~a " k)))))
      (newline)
      (restart))

  -As you can see, the suggestions that Claude introduced involved the creation of new functions, which it handled completely on its own. 

  ---

  ---

  ## Quick Sort Function

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

  -This block of code is the Quick Sort implementation used to sort the values. When I asked Claude for optimizations, it initially switched to the default Racket library sort. However, I was able to take the function using this sort, enter it into Claude, and ask for it to implement a Quick Sort instead. With minimal bug fixing, Claude was able to come up with a quick sort implementation to replace the default Racket library sort.

---

-This is the original code Claude generated for the Quick Sort:

    ; Quick sort implementation
    (define (quick-sort vec left right)
      (when (< left right)
        (let ([pivot (partition vec left right)])
          (quick-sort vec left (sub1 pivot))
          (quick-sort vec (add1 pivot) right))))
    
    (define (partition vec left right)
      (let* ([pivot-val (vector-ref vec right)]
             [store-idx left])
        (for ([i (in-range left right)])
          (when (<= (vector-ref vec i) pivot-val)
            (vector-swap! vec i store-idx)
            (set! store-idx (add1 store-idx))))
        (vector-swap! vec store-idx right)
        store-idx))
    
    (define (vector-swap! vec i j)
      (let ([temp (vector-ref vec i)])
        (vector-set! vec i (vector-ref vec j))
        (vector-set! vec j temp)))

    ; Function2
    (define (function2)
      (set! array (list->vector (hash-keys table)))
      (quick-sort array 0 (sub1 (vector-length array)))
      (function1 integer))

  ---
  ---

  ## Reading a file containing integers

  -The following block of code is the final solution generated by Claude to read a file containing integers. This code was revised by Claude to improve performance along with the other functions. This code only runs after a function determines that the file indeed contains integers. Files containing (value frequency) pairs are handled by a different function.

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

---

      The original code that Claude generated based off of my original prompt:

      ; Function3
    (define (function3 filename)
      (with-input-from-file filename
        (lambda ()
          (let ([nums (read-line)])
            (for ([num (string-split nums)])
              (let ([n (string->number num)])
                (hash-update! table n add1 0))))))
      (function2))

---
---

## Reading a file containing (value frequency) pairs

-The following block of code is the solution generated by Claude to read a file containing (value frequency) pairs. The original code that Claude generated was used as the final solution.

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

---
---

## Checking the file for integers or (value frequency) pairs

-The following block of code asks the user for the input file and checks the file to see if it contains integers or (value frequency) pairs. Then it calls the appropriate function that handles the format of data present in the input file.

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

---

-I originally had asked Claude to check the file to see if the first non-space character was an integer or a negative sign, and make the decision based off of that. When I asked it to improve the code to make it more optimized, this was the solution it gave me. I'm not sure what exactly it's doing, but it seems to work and I was running out of time so I didn't question it. The original code Claude generated was simpler: 

    ; Function5
    (define (function5)
      (display "Enter the name of the input file: ")
      (set! filename (read-line))
      (let ([first-char (with-input-from-file filename
                          (lambda ()
                            (let loop ()
                              (let ([c (read-char)])
                                (if (char-whitespace? c)
                                    (loop)
                                    c)))))])
        (if (or (char-numeric? first-char)
                (char=? first-char #\-))
            (begin
              (set! integer #t)
              (function3 filename))
            (function4 filename))))    

---
---

## Restart Function

-The following code is the restart function. This function exists to ask the user if they want to run the program again. It also clears the values for the variables so that it handles restarting correctly. 
   
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

  -The code that Claude originally generated, before I asked for performance improvements, was almost identical. All that the newest version changed was adding (flush-output). It was straightforward.


  ---
  ---

  ## Main Function

  The main function just calls function5. Each function calls the next function that is needed. The restart function will loop back to function 5 at the user's requests, in the restart function. This is how I intended it to be based on the prompt that I gave. 

    ; Main function
    (define (main)
      (function5))
    
    (main)
  
