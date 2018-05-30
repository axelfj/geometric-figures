quicksort([X|Xs],Ys) :-
  	partition(Xs,X,Left,Right),
  	quicksort(Left,Ls),
  	quicksort(Right,Rs),
  	append(Ls,[X|Rs],Ys).
quicksort([],[]).

partition([X|Xs],Y,[X|Ls],Rs) :-
  	X < Y, 
    partition(Xs,Y,Ls,Rs).
partition([X|Xs],Y,Ls,[X|Rs]) :-
  	X > Y, 
    partition(Xs,Y,Ls,Rs).
partition([],Y,[],[]).

append([X|Xs],Ys,[X|Zs]) :- 
    append(Xs,Ys,Zs).
append([],Ys,Ys).

initAux(Head, Tail, List):- 
  	findall(Num, between(Head, Tail, Num), List).

cuantity(X, Res):- 
    X1 is X-1,
    cuantity(X1, Res1),
    Res is Res1 + X.
cuantity(1, 1):-!.

initTriangle(N,List):-
    cuantity(N, N2),
    N1 is N2-N+1,   
    initAux(N1,N2,Res),
    N3 is N-1,
    initTriangle(N3, Res1),
    append(Res1, [Res], List).
initTriangle(1,[[1]]).

triangle(A,B,C):- !.
parallelogram(A,B,C,D):- !.
hexagon(A,B,C,D,E,F):- !.

