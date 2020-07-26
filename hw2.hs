-- Name: Maricel Vicente
-- Email: bvicente@syr.edu

-- Problem 1

commonDivisor :: Integer -> Integer -> Integer -> Bool
commonDivisor q m n = (mod m q) == (mod n q)

-- Problem 2
nand :: Bool -> Bool -> Bool
nand e1 e2 = not(e1 && e2)

-- Problem 3
distance :: Float -> Float -> Float -> Float -> Float
distance x1 x2 y1 y2 = sqrt((x1 - y1)^2 + (x2 - y2)^2)

-- Problem 4
onCircle :: Float -> Float -> Float -> Float -> Float -> Bool
onCircle a b x y r = sqrt((x - a)^2 + (y - b)^2) == r

-- Problem 5
howMany :: Bool -> Bool -> Integer
howMany b1 b2
        | b1 && b2 = 2
        | b1 || b2 = 1
        | otherwise = 0

-- Problem 6
numDays :: Integer -> Integer
numDays year
        | mod year 400 == 0 = 366
        | mod year 4 == 0 && not (mod year 100 == 0) = 366
        | year < 0 = -1
        | otherwise = 365
        
