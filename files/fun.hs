bisection f a b e = if a < b then bis f a b e else bis f b a e

bis f a b e = let d = (b - a) / 2
                  m = (b + a) / 2
                  x = f a * f m < 0
              in
              if d < e then
                 m
              else if x then
                 bis f a m e
              else
                 bis f m b e

ntrt n r :: Int -> Double -> Double
ntrt n r = bis (\x -> x^n - r) 0 n 1e-8
