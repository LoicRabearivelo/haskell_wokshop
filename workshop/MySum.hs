mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs
