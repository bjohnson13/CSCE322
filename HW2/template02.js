var helpers = require( './helpers' );
var part = require( './csce322hw02pt02' );

var game = helpers.readGameFile('part01test01.game.gts');
var vert = helpers.readGameFile('part01test01.vertical.gts');
var hori = helpers.readGameFile('part01test01.horizontal.gts');
var spaces = helpers.readSpacesFile('part01test01.spaces.gts');
var values = helpers.readValuesFile('part01test01.values.gts');
var before = game.slice(0);
var vBefore = vert.slice( 0 );
var hBefore = hori.slice( 0 );

var theFunction = part.onePlayerManyMoves( before , vBefore , hBefore );
var after = theFunction( spaces , values );
//helpers.printGame( after );
