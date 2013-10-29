;;;;;;;;;;;;;
; Chapter 1 ;
;;;;;;;;;;;;;

(defparameter *titles*
  "Norvig's list of common titles."
  '(Mr Mrs Miss Sir Madam Dr))

(defun pick-last (ls)
  "Pick the last item of a list."
  (first (last ls)))

(defun first-name (name)
  "Select the first name from a name represented as a list."
  (if (member (first name) *titles*)
    (first-name (rest name))
    (first name)))

; Exercise 1.1
(defun last-name (name)
  "Select the last name from a name represented as a list."
  (first-name (reverse name)))

; Exercise 1.2
(defun power (num ex)
  "Raise a number to an integer exponent."
  (cond
    ((= ex 0) 1)
    ((= ex 1) num)
    (t        (* num (power num (- ex 1))))))

; Exercise 1.3
(defun count-atoms (expr)
  "Count the number of atoms in an expression."
  (length (flatten expr)))

(defun flatten (expr)
  "Flatten an expression."
  (cond ((null expr) nil)
        ((atom expr) (list expr))
        (t           (mapcan #'flatten expr))))

; Exercise 1.4
(defun count-anywhere (expr0 expr1)
  "Counts the number of times the 'expr0' occurs in 'expr1'."
  (cond
    ((= expr0 expr1)  1)
    ((atom expr1)     0)
    (t
      (+ (count-anywhere expr0 (first expr1))
         (count-anywhere expr0 (rest expr1))))))

; Exercise 1.5
(defun dot-list (xs ys)
  "Dot product on two list of numbers."
  (apply #'+ (mapcar #'* xs ys)))

