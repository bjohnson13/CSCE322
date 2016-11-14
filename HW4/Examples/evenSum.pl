


% evenSum(List,Sum) Sum is sum of even numbers in List

evenSum([],0).
evenSum([H|T],Sum):-
    0 is mod(H,2),
    evenSum(T,TSum),
    Sum is H + TSum.
evenSum([H|T],Sum):-
    1 is mod(H,2),
    evenSum(T,Sum).
