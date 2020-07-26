-- HW 5
-- Maricel Vicente
-- bvicente@syr.edu


-- Problem 1
zap :: Char -> String -> String
zap ch [] = []
zap ch cs = [ c | c <- cs ,not(c==ch) ]

-- Problem 2
solos :: String -> String
solos [] = []
solos (c:cs)
      | elem c cs = solos (zap c cs)
      | otherwise = c : solos cs

-- Problem 3
catalog :: String -> String -> [( Char , Int )]
catalog [] _ = []
catalog (c:cs) (x:xs) = (c,total) : catalog (zap c cs) (x:xs)
        where
        total = sum[ 1 | x <- xs, c == x]

-- Problem 4

-- Part A
prefix::String -> String -> Bool
prefix [] ys = True
prefix xs [] = False
prefix (x:xs) (y:ys)
       | x == y = prefix xs ys
       | otherwise = False

-- Part B
subseq :: String -> String -> Bool
subseq [] ys = True
subseq (c:xs) (y:ys)
       | elem c ys = subseq xs ys
       | otherwise = False

-- Part C
substring :: String -> String -> Bool
substring [] ys = True
substring xs [] = False
substring xs (y:ys)
          | prefix xs (y:ys) = True
          | otherwise = substring xs ys

-- Part D
add :: Char -> [String] -> [String]
add a [] = []
add a (y:ys) = (a:y) : add a ys

subsequences :: String -> [String]
subsequences [] = [""]
subsequences (x:xs) = add x (subsequences xs) ++ subsequences xs
