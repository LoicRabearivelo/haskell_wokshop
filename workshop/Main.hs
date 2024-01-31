module Main where

import Operations
import System.Environment
import Data.Maybe (fromMaybe)

doOp :: String -> Maybe Int
doOp input = case words input of
    [x, "+", y] -> Just (addition (read x) (read y))
    [x, "-", y] -> Just (substraction (read x) (read y))
    [x, "*", y] -> Just (multiply (read x) (read y))
    [x, "/", y] -> case read y of
        0 -> Nothing
        _ -> case divide (read x) (read y) of
               Just result -> Just result
               Nothing -> Nothing
    _ -> Nothing


main :: IO ()
main = do
  putStrLn "Calcul simple (ex: 2 + 2 mais pas 2+2 ,il faut mettre des espaces entre chaque caractères):"
  input <- getLine
  case doOp input of
    Just result -> putStrLn $ "Result: " ++ show result
    Nothing -> putStrLn "Expression error"
