-- Homework 8
-- CIS 252

-- Maricel Vicente
-- bvicente@syr.edu

import BinaryTrees
import AltBinaryTrees

-- Problem 1

height :: BTree a -> Int
height Empty = -1
height (BNode v left right) = 1 + max (height left) (height right)

-- Problem 2

multTree :: Int -> BTree Int -> BTree Int
multTree n Empty = Empty
multTree n (BNode v left right) = BNode (v*n) (multTree n left) (multTree n right)

-- Problem 3

interiors :: BTree a -> [ a ]
interiors Empty = []
interiors (BNode v Empty Empty) = []
interiors (BNode v left right) = v : (interiors left ++ interiors right)


-- Problem 4

full :: BTree a -> Bool
full Empty = True
full (BNode v Empty Empty) = True
full (BNode v left Empty) = False
full (BNode v Empty right) = False
full (BNode v left right) = full (left) && full (right)

-- Problem 5

heightA :: AltTree a -> Int
heightA (Leaf atr) = 0
heightA (One v atr) = 1 + (heightA atr)
heightA (Two v atr atr1) = 1 + max (heightA atr) (heightA atr1)


-- Problem 6

multTreeA :: Int -> AltTree Int -> AltTree Int
multTreeA n (Leaf v) = Leaf (n*v)
multTreeA n (One v atr) = (One (v*n) (multTreeA n atr))
multTreeA n (Two v atr atr1) = (Two (v*n) (multTreeA n atr) (multTreeA n atr1))

-- Problem 7

interiorsA :: AltTree a -> [ a ]
interiorsA (Leaf v) = []
interiorsA (One v atr) = v : interiorsA atr
interiorsA (Two v atr atr1) = v : interiorsA atr ++ interiorsA atr1

-- Problem 8

fullA :: AltTree a -> Bool
fullA (Leaf v) = True
fullA (One v atr) = not (fullA atr)
fullA (Two v atr atr1) = fullA (atr) && fullA (atr1)

-- Problem 9

convert :: AltTree a -> BTree a
convert (Leaf v) =  (BNode v Empty Empty)
convert (One v atr) = (BNode v (convert atr) Empty)
convert (Two v atr atr1) = (BNode v (convert atr) (convert atr1))

-- Problem 10

makeComplete :: Int -> BTree Int
makeComplete n = complete n 1

complete :: Int -> Int -> BTree Int
complete n v
         | v > n = Empty
         | otherwise = BNode v (complete (n) (2*v)) (complete (n) (2*v + 1))

