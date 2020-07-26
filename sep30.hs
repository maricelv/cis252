
-- For each pair (c,n), we want a string with n copies of c
-- Combine all the created strings
-- replicate :: Int -> a -> [a]
-- ++
--concat :: Foldable t => t [a] -> [a] (a list of lists all in one list)

decode :: [(Char, Int)] -> String
decode [] = []
decode ((c,n):rest) = replicate n c ++ decode rest

-- March down the list, keeping track of the current character I'm searching
-- and how many I've seen so far
-- When we see a new character (or end of list) create a pair with the correct count and continue as warranted


encode :: String -> [(Char,Int)]
encode [] = []
encode (c:cs) = helper c 1 cs

-- * need a counter helper function
-- so far, we've seen n consecutive copies of the characters ch, still looking for str
helper :: Char -> Int -> String -> [(Char,Int)]
helper ch n [] = [(ch,n)]
helper ch n (c:cs)
       | ch == c = helper ch (n+1) cs
       | otherwise = (ch,n) : helper c 1 cs