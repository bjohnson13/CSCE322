:- module( helpers,
	 [ readGreaterThanSudokuFile/6
	 , printGame/1
	 , printSequence/1
	 ]
    ).

readGreaterThanSudokuFile(File,Spaces,Values,Game,Vertical,Horizontal):-
    open(File,read,Input),
    read(Input,Spaces),
    read(Input,Values),
    readEverything(Input,Everything),
    splitEverything(Everything,Game,Vertical,Horizontal),
    close(Input).

readEverything(Input,[]):-
    at_end_of_stream(Input),
    !.
readEverything(Input,[Row|Rows]):-
    \+ at_end_of_stream(Input),
    read(Input,Row),
    readEverything(Input,Rows).

printSequence(Sequence):-
    printGame(Sequence).

printGame([]).
printGame([Row|Rows]):-
    writeln(Row),
    printGame(Rows).

take(_,[],[]).
take(0,_,[]).
take(N,[H|T],[H|Rest]):-
    length(_,N),
    NM1 is N - 1,
    take(NM1,T,Rest).

drop(_,[],[]).
drop(0,X,X).
drop(N,[_|T],Rest):-
    length(_,N),
    NM1 is N - 1,
    drop(NM1,T,Rest).

splitEverything(Everything,Game,Vertical,Horizontal):-
    length(Everything,Total),
    TotalMore is Total + 1,
    Size is TotalMore / 3,
    take(Size,Everything,Game),
    Two is 2 * Size - 1,
    take(Two,Everything,Next),
    drop(Size,Next,Vertical),
    drop(Two,Everything,Horizontal),
    !.
