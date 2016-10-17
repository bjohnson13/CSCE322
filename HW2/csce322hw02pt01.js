module.exports = {
    onePlayerOneMove: onePlayerOneMove
}

var helpers = require( './helpers' );

function onePlayerOneMove( gameCopy , vertical , horizontal ){

    function whatever( space , value ){

      //space = 3 // 1-16
      //value = 2
      // No Number: 0
      var upNum    = getUpNumber(space)
      var downNum  = getDownNumber(space)
      var rightNum = getRightNumber(space)
      var leftNum  = getLeftNumber(space)
      // No Symbol: 0
      var upSym    = getUpSymbol(space)
      var downSym  = getDownSymbol(space)
      var rightSym = getRightSymbol(space)
      var leftSym  = getLeftSymbol(space)

      var upValid    = compareValues(upNum, upSym, "up")
      var downValid  = compareValues(downNum, downSym, "down")
      var rightValid = compareValues(rightNum, rightSym, "right")
      var leftValid  = compareValues(leftNum, leftSym, "left")

      var row = getGameRow(space)
      var col = getGameCol(space)

      if(upValid && downValid && rightValid && leftValid){
        gameCopy[row][col] = value
      }

      //printMyStuff()

	    return gameCopy;

      function getUpNumber(space) {

        var row      = -1
        var col      = -1
        var upNumber = 0

        if (space > 1 && space < 5) {
          row = space - 2
          col = 0
        } else if (space > 5 && space < 9) {
          row = space - 6
          col = 1
        } else if (space > 9 && space < 13) {
          row = space - 10
          col = 2
        } else if (space > 13 && space < 17){
          row = space - 14
          col = 3
        }

        if(space == 1 || space == 5 || space == 9 || space == 13) {
          upNumber = 0
        } else {
          upNumber = gameCopy[row][col]
        }

        return upNumber
      }
      function getDownNumber(space) {

        var row      = -1
        var col      = -1
        var downNumber = 0

        if (space < 4) {
          row = space
          col = 0
        } else if (space > 4 && space < 8) {
          row = space - 4
          col = 1
        } else if (space > 8 && space < 12) {
          row = space - 8
          col = 2
        } else if (space > 12 && space < 16){
          row = space - 12
          col = 3
        }

        if(space == 4 || space == 8 || space == 12 || space == 16) {
          downNumber = 0
        } else {
          downNumber = gameCopy[row][col]
        }

        return downNumber
      }
      function getRightNumber(space) {

        var row         = -1
        var col         = -1
        var rightNumber = 0

        if (space <= 4) {
          row = space - 1
          col = 1
        } else if (space > 4 && space <= 8) {
          row = space - 5
          col = 2
        } else if (space > 8 && space <= 12) {
          row = space - 9
          col = 3
        }

        if(space >= 13) {
          rightNumber = 0
        } else {
          rightNumber = gameCopy[row][col]
        }

        return rightNumber
      }
      function getLeftNumber(space) {

        var row         = -1
        var col         = -1
        var rightNumber = 0

        if (space > 4 && space <= 8) {
          row = space - 5
          col = 0
        } else if (space > 8 && space <= 12) {
          row = space - 9
          col = 1
        } else if (space > 12) {
          row = space - 13
          col = 2
        }

        if(space <= 4) {
          leftNumber = 0
        } else {
          leftNumber = gameCopy[row][col]
        }

        return leftNumber
      }

      function getUpSymbol(space) {

        var row         = -1
        var col         = -1
        var upSymbol    = 0

        if (space > 1 && space < 5) {
          row = space - 2
          col = 0
        } else if (space > 5 && space < 9) {
          row = space - 6
          col = 1
        } else if (space > 9 && space < 13) {
          row = space - 10
          col = 2
        } else if (space > 13 && space < 17){
          row = space - 14
          col = 3
        }

        if(space == 1 || space == 5 || space == 9 || space == 13) {
          upSymbol = 0
        } else {
          upSymbol = vertical[row][col]
        }

        upSymbol = convertSymbol(upSymbol)

        return upSymbol
      }
      function getDownSymbol(space) {

        var row        = -1
        var col        = -1
        var downSymbol = 0

        if (space < 4) {
          row = space - 1
          col = 0
        } else if (space > 4 && space < 8) {
          row = space - 5
          col = 1
        } else if (space > 8 && space < 12) {
          row = space - 9
          col = 2
        } else if (space > 12 && space < 16){
          row = space - 13
          col = 3
        }

        if(space == 4 || space == 8 || space == 12 || space == 16) {
          downSymbol = 0
        } else {
          downSymbol = vertical[row][col]
        }

        downSymbol = convertSymbol(downSymbol)

        return downSymbol
      }
      function getRightSymbol(space) {

        var row         = -1
        var col         = -1
        var rightSymbol = 0

        if (space <= 4) {
          row = space - 1
          col = 0
        } else if (space > 4 && space <= 8) {
          row = space - 5
          col = 1
        } else if (space > 8 && space <= 12) {
          row = space - 9
          col = 2
        }

        if(space >= 13) {
          rightSymbol = 0
        } else {
          rightSymbol = horizontal[row][col]
        }

        rightSymbol = convertSymbol(rightSymbol)

        return rightSymbol
      }
      function getLeftSymbol(space) {

        var row         = -1
        var col         = -1
        var leftSymbol  = 0

        if (space > 4 && space <= 8) {
          row = space - 5
          col = 0
        } else if (space > 8 && space <= 12) {
          row = space - 9
          col = 1
        } else if (space > 12) {
          row = space - 13
          col = 2
        }

        if(space <= 4) {
          leftSymbol = 0
        } else {
          leftSymbol = horizontal[row][col]
        }

        leftSymbol = convertSymbol(leftSymbol)

        return leftSymbol
      }
      function convertSymbol(sym){
        if(sym == 1){
          sym = "<"
        } else {
          sym = ">"
        }

        return sym
      }

      function getGameRow(space){
        var row = 0

        if(space > 12){
          row = space - 13
        } else if (space > 8){
          row = space - 9
        } else if (space > 4){
          row = space - 5
        } else {
          row = space - 1
        }

        return row
      }
      function getGameCol(sapce){

        var col = 0

        if(space > 12){
          col = 3
        } else if (space > 8){
          col = 2
        } else if (space > 4){
          col = 1
        } else {
          col = 0
        }

        return col
      }

      function compareValues(num, sym, direction) {

        var validMove = false

        if(direction === "right" || direction === "down"){
          //value num
          switch(sym){
            case "<":
              if(value < num || num == "-" || num == 0){
                validMove = true
              }
              break;
            case ">":
              if(value > num || num == "-" || num == 0){
                validMove = true
              }
              break;
            default:
              validMove = false
          }
        } else if (direction === "left" || direction === "up"){
          //num value
          switch(sym){
            case "<":
              if(num < value || num == "-" || num == 0){
                validMove = true
              }
              break;
            case ">":
              if(num > value || num == "-" || num == 0){
                validMove = true
              }
              break;
            default:
              validMove = false
          }
        }
        return validMove
      }
      function checkRow(){

      }
      function checkCol(){

      }
      function checkSquare(){

      }
      function printMyStuff() {
        console.log("Space: " + space)
        console.log("Value: " + value)
        console.log("");

        console.log("upNum: "    + upNum);
        console.log("downNum: "  + downNum);
        console.log("rightNum: " + rightNum);
        console.log("leftNum: "  + leftNum);
        console.log("");

        console.log("upSym: "    + upSym);
        console.log("downSym: "  + downSym);
        console.log("rightSym: " + rightSym);
        console.log("leftSym: "  + leftSym);
        console.log("");

        console.log("Up Valid: "    + upValid);
        console.log("Down Valid: "  + downValid);
        console.log("Right Valid: " + rightValid);
        console.log("Left Valid: "  + leftValid);
        console.log("");

        console.log("Row: " + row);
        console.log("Col: " + col);
        console.log("");

        console.log("Game")
        helpers.printGame(gameCopy)
        console.log("Vertical")
        helpers.printGame(vertical)
        console.log("Horizontal")
        helpers.printGame(horizontal)
      }
    }

    return whatever;
}
