(j-bob/prove (prelude)
             '(((defun memb? (xs)
                 (if (atom xs)
                   't
                   (if (equal (car xs) '?)
                     't
                     (< (size (cdr xs)) (size xs)))))
               'nil
               (() ())
               )))

(j-bob/prove (prelude)
             '(((defun memb? (xs)
                  (if (atom xs)
                   't
                   (if (equal (car xs) '?)
                     't
                     (< (size (cdr xs)) (size xs)))))
                'nil)
               ((defun remb (xs)
                  (if (atom xs)
                    '()
                    (if (equal (car xs) '?)
                      (remb (cdr xs))
                      (cons (car xs) (remb (cdr xs))))))
                'nil)
               ((dethm memb?/remb0 ()
                       (equal (memb? (remb '())) 'nil))
                'nil
                (() ()))))
