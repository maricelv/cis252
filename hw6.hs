-- Maricel Vicente
-- bvicente@syr.edu

-- HW 6

import HW6Defs

-- Problem 1

mage1, mage2, fighter1, fighter2, fighter3, fighter4:: Hero

mage1 = Mage 2 Health Potion

mage2 = Mage 4 Wealth Silver

mage3 = Mage 7 None (Shield 5)

fighter1 = Warrior Brute []

fighter2 = Warrior Brute [Gold, Gold, Silver, Weapon 6, Weapon 3]

fighter3 = Warrior Archer [Potion, Potion, Potion, Silver, Silver, Gold]

fighter4 = Warrior Swordster [Shield 4, Shield 3, Weapon 2, Potion, Silver, Silver, Gold, Gold, Gold]

-- Problem 2

isMoney :: Item -> Bool
isMoney (Potion) = False
isMoney (Shield _) = False
isMoney (Weapon _) = False
isMoney _ = True

-- Problem 3

cost :: Item -> Integer
cost (Potion) = 3
cost (Silver) = 1
cost (Gold) = 3
cost (Shield n) = 2*n
cost (Weapon p) = 1 + (2*p)

-- Problem 4

baseOffense :: Hero -> Integer
baseOffense (Mage 2 Health Potion) = 2
baseOffense (Mage 4 Wealth Silver) = 4
baseOffense (Mage 7 None (Shield 5)) = 7
baseOffense (Warrior Brute []) = 5
baseOffense (Warrior Brute [Gold, Gold, Silver, Weapon 6, Weapon 3]) = 5
baseOffense (Warrior Archer [Potion, Potion, Potion, Silver, Silver, Gold]) = 2
baseOffense (Warrior Swordster [Shield 4, Shield 3, Weapon 2, Potion, Silver, Silver, Gold, Gold, Gold]) = 3


-- Problem 5
wealth :: Hero -> Integer
wealth (Mage n ab item)
       | isMoney item = cost item
       | otherwise = 0
wealth (Warrior _ items) = sum[cost i | i<- items, isMoney i]


-- Problem 6

canBuy :: Hero -> Item -> Bool
canBuy (Mage n Wealth item) itemk = True
canBuy hero item
       | wealth hero >= cost item = True
       | otherwise = False

-- Problem 7

boostShields :: Integer -> Hero -> Hero
boostShelds l (Mage p abil (Shield x)) = Mage p abil (Shield (l+x))

boostShields k (Warrior style items) = Warrior style [buff a | a <- items]
             where
                buff :: Item -> Item
                buff (Shield x) = Shield (l + x)
                buff item = item

boostShields k (Mage p abil item) = Mage p abil item

-- Problem 8

heroPower :: Hero -> Integer
heroPower hero = baseOffense hero + nextPower hero

nextPower :: Hero -> Integer
nextPower (Mage _ _ (Weapon n)) = n
nextPower (Mage _ _ _) = 0
nextPower (Warrior _ items) = sum [n | Weapon n <- items]


-- Problem 9

goldBrutes :: [ Hero ] -> Integer

goldBrutes heroes = sum [ 1 | Warrior Brute items <- heroes, isGold items]

isGold :: [Item] -> Bool
isGold [] = False
isGold (Gold:items) = True
isGold ( _ : items) = isGold items
