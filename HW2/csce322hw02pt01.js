module.exports = {
    onePlayerOneMove: onePlayerOneMove
}

var helpers = require( './helpers' );

function onePlayerOneMove( gameCopy , vertical , horizontal ){

    function whatever( space , value ){

      space = 6 // 1-16

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

      printMyStuff()

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
          col = 0
        } else if (space > 8 && space < 12) {
          row = space - 8
          col = 0
        } else if (space > 12 && space < 16){
          row = space - 12
          col = 0
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
          col = 0
        } else if (space > 8 && space < 12) {
          row = space - 9
          col = 0
        } else if (space > 12 && space < 16){
          row = space - 13
          col = 0
        }

        if(space == 4 || space == 8 || space == 12 || space == 16) {
          downSymbol = 0
        } else {
          downSymbol = vertical[row][col]
        }

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


        return leftSymbol
      }

      function printMyStuff() {
        console.log("Space: " + space)
        //console.log("Value: " + value)

        console.log("upNum: "    + upNum);
        console.log("downNum: "  + downNum);
        console.log("rightNum: " + rightNum);
        console.log("leftNum: "  + leftNum);

        console.log("upSym: " + upSym);
        console.log("downSym: " + downSym);
        console.log("rightSym: " + rightSym);
        console.log("leftSym: " + leftSym);

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
