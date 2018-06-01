% Lee un archivo .txt y guarda su contenido en una lista.
read_file(File, CharList, Res) :-
	see(File),
	read_list(CharList),
	charToInt(CharList, Res),
	seen.



%Lee los caracteres del input hasta llegar al final (hasta alcanzar la bandera eof)

read_list([Char | List]) :-
	get0(Char),	 % Obtiene el valor ASCII del caracter.
	Char =\= -1, !,  % Mientras no ha llegado al final del archivo
	read_list(List).

read_list([]).


charToInt([Number | List], Res):-
	Number1 is Number-48,
	charToInt(List, Res1),
	append([Number1], Res1, Res).



charToInt([], []).
