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
{-# LANGUAGE RankNTypes #-}

module Newton (
    newton
) where

import           Numeric.AD      (diff)
import           Numeric.Natural (Natural)

newtonRoot
  :: (Floating a, Ord a)
  => Natural  -- ^ IterMax (i)
  -> a        -- ^ Toler (ep)
  -> a        -- ^ x (x0)
  -> (forall b. Floating b => b -> b)
  -> Maybe a
newtonRoot i ep x f
   | i == 0 = Nothing
   | abs (f x) - abs ep < 0 = Just x
   | otherwise = newtonRoot (i - 1) ep (x - f x / diff f x) f

newton = do
  print $ newtonRoot 100 0.000001 4 (\x -> x**4 + 2 * x**3 - 13 * x**2 - 14 * x + 24)
