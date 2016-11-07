module Helpers
( readGreaterThanSudokuFile
, printGame
, oneMove
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

-- trace ("Space Valid: " ++ show spaceValid ++ "\nRow Valid: " ++ show False)
oneMove :: [[Char]] -> [[Int]] -> [[Int]] -> Int -> Int -> [[Char]]
oneMove game vertical horizontal space value
 | checkValidMove == True = trace ("Valid") game
 | otherwise              = trace ("Invalid") game
 where
	 gameRow = getRowIndex space
	 gameCol = getColIndex space
	 checkValidMove = trace ("Space Valid: " ++ show spaceValid ++ "\nRow Valid: " ++ show rowValid) and [spaceValid, rowValid]
	 spaceValid     = spaceEmpty game space
	 rowValid       = validRow (getRow game gameRow) value
	 --colValid
	 --sqrValid
	 --rightValid
	 --leftValid
	 --upValid
	 --downValid

--Logic----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

-- Checks if the Space is filled in. True - vacant. False - occupied
spaceEmpty :: [[Char]] -> Int -> Bool
spaceEmpty game space
 | get2D game row col == '-' = True
 | otherwise                 = False
 where
	 row = getRowIndex space
	 col = getColIndex space

-- Checks if the Row has the value already in it
validRow :: [Char] -> Int -> Bool
validRow [] _ = True
validRow (h:t) value
  | h == '-'              = validRow t value
	| value == digitToInt h = False
	| otherwise             = validRow t value

--Helpers--------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------


-- Gets the row the space is in
getRowIndex :: Int -> Int
getRowIndex x
  | x == 1 || x == 5 || x == 9  || x == 13 = 0
	| x == 2 || x == 6 || x == 10 || x == 14 = 1
	| x == 3 || x == 7 || x == 11 || x == 15 = 2
	| x == 4 || x == 8 || x == 12 || x == 16 = 3
-- Gets the column the space is in
getColIndex :: Int -> Int
getColIndex x
	| x == 1  || x == 2  || x == 3  || x == 4  = 0
	| x == 5  || x == 6  || x == 7  || x == 8  = 1
  | x == 9  || x == 10 || x == 11 || x == 12 = 2
  | x == 13 || x == 14 || x == 15 || x == 16 = 3
-- Gets the entire row
getRow :: [[a]] -> Int -> [a]
getRow game row = game!!row

-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

-- The following functions are examples from Ryan Patrick
get2D :: [[a]] -> Int -> Int -> a
-- get a single item out of a list of lists of that type of item by row/col
get2D (row:rows) ro co
      | ro == 0		= get1D row co
      | otherwise	= get2D rows (ro-1) co

get1D :: [a] -> Int -> a
-- get a single item out of a list of that type of item by col
get1D (col:cols) ind
      | ind == 0	= col
      | otherwise	= get1D cols (ind-1)
