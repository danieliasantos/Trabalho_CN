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
{-# LANGUAGE TemplateHaskell #-}

module Parse (
    parse
) where

import           Control.Monad (replicateM)
import           Data.Char     (intToDigit)
import           Numeric       (showHex, showIntAtBase)
import           System.IO


parse = do
    print $ "Valor inteiro: 9223372036854775807"
    print $ showHex 9223372036854775807 ""
    print $ showIntAtBase 2 intToDigit 9223372036854775807 ""

