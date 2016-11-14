


% find(Element,List,Position)

find(El,[El|_],0).
find(El,[_|T],Position):-
    find(El,T,TPosition),
    Position is TPosition + 1.
