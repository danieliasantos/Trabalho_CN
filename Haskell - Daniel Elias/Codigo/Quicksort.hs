-----------------------------------------------------------------------------
--
-- Module      :  Quicksort
-- Author      :  Daniel Elias
-- License     :  AllRightsReserved
--
-- Maintainer  :
-- Stability   :
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------

module Quicksort (
    quicksort
) where


quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let esquerda = quicksort [a | a <- xs, a <= x]
        direita = quicksort [a | a <- xs, a > x]
    in  esquerda ++ [x] ++ direita
