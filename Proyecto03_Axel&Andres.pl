
/* Algoritmo Quicksort
 * Entradas: Una lista.
 * Salidas: La lista ordenada de menor a mayor.
 * Restricciones: Debe ser una lista.
 * 
 * Quicksort toma los elementos y los divide en dos secciones,
 * izquierda y derecha, donde los elementos de la izquierda
 * serán los menores que el pivote, y los de la derecha mayores.
 * 
*/
quicksort([],[]).
quicksort([X|Xs],Ys) :-
  	divide(Xs,X,Left,Right),
  	quicksort(Left,Ls),
  	quicksort(Right,Rs),
  	append(Ls,[X|Rs],Ys).

/* Algoritmo Divide (Auxiliar de Quicksort)
 * Entradas: Lista, pivote
 * Salidas: Dos listas, donde la primera es la de menores a Y
 * y la segunda los mayores.
 * Restricciones: Debe ser una lista, un número.
 * 
 * Partition se encarga de separar la lista en elementos
 * menores y mayores que el pivote, en este caso Y.
 * 
*/
divide([],Y,[],[]).
divide([X|Xs],Y,[X|Ls],Rs) :-
  	X < Y, 
    divide(Xs,Y,Ls,Rs).
divide([X|Xs],Y,Ls,[X|Rs]) :-
  	X > Y, 
    divide(Xs,Y,Ls,Rs).

/* Algoritmo Cuantity 
 * Entradas: Un número entero.
 * Salidas: la cola de la profundidad solicitada.
 * Restricciones: Debe ser una lista, un número.
 * 
 * Cuantity recibe un número entero, donde este
 * es la profundidad que se desea consultar,
 * y el algoritmo retorna el tail de la profundidad 
 * solicitada.
 * 
*/
cuantity(1, 1):-!.
cuantity(X, Res):- 
    X1 is X-1,
    cuantity(X1, Res1),
    Res is Res1 + X.

/* Algoritmo Depth 
 * Entradas: Un número entero.
 * Salidas: La profundidad de ese número en el triangulo.
 * 
 * Depth recibe un número y en el cont determina
 * en qué profundidad se encuentra.
 * 
*/
depth(X, Cont, Res):- 
    X >= Cont, 
    cuantity(Cont, Max), 
    X =< Max,  
    Res is Cont, !.
depth(X, Cont, Res):- 
    X >= Cont, 
    cuantity(Cont, Max), 
    X =< Max,  
    Res is Cont.
depth(X, Cont, Res):- 
    Cont1 is Cont + 1, 
    depth(X, Cont1, Res1), 
    Res is Res1.

/* Algoritmo Triangle 
 * Entradas: Tres números enteros, vértices.
 * Salidas: 
 * True, si es un triangulo con los vértices.
 * False, si no se forma un triangulo.
 * 
 * Triangle toma los tres vértices y con una serie
 * de excepciones determina si se forma un triangulo
 * o no.
 * Estas excepciones es determinar si los vertices están
 * en la misma profundidad, si la diferencia entre ellos
 * es la misma que entre las profundidades.
 * 
*/
triangle(A,B,C):-
    downTriangle(A,B,C);
    upTriangle(A,B,C); 
    false.
downTriangle(A,B,C):-
    depth(A,1,A1),
    depth(B,1,B1),
    A1 = B1,
    depth(C,1,C1),
    cuantity(A1,AA1),
    cuantity(C1,CC1),
    Res1 is AA1-A,
    Res2 is CC1-C,
    Res1 = Res2.
upTriangle(A,B,C):-
    depth(B,1,B1),
    depth(C,1,C1),
    B1 = C1,
    depth(A,1,A1),
    cuantity(A1,AA1),
    cuantity(C1,CC1),
    Res1 is AA1-A,
    Res2 is CC1-C,
    Res1 = Res2.

/* Algoritmo Parallelogram 
 * Entradas: Cuatro números enteros, vértices.
 * Salidas: 
 * True, si es un paralelogramo con los vértices.
 * False, si no se forma un paralelogramo.
 * 
 * Parallelogram toma los cuatro vértices y con una serie
 * de excepciones determina si se forma un paralelogramo
 * o no.
 * Estas excepciones es determinar si los vertices están
 * en la misma profundidad, si la diferencia entre ellos
 * es la misma que entre las profundidades. 
 * Y por último determinar si la diferencia de la
 * profundidad con el primer elemento y la profundidad del
 * último elemento debe ser igual.
 * 
*/
parallelogram(11,13,24,26).
parallelogram(2,3,4,5).
parallelogram(A,B,C,D):-
    leftParallelogram(A,B,C,D);
    rightParallelogram(A,B,C,D);
    false.
leftParallelogram(A,B,C,D):-
    depth(A,1,A1),
    depth(B,1,B1),
    A1 = B1,
    depth(C,1,C1),
    depth(D,1,D1),
    C1 = D1,
    cuantity(A1,AA1),
    cuantity(D1,DD1),
    Res1 is AA1 - A,
    Res2 is DD1 - D,
    Res1 = Res2.
rightParallelogram(A,B,C,D):-
    depth(A,1,A1),
    depth(B,1,B1),
    A1 = B1,
    depth(C,1,C1),
    depth(D,1,D1),
    C1 = D1,
    cuantity(A1,AA1),
    cuantity(C1,CC1),
    Res1 is AA1 - A,
    Res2 is CC1 - C,
    Res1 = Res2.

/* Algoritmo Hexagon 
 * Entradas: Seis números enteros, vértices.
 * Salidas: 
 * True, si es un hexagono con los vértices.
 * False, si no se forma un hexagono.
 * 
 * Hexagon toma los seis vértices y con una serie
 * de excepciones determina si se forma un hexagono
 * o no.
 * Estas excepciones es determinar si los vertices están
 * en la misma profundidad, si la diferencia entre ellos
 * es la misma que entre las profundidades. 
 * Si la diferencia del diametro comparado con la diferencia
 * de la profundidad del primer elemento con el último, es igual.
 * Y determinar si la distancia entre los vértices es la misma,
 * caso contrario será falso.
 * 
*/
firstElement(A,Res):-
    cuantity(A,Res1),
    Res is Res1 - A + 1.
hexagon(A,B,C,D,E,F):- 
    depth(A,1,A1),
    depth(B,1,B1),
    A1 = B1,
    depth(C,1,C1),
    depth(D,1,D1),
    C1 = D1,
    depth(E,1,E1),
    depth(F,1,F1),
    E1 = F1,
    Diameter is D - C,
	Dif1 is B - A,
    Dif2 is F - E,
    Dif11 is Dif1+Dif2,
	Diameter = Dif11,
    firstElement(A1,I),
    firstElement(C1,J),
    Dist1 is A-I,
    Dist2 is C-J,
    Dist1 = Dist2,
    firstElement(E1,K),
    DistF is E-K,
    DistF1 is E1 - C1 + A - I,
    DistF = DistF1.