import Prelude
import System.Environment ( getArgs )
import Data.List
import Helpers
import Debug.Trace

-- The main method that will be used for testing / comgand line access
main = do
     args <- getArgs
     filename <- readFile (head args)
     (spaces,values,game,vertical,horizontal) <- readGreaterThanSudokuFile filename
     print "Result"
     printGame (onePlayerManyMoves game vertical horizontal spaces values)

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerManyMoves :: [[Char]] -> [[Int]] -> [[Int]] -> [Int] -> [Int] -> [[Char]]
onePlayerManyMoves game _ _ [] [] = game
onePlayerManyMoves game vertical horizontal (sHead:sTail) (vHead:vTail) = onePlayerManyMoves newGame vertical horizontal sTail vTail
  where
    newGame = oneMove game vertical horizontal sHead vHead
