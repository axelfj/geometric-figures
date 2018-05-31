%  Lee los caracteres del input hasta llegar al final (hasta alcanzar la bandera eof)

read_list([Char | List], Res) :-
	get0(Char),	 % Obtiene el valor ASCII del caracter.
	write(Char),
	Char =\= -1, !,  % Mientras no ha llegado al final del archivo
	read_list(List, Res1),
	interprate_List(Res1, Res).

read_list([], []).


interprate_List([Number | List], Res):-
/*	Number > 48,
	Number < 58,*/
	Number1 is Number+1,
	interprate_List(List, Res1),
	append([Number1], Res1, Res).

/*
interprate_List([Number | List], Res):-
	Number < 49,
	Number > 57,
	interprate_List(List, Res).*/

interprate_List([], []).
