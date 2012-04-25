eight_queens(Queens) :-
  Queens = [_, _, _, _, _, _, _, _],
  all_on_board(Queens),
  dont_share_row(Queens),
  dont_share_column(Queens),
  dont_share_diagonal1(Queens),
  dont_share_diagonal2(Queens).

all_on_board([]).
all_on_board([Head|Tail]) :- on_board(Head), all_on_board(Tail).
on_board((X, Y)) :- fd_domain(X, 1, 8), fd_domain(Y, 1, 8).

dont_share_row(Queens) :- rows(Queens, L), fd_all_different(L).
dont_share_column(Queens) :- columns(Queens, L), fd_all_different(L).
dont_share_diagonal1(Queens) :- diagonals1(Queens, L), fd_all_different(L).
dont_share_diagonal2(Queens) :- diagonals2(Queens, L), fd_all_different(L).

columns([], []).
columns([Q1|Tail], Columns) :- (X, _) = Q1, columns(Tail, Rest), Columns = [X|Rest].

rows([], []).
rows([Q1|Tail], Rows) :- (_, Y) = Q1, rows(Tail, Rest), Rows = [Y|Rest].

diagonals1([], []).
diagonals1([Q1|Tail], Result) :- (X, Y) = Q1, D is X - Y, diagonals1(Tail, Rest), Result = [D|Rest].

diagonals2([], []).
diagonals2([Q1|Tail], Result) :- (X, Y) = Q1, D is X + Y, diagonals2(Tail, Rest), Result = [D|Rest].
