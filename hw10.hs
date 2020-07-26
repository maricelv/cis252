-- Homework 10
-- Maricel Vicente
-- bvicente@syr.edu

-- Problem 1

import Data.Char

getInteger :: IO Integer
getInteger = do line <- getLine
                return (read line :: Integer)

getFloat :: IO Float
getFloat = do line <- getLine
              return (read line :: Float)

-- Problem 1
greet :: IO Int
greet = do putStrLn "What's your name "
           name <- getLine
           print ("Hello, " ++ name)
           return (length name)

-- Problem 2
shoutVertical :: String -> IO ()
shoutVerical [] = return ()
shoutVertical (c:cs) = do ch <- putChar (toUpper c)
                          putChar '\n'
                          shoutVertical cs

-- Problem 3
guess :: Integer -> IO Int
guess num = do putStrLn "Guess a number: "
               n <- getInteger
               if n /= num
                  then do putStrLn "Nope, try again. Please guess a number: "
                          n <- guess num
                          return (n+1)
                  else return (1)

-- Problem 4
nonzeros :: IO [Integer]
nonzeros = do x <- getInteger
              if x == 0
                 then return []
              else do y <- nonzeros
                      return (x:y)

-- Problem 5

calcSum :: IO (Float, Float)
calcSum = do x <- getFloat
             if x == -1
                then return (0.0,0.0)
             else do (y,z) <- calcSum
                     return (y+1, x+z)

-- Problem 6

average :: IO ()
average = do putStrLn "Please enter the numbers to average (-1 to terminate): "
             (b,c) <- calcSum
             if b == 0
                then putStrLn "There were no values to average "
             else do print ("The average is " ++ show (c/b))

             