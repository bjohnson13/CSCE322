module Helpers
( readGreaterThanSudokuFile
, printGame
) where

import Prelude
import Data.Char
import Data.List
import Debug.Trace

readGreaterThanSudokuFile :: String -> IO ([Int],[Int],[[Char]],[[Int]],[[Int]])
readGreaterThanSudokuFile = readIO

printGame :: [[Char]] -> IO ()
printGame [] = do
	       print ""
printGame (ro:ros) = do
	  	     print ro
		     printGame ros

