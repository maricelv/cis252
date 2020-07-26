-- Maricel Vicente
-- bvicente@syr.edu

import Data.Char

-- Problem 1

listify :: [ a ] -> [[ a ]]
listify [] = []
listify (x:xs) = [x] : listify xs

-- Problem 2

flipPairs :: [( a , b )] -> [( b , a )]
flipPairs [] = []
flipPairs ((x,y):ps) = (y,x) : flipPairs ps

-- Problem 3

flipCases :: String -> String
flipCases [] = []
flipCases (fs: str)
          | isUpper fs == True = toLower fs : flipCases str
          | otherwise = toUpper fs : flipCases str

-- Problem 4

neighbors :: [ a ] -> [( a , a )]
neighbors [] = []
neighbors (x:[]) = []
neighbors (x:y:xs) = (x,y): neighbors (y:xs)


-- Problem 5
replace :: Integer -> a -> [ a ] -> [ a ]
replace n s [] = []
replace n s (w:ws)
        | n <= 0 = (w:ws)
        | otherwise = s: replace (n-1) s ws

-- Problem 6

scrabblePoints :: [( Char , Integer )]
scrabblePoints = [('a',1),('b',3),('c',3),('d',2),('e',1),('f',4),('g',2),('h',4),('i',1),('j',8),('k',5),('l',1),('m',3),('n',1),('o',1),('p',3),('q',10),('r',1),('s',1),('t',1),('u',1),('v',4),('w',4),('x',8),('y',4),('z',10)]

getValue :: Char -> [( Char , Integer )] -> Integer
getValue ch [] = 0
getValue ch ((c,i):xs)
        | c == ch = i 
        | otherwise = getValue ch xs

scoreWord :: String -> Integer
scoreWord [] = 0
scoreWord (s:str) = (getValue s scrabblePoints) + scoreWord str

atLeast :: Integer -> [( Char , Integer )] -> [ Char ]
atLeast n [] = []
atLeast n ((c,i):cs)
          | n <= i = c : atLeast n cs
          | otherwise = atLeast n cs

update :: Char -> Integer -> [( Char , Integer )]-> [( Char , Integer )]
update c n [] = [(c,n)]
update c n ((x,y):cs)
       | c == x = update c n cs
       | otherwise = (x,y) : update c n cs