{-# LANGUAGE CPP, TemplateHaskell #-}
-----------------------------------------------------------------------------
--
-- Module      :  Main
-- Copyright   :
-- License     :  AllRightsReserved
--
-- Maintainer  :
-- Stability   :
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------

module Main (
    main
) where

main = putStrLn "Daniel Elias"

-- calculo da serie de fibonacci
fibonacci :: Int -> Int
fibonacci n
    | n < 0 = 0
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci (n - 1) + fibonacci (n - 2)
-- fim do calculo da serie de fibonacci

-- metodo de ordenacao de vetor usando quicksort
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
    let esquerda = quickSort [a | a <- xs, a <= x]
        direita = quickSort [a | a <- xs, a > x]
    in  esquerda ++ [x] ++ direita
-- fim do metodo de ordenacao quicksort

-- calculo de fatorial
fatorial :: Int -> Int
fatorial n
    | n < 0 = 0
    | n == 0 = 1
    | otherwise = n * fatorial (n - 1)
-- fim do calculo de fatorial
