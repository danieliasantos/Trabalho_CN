-----------------------------------------------------------------------------
--
-- Module      :  Fibonacci
-- Author      :  Daniel Elias
-- License     :  AllRightsReserved
--
--
-- |
--
-----------------------------------------------------------------------------
module Fibonacci (
    fibonacci
) where

-- 1. FIBONACCI RECURSIVO
fibonacci :: Int -> Int
fibonacci n
    | n <= 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci (n - 1) + fibonacci (n - 2)
-- FIM FIBONACCI RECURSIVO
