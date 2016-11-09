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
 | checkValidMove == True = trace ("Valid") makeMove game (chr (value + 48)) gameRowIndex gameColIndex
 | otherwise              = trace ("Invalid") game
 where
   gameRowIndex = getRowIndex space
   gameColIndex = getColIndex space
   checkValidMove  = and[spaceValid, rowColSqrValid, directionsValid]
   spaceValid      = spaceEmpty game space
   rowColSqrValid  = validRowColSquare game value space
   directionsValid = validDirections game vertical horizontal space value


--Logic----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

-- Checks if the Space is filled in. True - vacant. False - occupied
spaceEmpty :: [[Char]] -> Int -> Bool
spaceEmpty game space
 | get2D game row col == '-' = trace ("Space Valid: True") True
 | otherwise                 = trace ("Space Valid: False") False
 where
	 row = getRowIndex space
	 col = getColIndex space

validRowColSquare :: [[Char]] -> Int -> Int -> Bool
validRowColSquare game value space = trace ("Row Valid: " ++ show rowValid ++ "\nCol Valid: " ++ show colValid ++ "\nSqr Valid: " ++ show sqrValid) and[rowValid, colValid, sqrValid]
  where
    rowValid     = validRow gameRow value
    colValid     = validRow gameCol value
    sqrValid     = validRow gameSqr value
    gameRow      = getRow game gameRowIndex
    gameCol      = getCol game gameColIndex
    gameSqr      = getSqr game space
    gameRowIndex = getRowIndex space
    gameColIndex = getColIndex space

validDirections :: [[Char]] -> [[Int]] -> [[Int]] -> Int -> Int -> Bool
validDirections game vertical horizontal space value = trace ("Up Valid: " ++ show upValid) upValid--trace ("Up Valid: " ++ show upValid) and[upValid]
  where
    upValid = False

-- Creates new game board with new value
makeMove :: [[a]] -> a -> Int -> Int -> [[a]]
makeMove game value row col =
  take row game ++
  [take col (game !! row) ++ [value] ++ drop (col + 1) (game !! row)] ++
  drop (row + 1) game



-- Checks if an Array has the value already in it
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
-- Gets the entire Col
getCol :: [[a]] -> Int -> [a]
getCol game col = [game!!0!!col, game!!1!!col, game!!2!!col, game!!3!!col]
-- Gets the corner sqare the space is located in
getSqr :: [[a]] -> Int -> [a]
getSqr game x
	| x == 1   || x == 2   || x == 5   || x == 6  = [game!!0!!0, game!!0!!1, game!!1!!0, game!!1!!1]
	| x == 3   || x == 4   || x == 7   || x == 8  = [game!!2!!0, game!!2!!1, game!!3!!0, game!!3!!1]
	| x == 9   || x == 10  || x == 13  || x == 14 = [game!!0!!2, game!!0!!3, game!!1!!2, game!!1!!3]
	| x == 11  || x == 12  || x == 15  || x == 16 = [game!!2!!2, game!!2!!3, game!!3!!2, game!!3!!3]
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
