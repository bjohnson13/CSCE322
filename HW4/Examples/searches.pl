bfs(From,From,[From]).
bfs(From,To,[From|Rest]):-
    length(Rest,_),
    edge(From,Next),
    bfs(Next,To,Rest).

dfs(From,From,[From]).
dfs(From,To,[From|Rest]):-
    edge(From,Next),
    dfs(Next,To,Rest).

dfsSmart(From,To,Path):-
    helper(From,To,[],Path).

helper(From,From,_,[From]).
helper(From,To,Visited,[From|Rest]):-
    edge(From,Next),
    not(member(Next,Visited)),
    helper(Next,To,[Next|Visited],Rest).

member(X,[X|_]).
member(X,[_|T]):-
    member(X,T).


edge(a,b).
edge(a,d).
edge(a,f).
edge(b,d).
edge(b,f).
edge(d,c).
edge(c,f).
edge(f,e).




