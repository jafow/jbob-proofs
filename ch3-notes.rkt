(j-bob/prove (prelude+first-of-pair)
             '(((defun in-pair? (xs)
                  (if (equal (first-of xs) '?)
                    't
                    (equal (second-of xs) '?)))
                nil)
               ((dethm is-first-of-pair (b)
                       (equal (in-pair? (pair '? b)) 't))
                nil)))
               
; ch3 in-first-of-pair proof !!!
 (j-bob/prove (prelude+first-of-pair)
             '(((defun in-pair? (xs)
                  (if (equal (first-of xs) '?)
                    't
                    (equal (second-of xs) '?)))
                nil)
               ((dethm is-first-of-pair (b)
                       (equal (in-pair? (pair '? b)) 't))
                nil
                ((1 1) (pair '? b))
                ((1) (in-pair? (cons '? (cons b '()))))
                ((1 Q 1) (first-of (cons '? (cons b '()))))
                ((1 Q 1) (car/cons '? (cons b '())))
                ((1 Q) (equal-same '?))
                ((1) (if-true 't
                              (equal (second-of (cons '? (cons b '()))) '?)))
                (() (equal-same 't)))))
                
