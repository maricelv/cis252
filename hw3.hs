-- Maricel Vicente
-- bvicente@syr.edu


import Data.Char

-- Problem 1
upperOrStar :: Char -> Bool
upperOrStar ch = isUpper ch || ch == '*' 

-- Problem 2

moreInts :: Integer -> Integer -> [ Integer ] -> [ Integer ]
moreInts m q nums
         | even m && even q = q:m:nums
         | otherwise = m + q:nums

-- Problem 3
mysteryString :: Char -> Integer -> String
mysteryString ch n
              | isLower(ch) = [ch,toUpper(ch)]
              | isDigit(ch) || isUpper(ch) && n < 0 = ['!','!','!']
              | otherwise = [ch]

-- Problem 4
splitFloat :: Float -> (Integer, Float)
splitFloat num
           | num < 0 = (ceiling(num),(1-b))
           | otherwise = (a,b)
           where
             a = floor num
             b = num - fromInteger(a)

-- Problem 5

cost :: Integer -> Integer -> Bool -> Integer
cost burgs fries card
         | (burgs < 0 || fries < 0) = 0
         | burgs > 1 && not card && fries > 0 = burgs*7 + (fries-(div burgs 2))*2
         | (burgs > 0) && (fries >= 0) && card = burgs*6 + fries*2
         | otherwise = burgs*7 + 2*fries

-- Problem 6

rotate3 :: Integer -> Char -> Char -> Char -> String
rotate3 n item1 item2 item3
         | n <= 0 = []
         | otherwise = item1 : rotate3 (n - 1) item2 item3 item1

-- Problem 7

strings :: Integer -> Char -> [ String ]
strings n ch
        | n <= 0 = []
        | otherwise = rotate3 n ch ch ch: strings(n-1) ch

