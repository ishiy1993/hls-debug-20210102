{-# LANGUAGE TemplateHaskell #-}

module Main where

import qualified Data.Text.Lazy as LT
import qualified Data.Text.Lazy.IO as LT
import Lib

greeting :: LT.Text
greeting = $(embedFile "greeting.txt")

main :: IO ()
main = LT.putStr greeting
