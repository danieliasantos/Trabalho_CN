-----------------------------------------------------------------------------
--
-- Module      :  Pi
-- Author      :  Daniel Elias
-- License     :
--
-- Source      :
-- Stability   :
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell     #-}

module Pi (
    piEuler
) where

-- GERACAO DE PI UTILIZANDO EULER --
piEuler :: Double -> Double
piEuler n
	| n == 0 = 4
	| n > 0  = 4 * (-1) ** n / (2.0 * n + 1) + piEuler (n-1)
