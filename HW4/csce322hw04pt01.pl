percentageSpaces(Game) :-
  findall(Position, find2D(-, Game, Position), Positions),
  length(Game,NumOfRows),
  length(Positions, NumOfSpaces),
  round((NumOfRows * NumOfRows * 0.25)) >= NumOfSpaces
  .
% Code is examples provided by Ryan Patrick
find2D(Element,[List|_],(0,Col)):-
    find1D(Element,List,Col).
find2D(Element,[_|Lists],(Row,Col)):-
    find2D(Element,Lists,(RowT,Col)),
    Row is RowT + 1.

find1D(Element,[Element|_],0).
find1D(Element,[_|T],Position):-
    find1D(Element,T,PositionT),
    Position is PositionT + 1.
