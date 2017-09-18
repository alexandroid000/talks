{-# LANGUAGE NoMonomorphismRestriction #-}

module Main where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

import Figs


main :: IO ()
--main = mainWith (namedRegPoly 6 ["a","b","c","d","e","f"] :: Diagram B)
main = mainWith vennD
