% Listas: conjuntos ordenados de elementos
% Formados por cabeza (primer elemento) y cola (el resto).
% Terminan siempre con el elemento [].
% Para instanciar a la cabeza y su cola: [X|Y].
%
% Para insertar un elemento a la lista, se transforma a la lista en su
% 	propia cola:
% 	insertar(X, Lista, [X|Lista]).
%
% La función append junta las listas L1 y L2:
% 	append(L1, L2, L3).
% Equivaldría a:
% 	concatena([], L, L).
% 	concatena,([X|L1], L2, [X|L3]):-
% 		concatena(L1, L2, L3).


%%%%%%%%%%%%%%%
% EJERCICIO
%%%%%%%%%%%%%%%
%
% Definir las siguientes operacionessobre listas:
% 1. longitud(L, Num)
%	Determina el número de elementos de L.
% 2. ultimo (Ult, Lista)
%	ultimo elemento de la lista.
% 3. Subconjunto(Lista1, Lista2)
%	¿Es Lista1 un subconjunto de Lista2?


% Longitud(Cadena, Resultado)
longitud([], 0).
longitud([_|L], R):-
	longitud(L, R1),
	R is R1 + 1.

% Query de ejemplo: ?- longitud([a, b, c], X).


% Ultimo(Ultimo, Lista)
ultimo(Ultimo, [Ultimo|[]]).
ultimo(Ultimo, [_|Lista]):-
	ultimo(Ultimo, Lista).

% Query de ejemplo: ?- ultimo(X, [1, 2, 3]).


% Subconjunto(Sublista, Lista)
subconjunto([], []).
subconjunto([X|L], [X|L2]):-
	subconjunto(L, L2).
subconjunto(L, [_|L2]):-
	subconjunto(L, L2).
