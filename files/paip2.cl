;;;;;;;;;;;;;
; Chapter 2 ;
;;;;;;;;;;;;;

(defun en-sentence ()
  "An English sentence."
  (append (en-noun-phrase) (en-verb-phrase)))

(defun en-noun-phrase ()
  "An English noun-phrase."
  (append (en-article) (en-noun)))

(defun en-verb-phrase ()
  "An English verb phrase."
  (append (en-verb) (en-noun-phrase)))

(defun en-article ()
  "An English article."
  (one-of
    '("the" "a")))

(defun en-noun ()
  "An English noun."
  (one-of
    '("mushroom" "man" "ball" "woman" "table" "sun")))

(defun en-verb ()
  "An English verb."
  (one-of
    '("hit" "took" "saw" "liked" "licked")))

(defun en-adj ()
  "An English adjective."
  (one-of
    '("big" "little" "green" "blue" "adiabatic" "salty")))

(defun en-prep ()
  "An English preposition."
  (one-of
    '("to" "in" "by" "with" "on")))

(defun en-pp ()
  "???"
  (append (en-prep) (en-noun-phrase)))

(defun en-adj* (&optional (p 0.5))
  "Zero or more English adjectives."
  (if (bernoulli p)
    (append (en-adj) (en-adj* p))
    nil))

(defun en-pp* (&optional (p 0.5))
  "Zero or more English prepositions."
  (if (bernoulli p)
    (append (en-pp) (en-pp* p))
    nil))

(defun en-sentensify (s &optional (end "."))
  "Forms a proper sentence string from a list of strings."
  (concatenate 'string (string-capitalize (reduce #'str+ s) :end 1) end))

; Statistics and Probabilitis

(defun bernoulli (&optional (p 0.5))
  "A Bernoulli trial with probability 'p' (default: 0.5)."
  (if (< (random 1.0) p) t nil))

(defun one-of (xs)
  "Return (as a list) a single element of a list at random."
  (list (random-elt xs)))

(defun random-elt (xs)
  "Choose an element from a list at random."
  (elt xs (random (length xs))))

; Generic string functions

(defun str+ (s0 s1)
  "Add two strings with a space between them. Mostly useful with reduce."
  (concatenate 'string s0 " " s1))

(defun add. (str)
  "Add a dot at the end of the sentence."
  (concatenate 'string a "."))

