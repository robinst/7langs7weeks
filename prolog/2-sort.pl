divide([], [], []).
divide([A], [A], []).
divide([A,B|Tail], [A|Rest1], [B|Rest2]) :- divide(Tail, Rest1, Rest2).

merge(A, [], A).
merge([], B, B).
merge([H1|T1], [H2|T2], [H1|Rest]) :- H1 =< H2, merge(T1, [H2|T2], Rest).
merge([H1|T1], [H2|T2], [H2|Rest]) :- H1 > H2, merge([H1|T1], T2, Rest).

mergesort([], []).
mergesort([A], [A]).
mergesort(List, Sorted) :-
  divide(List, Part1, Part2),
  mergesort(Part1, SortedPart1),
  mergesort(Part2, SortedPart2),
  merge(SortedPart1, SortedPart2, Sorted).
