smallest([A], A).
smallest([A,B|Tail], Result) :- A =< B, smallest([A|Tail], Result).
smallest([A,B|Tail], Result) :- A > B,  smallest([B|Tail], Result).
