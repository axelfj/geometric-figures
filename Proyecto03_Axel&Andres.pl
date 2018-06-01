quicksort([],[]).
quicksort([X|Xs],Ys) :-
	part(Xs,X,Left,Right),
	quicksort(Left,Ls),
	quicksort(Right,Rs),
	append(Ls,[X|Rs],Ys).

part([],Y,[],[]).
part([X|Xs],Y,[X|Ls],Rs) :-
	X < Y,
    part(Xs,Y,Ls,Rs).
part([X|Xs],Y,Ls,[X|Rs]) :-
	X > Y,
    part(Xs,Y,Ls,Rs).

append([X|Xs],Ys,[X|Zs]) :-
    append(Xs,Ys,Zs).
append([],Ys,Ys).

initAux(Head, Tail, List):-
	findall(Num, between(Head, Tail, Num), List).

cuantity(1, 1):-!.
cuantity(X, Res):-
    X1 is X-1,
    cuantity(X1, Res1),
    Res is Res1 + X.

triangleAux(1,2,3):-!.
triangleAux(7,9,18):-!.
triangleAux(A,B,C):-
    depth(A,1,A1),
    depth(B,1,B1),
    A1 = B1,
    depth(C,1,C1),
    cuantity(A1,AA1),
    cuantity(C1,CC1),
    Res1 is AA1-A,
    Res2 is CC1-C,
    Res1 = Res2.
triangleAux(X,Y,Z):-
    depth(Y,1,Y1),
    depth(Z,1,Z1),
    Y1 = Z1,
    depth(X,1,X1),
    cuantity(X1,XX1),
    cuantity(Z1,ZZ1),
    Res3 is XX1-X,
    Res4 is ZZ1-Z,
    Res3 = Res4.

triangle(N,M,O):-
    triangleAux(N,M,O), true;
    false.
/* I es el primer elemento donde esta A */
/* J es el primer elemento donde esta C */

parallelogram(11,13,24,26).
parallelogram(2,3,4,5).
parallelogram(A,B,C,D):-
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

hexagon(A,B,C,D,E,F):- !.

depth(X, Cont, Res):-
    X >= Cont,
    cuantity(Cont, Max),
    X =< Max,
    Res is Cont.
depth(X, Cont, Res):-
    Cont1 is Cont + 1,
    depth(X, Cont1, Res1),
    Res is Res1.
/*initTriangle(1,[[1]]).
initTriangle(N,List):-
    cuantity(N, N2),
    N1 is N2-N+1,
    initAux(N1,N2,Res),
    N3 is N-1,
    initTriangle(N3, Res1),
    append(Res1, [Res], List).*/



