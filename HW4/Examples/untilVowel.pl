

% untilVowel(List) - print out next thing in list, until you hit a vowel

vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

untilVowel([]).
untilVowel([H|_]):-
    vowel(H),
    !.
untilVowel([H|T]):-
    not(vowel(H)),
    writeln(H),
    untilVowel(T).










