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


% Funcion que recibe una lista de caracteres (Numeros en ASCII) y
% retorna una lista con estos numeros

% Cuando el caraater está entre 48 y 58, es un número y le hace append a
% la lista.
charToInt([Number | List], Res):-
	Number > 48,
	Number < 58,
	Number1 is Number-48,
	charToInt(List, Res1),
	append([Number1], Res1, Res).

% En caso contrario, le hace append de una lista vacía.
charToInt([_ | List], Res):- charToInt(List, Res1), append(Res1,[], Res).

% El caso base es que la lista esté vacía y retorna una lista vacía.
charToInt([], []).
