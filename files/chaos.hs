import Data.List (foldr)

-- Print a list as a single string.
showL :: (Show a) => [a] -> String
showL = foldr (\x acc -> show x ++ acc) ""

fde :: Double -> Double -> Int -> [Double]
fde _ _ 0 = []
fde r x n = x' : fde r x' (n - 1)
  where x' = r * (1 - x) * x

