printPaths([]).
printPaths([Path|Paths]):-
    writeln(Path),
    printPaths(Paths).

loadHelpers:-
    ['helpers.pl'],
    ['csce322hw04pt01.pl'],
    ['csce322hw04pt02.pl'],
    ['csce322hw04pt03.pl'],
    ['csce322hw04pt04.pl'].
    
part01:-
    readGreaterThanSudokuFile('part01test01.gts',_,_,Game,_,_),
    writeln(game),
    printGame(Game),
    percentageSpaces(Game).

part02:-
    readGreaterThanSudokuFile('part01test01.gts',_,_,Game,_,_),
    writeln(game),
    printGame(Game),
    columnsAndSpaces(Game).

part03:-
    readGreaterThanSudokuFile('part01test01.gts',_,_,Game,Vertical,Horizontal),
    writeln(game),
    printGame(Game),
    solveGame(Game,Vertical,Horizontal,SpacesAndValues),
    writeln(sequence),
    printSequence(SpacesAndValues).
  
part04:-
    readGreaterThanSudokuFile('part01test01.gts',_,_,Game,Vertical,Horizontal),
    writeln(game),
    printGame(Game),
    checkGame(Game,Vertical,Horizontal).
