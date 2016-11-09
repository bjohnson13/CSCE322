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
    upValid  = False --compareValues value upValue upSymbol
    upValue  = getValue game space 0
    --upSymbol =


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


compareValues :: Int -> Int -> Int -> Bool
compareValues leftVal rightVal symbol
  | symbol == -1 = leftVal > rightVal
  | otherwise   = leftVal < rightVal

-- Direction: 0-Up 1-Down 2-Right 3-Left
getValue :: [[Char]] -> Int -> Int-> Char
getValue game space direction
  -- Column 0
  -- Space 1
  | space == 1 && direction == 1 = game!!1!!0 -- Down
  | space == 1 && direction == 2 = game!!0!!1 -- Right
  -- Space 2
  | space == 2 && direction == 0 = game!!0!!0 -- Up
  | space == 2 && direction == 1 = game!!2!!0 -- Down
  | space == 2 && direction == 2 = game!!1!!1 -- Right
  -- Space 3
  | space == 3 && direction == 0 = game!!1!!0 -- Up
  | space == 3 && direction == 1 = game!!2!!1 -- Down
  | space == 3 && direction == 2 = game!!3!!0 -- Right
  -- Space 4
  | space == 4 && direction == 0 = game!!2!!0 -- Up
  | space == 4 && direction == 2 = game!!3!!1 -- Right

  -- Column 1
  -- Space 5
  | space == 5 && direction == 1 = game!!1!!1 -- Down
  | space == 5 && direction == 2 = game!!0!!2 -- Right
  | space == 5 && direction == 3 = game!!0!!0 -- Left
  -- Space 6
  | space == 6 && direction == 0 = game!!0!!1 -- Up
  | space == 6 && direction == 1 = game!!2!!1 -- Down
  | space == 6 && direction == 2 = game!!1!!2 -- Right
  | space == 6 && direction == 3 = game!!1!!0 -- Left
  -- Space 7
  | space == 7 && direction == 0 = game!!1!!1 -- Up
  | space == 7 && direction == 1 = game!!3!!1 -- Down
  | space == 7 && direction == 2 = game!!2!!2 -- Right
  | space == 7 && direction == 3 = game!!2!!0 -- Left
  -- Space 8
  | space == 8 && direction == 0 = game!!2!!1 -- Up
  | space == 8 && direction == 2 = game!!3!!2 -- Right
  | space == 8 && direction == 3 = game!!3!!0 -- Left

  -- Column 2
  -- Space 9
  | space == 9 && direction == 1 = game!!1!!2 -- Down
  | space == 9 && direction == 2 = game!!0!!3 -- Right
  | space == 9 && direction == 3 = game!!0!!1 -- Left
  -- Space 10
  | space == 10 && direction == 0 = game!!0!!2 -- Up
  | space == 10 && direction == 1 = game!!2!!2 -- Down
  | space == 10 && direction == 2 = game!!1!!3 -- Right
  | space == 10 && direction == 3 = game!!1!!1 -- Left
  -- Space 11
  | space == 11 && direction == 0 = game!!1!!2 -- Up
  | space == 11 && direction == 1 = game!!3!!2 -- Down
  | space == 11 && direction == 2 = game!!2!!3 -- Right
  | space == 11 && direction == 3 = game!!2!!1 -- Left
  -- Space 12
  | space == 12 && direction == 0 = game!!2!!2 -- Up
  | space == 12 && direction == 2 = game!!3!!3 -- Right
  | space == 12 && direction == 3 = game!!3!!1 -- Left

  -- Column 3
  -- Space 13
  | space == 13 && direction == 1 = game!!1!!3 -- Down
  | space == 13 && direction == 3 = game!!0!!2 -- Left
  -- Space 14
  | space == 14 && direction == 0 = game!!0!!3 -- Up
  | space == 14 && direction == 1 = game!!2!!3 -- Down
  | space == 14 && direction == 3 = game!!1!!2 -- Left
  -- Space 15
  | space == 15 && direction == 0 = game!!1!!3 -- Up
  | space == 15 && direction == 1 = game!!3!!3 -- Down
  | space == 15 && direction == 3 = game!!2!!2 -- Left
  -- Space 16
  | space == 16 && direction == 0 = game!!2!!3 -- Up
  | space == 16 && direction == 3 = game!!3!!2 -- Left



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
