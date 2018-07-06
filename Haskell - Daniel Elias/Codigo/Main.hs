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

import System.IO
--import Graphics.UI.GLUT
import Control.Exception
import Control.Monad
import Data.Int
import Data.Complex


-- 1. FIBONACCI RECURSIVO
fibonacci :: Int -> Int
fibonacci n
    | n <= 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci (n - 1) + fibonacci (n - 2)
-- FIM FIBONACCI RECURSIVO

-- 3. QUICKSORT
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
    let esquerda = quickSort [a | a <- xs, a <= x]
        direita = quickSort [a | a <- xs, a > x]
    in  esquerda ++ [x] ++ direita
-- FIM QUICKSORT


--4. CONJUNTO DE MANDELBROT (FRACTAL)

-- fim CONJUNTO DE MANDELBROT (FRACTAL)


-- calculo de fatorial
fatorial :: Int -> Int
fatorial n
    | n < 0 = 0
    | n == 0 = 1
    | otherwise = n * fatorial (n - 1)
-- fim do calculo de fatorial

main = doLoop

doLoop = do
  putStrLn "--- Trabalho Final ---"
  putStrLn "Selecione sua opcao: "
  putStrLn "1. Fibonacci recursivo"
  putStrLn "2. ParseInt"
  putStrLn "3. Quicksort"
  putStrLn "4. Conjunto de Mandelbrot (Fractal)"
  putStrLn "5. Geracao de Pi pela formula de Euler"
  putStrLn "6. Estatistica em Matriz Randomica"
  putStrLn "7. Metodo de Relaxacao Sucessiva (SOR)"
  putStrLn "8. Metodo de Newton"
  putStrLn "q. Encerrar"
  command <- getLine
  case command of
    'q':_ -> return ()
    '1':do putStrLn ("------ 1. Fibonacci recursivo ------)
                       executaFib n
                       doLoop
    '2':filename -> do putStrLn ("Writing " ++ filename)
                       doWrite filename
                       doLoop
    _            -> doLoop

executaFib n =
    putStrLn (Digite o valor inteiro desejado para o n-esimo termo da serie de Fibonacci: " )
    n <- getLine
    fibonacci n

doRead filename =
    bracket (openFile filename ReadMode) hClose
            (\h -> do contents <- hGetContents h
                      putStrLn "The first 100 chars:"
                      putStrLn (take 100 contents))

doWrite filename = do
  putStrLn "Enter text to go into the file:"
  contents <- getLine
  bracket (openFile filename WriteMode) hClose
          (\h -> hPutStrLn h contents)
