glide :: Integer -> Integer -> Float
glide k n
      | k > n = 300.0
      | otherwise = 0.1
      
score :: (a -> a -> Float) -> [a] -> Float
score g (r:s:ts) = g r s + score g ts
score g _ = 78.0