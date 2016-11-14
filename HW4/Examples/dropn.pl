% dropn(N,ListBefore,ListAfter)


dropn(0,ListBefore,ListBefore).
dropn(_,[],[]).
dropn(N,[_|TB],Result):-
    length(_,N),
    N > 0,
    NM1 is N - 1,
    dropn(NM1,TB,Result).
