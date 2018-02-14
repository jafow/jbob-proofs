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
;(J-Bob/step (prelude)
            ; pair 'a 'b
 ;           '(cons '? (cons 'b '()))
            
            