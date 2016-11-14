


% divisibleBySix(N,ValueDivisibleBySix).

divisibleBySix(N,ValueDivisibleBySix):-
    length(_,N),
    between(1,N,ValueDivisibleBySix),
    0 is mod(ValueDivisibleBySix,6).
