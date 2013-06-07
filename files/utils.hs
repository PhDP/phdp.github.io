
-- Compute the hamming code
ham []     _      = 0
ham _      []     = 0
ham (x:xs) (y:ys) = (if x \= y then 1 else 0) + ham xs ys

-- Hamming ratio
hamRat xs ys = hamming / size
         where hamming = fromIntegral $ ham xs ys
	           size = fromIntegral $ min (length xs) (length ys)


