; prove them Ch3 frame 28
(load "/home/jaredfowler/Development/little-prover-code/j-bob/scheme/j-bob-lang.scm")
(load "/home/jaredfowler/Development/little-prover-code/j-bob/scheme/j-bob.scm")
(load "/home/jaredfowler/Development/little-prover-code/j-bob/scheme/little-prover.scm")
(dethm.align/align)

(defun pair (x y)
  (cons x (cons y '())))

(defun first-of (x)
  (car x))

(defun second-of (x)
  (car (cdr x)))

(dethm first-of-pair (a b)
       (equal (first-of (pair a b)) a))

(dethm second-of-pair (a b)
      (equal (second-of (pair a b)) b))

(defun prelude+first-of-pair ()
    (j-bob/define (prelude)
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
                (() (equal-same a))))))

(j-bob/prove (prelude+first-of-pair)
             '(((defun in-pair? (xs)
                  (if (equal (first-of xs) '?)
                    't
                    (equal (second-of xs) '?)))
                nil)))
(defun predlude+in-first-of-pair ()
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
                (() (equal-same 't))
                ))))
