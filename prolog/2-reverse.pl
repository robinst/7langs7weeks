rev([], []).
rev([Head|Tail], Result) :- rev(Tail, Rest), append(Rest, [Head], Result).
