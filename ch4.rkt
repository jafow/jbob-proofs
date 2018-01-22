(load "/home/jaredfowler/Development/little-prover-code/j-bob/scheme/j-bob-lang.scm")
(load "/home/jaredfowler/Development/little-prover-code/j-bob/scheme/j-bob.scm")
(load "/home/jaredfowler/Development/little-prover-code/j-bob/scheme/little-prover.scm")
(dethm.align/align)

; partial (non-total) function
(defun parsh (x)
  (if (parsh (x))
      'nil
      't))

; proof by expansions
(dethm contradict ()
       'nil)

(j-bob/prove (prelude)
             '(((defun partial (x)
                  (if (partial x)
                      't
                      'nil))
                nil)
               ((dethm contradiction()
                       'nil)
                nil
                (() (if-same (partial x) 'nil))
                ((Q) (if-nest-A (partial x) 'nil 't))
                ((E) (if-nest-E (partial x) 't 'nil))
               )))
