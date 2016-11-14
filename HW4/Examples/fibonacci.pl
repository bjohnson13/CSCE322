


% fibonacci(N,FibN)
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,FibN):-
    length(_,N),
    N > 1,
    NM1 is N - 1,
    fibonacci(NM1,FNM1),
    NM2 is N - 2,
    fibonacci(NM2,FNM2),
    FibN is FNM1 + FNM2.

% fibTuple((FibN,FibNP1,N))
fibTuple((0,1,0)).
fibTuple((FibN,FibNP1,N)):-
    length(_,N),
    N > 0,
    NM1 is N - 1,
    fibTuple((FibNM1,FibN,NM1)),
    FibNP1 is FibNM1 + FibN.

fastFib(N,FibN):-
    fibTuple((FibN,_,N)).









