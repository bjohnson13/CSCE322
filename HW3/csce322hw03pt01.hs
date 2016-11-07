import Prelude
import System.Environment ( getArgs )
import Data.List
import Helpers

-- The main method that will be used for testing / comgand line access
main = do
     args <- getArgs
     filename <- readFile (head args)
     (spaces,values,game,vertical,horizontal) <- readGreaterThanSudokuFile filename
     print "Result"
     printGame (onePlayerOneMove game vertical horizontal (head spaces) (head values))

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerOneMove :: [[Char]] -> [[Int]] -> [[Int]] -> Int -> Int -> [[Char]]
onePlayerOneMove game vertical horizontal space value = newGame
  where newGame = oneMove game vertical horizontal space value
