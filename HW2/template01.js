var helpers = require( './helpers' );
var part = require( './csce322hw02pt01' );

var game = helpers.readGameFile('part01test01.game.gts');
var vert = helpers.readGameFile('part01test01.vertical.gts');
var hori = helpers.readGameFile('part01test01.horizontal.gts');
var spaces = helpers.readSpacesFile('part01test01.spaces.gts');
var values = helpers.readValuesFile('part01test01.values.gts');
var before = game.slice(0);
var vBefore = vert.slice( 0 );
var hBefore = hori.slice( 0 );

var theFunction = part.onePlayerOneMove( before , vBefore , hBefore );
var after = theFunction( spaces[0] , values[0] );
helpers.printGame( after );
