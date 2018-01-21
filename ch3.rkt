; prove them Ch3 frame 28
(J-Bob/step (prelude)
            '(equal (in-pair? (pair '? 'b)) 't)
            '((1 1) (cons '? (cons 'b '())))
            '(
              
; j-bob prove ch3-28
(j-bob/prove (prelude)
             '(((defun pair (a b)
                  (cons a (cons b '())))
                nil)
               ((defun second-of (xs)
                  (car (cdr xs)))
                nil)
               ((defun first-of (xs)
                  (car xs))
                nil)
               ((defun in-pair? (xs)
                  (if (equal (first-of xs) '?)
                    't
                    (equal (second-of xs) '?)))
                nil)
               ((dethm in-first-of-pair (b)
                       (equal (in-pair? '(? b)) '?))
                nil
                ((1 1) (in-pair? '(? b)))
                ((1) (equal-same '?)))))
                 

; jbob/prove ch3-13
(j-bob/prove (prelude)
               '(((defun pair (a b)
                    (cons a (cons b '())))
                  nil)
                 ((defun second-of (xs)
                    (car (cdr xs)))
                  nil)
                 ((defun first-of (xs)
                    (car xs))
                  nil)
                 ((dethm first-of-pair (a b)
                         (equal (first-of (pair a b)) a))
                         nil
                         ((1 1) (pair a b))
                        ;(equal (first-of (cons a (cons b '()))) a)
                         ((1) (first-of (cons a (cons b '()))))
                        ; (equal (car (cons a (cons b '()))))
                         ((1) (car/cons a (cons b '())))
                         ; (equal a a)
                         (() (equal-same a)))))
                        ;'t
