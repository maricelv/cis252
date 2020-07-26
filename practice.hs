----------------------------------------------------------
-- A first look at Haskell
----------------------------------------------------------

{-  

   This is a comment 
    that goes across 
    multiple lines.

 -}

----------------------------------------------------------
--  Two examples from Lab 1
----------------------------------------------------------

-- convert Celsius temp to Fahrenheit
celsiusToFahr :: Float -> Float
celsiusToFahr c = c*9/5 + 32

-- is Celsius temperature greater than 80F?
isTooHot :: Float -> Bool
isTooHot t = celsiusToFahr t > 80

----------------------------------------------------------
--  Some additional examples, taken from the slides
----------------------------------------------------------

-- thrice is a function that accepts an integer n and multiplies it by 3
thrice :: Integer -> Integer
thrice n = 3*n   

-- isPositive is a function that accepts an integer num and determines
--       whether num is positive
isPositive :: Integer -> Bool
isPositive num =  (num > 0)

-- mystery is a function that accepts two integers (x and y) and 
--      calculates the sum of (thrice x)  and  y
mystery :: Integer -> Integer -> Integer
mystery x y =  (thrice x) + y


------------------------------------------------------------------------
-- average :: Float -> Float -> Float
--      
--     calculates the average of two floating-point numbers
------------------------------------------------------------------------

-- average :: Float -> Float -> Float


------------------------------------------------------------------------
-- allPos :: Integer -> Integer -> Integer -> Bool
--
--      determines whether three integers are all positive
--            (note: zero is neither positive nor negative)
------------------------------------------------------------------------

-- allPos :: Integer -> Integer -> Integer -> Bool


------------------------------------------------------------------------
-- someNeg :: Integer -> Integer -> Integer -> Bool
--
--      determines whether at least one of three integers is negative
--            (note: zero is neither positive nor negative)
------------------------------------------------------------------------

-- someNeg :: Integer -> Integer -> Integer -> Bool




------------------------------------------------------------------------
-- tuition :: Integer -> Integer
--
--    SU's tuition rates for undergraduates for AY 2019-2020
--
--    tuition cr  
--      calculates the cost of tuition for cr credits, based
--        on the following scale:
--            
--        Per semester (12-19 credits):   $26105 
--        Per credit  (first 11)           $2274  
--        Per credit  (20 or more)         $1568
--
------------------------------------------------------------------------

{-

tuition :: Integer -> Integer
tuition cr
    | cr <= 0   = 0 
    | cr <= 11  = cr * 2274
    | cr >= 20  = cr * 1568
    | otherwise = 26105

-}
