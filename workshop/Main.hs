module Main where

import Operations
import System.Environment
import Data.Maybe (fromMaybe)

-- Note pour Nao : La fonction DoOp ne peut prendre qu'un calcul ace deux chiffres(ex : 2 + 2, 2 * 2, 2 / 2 etc)
-- La fonction DoOp ne prends que les calculs avec des espaces entre chaques caractères( ex: "2+2" -> Ne marche pas mais "2 + 2" oui)
-- Ps: Stp mets moi présent c'est dure l'haskell

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
