-- Name: Maricel Vicente
-- Email: bvicente@syr.edu

-- Homework 7

import Data.Char

-- Problem 1

places :: Eq a => a -> [ a ] -> [ Integer ]
places x ys = map fst (filter (\(a,b) -> x==b )  ( zip [1..] ys ))

-- Problem 2

equalOn :: Eq b => ( a -> b ) -> ( a -> b ) -> [ a ] -> Bool
equalOn f g vals = null (filter (\x -> f x == g x  ) vals )

-- Problem 3

histogram :: [ Integer ] -> String
histogram xs = concat ( map f xs )
          where
          f :: Integer -> String
          f x = ['*' | _ <- [1..x]] ++ "\n"


-- Problem 4

isort :: Ord a => [ a ] -> [ a ]
isort [] = []
isort ( x : xs ) = ins x ( isort xs )
      where
        ins y [] = [ y ]
        ins y ( z : zs )
            | y <= z = y : z : zs
            | otherwise = z : ( ins y zs )

mySort :: ( a -> a -> Bool ) -> [ a ] -> [ a ]
mySort p [] = []
mySort p ( x : xs ) = ins x ( mySort p xs )
      where
        ins y [] = [ y ]
        ins y ( z : zs )
            | p y z = y : z : zs
            | otherwise = z : ( ins y zs )
            
-- Problem 5

zeroes :: ( Integer -> Integer ) -> Integer -> [ Integer ]
zeroes f limit = [x | x <- [0..limit], f x == 0]

-- Problem 6

changeFirst :: ( a -> Bool ) -> a -> [ a ] -> [ a ]
changeFirst p val [] = []
changeFirst p val (x:xs) 
            | p x = (val : xs)
            | otherwise = x : (changeFirst p val xs)


-- Problem 7

translate :: String -> String
translate cs
          | null front = cs ++ " way "
          | otherwise = back ++ " ay "
          where
                isConsonant :: Char -> Bool
                isConsonant c = not ( elem ( toLower c ) " aeiou " )
                ( front , back ) = (takeWhile isConsonant cs, dropWhile isConsonant cs )

pigLatin :: String -> String
pigLatin cs = unwords (map translate (words (cs)))