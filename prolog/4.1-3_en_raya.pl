%%%%%%%%%%%%%%
% EJERCICIO
%%%%%%%%%%%%%%

% 3 EN RAYA
% Crear un programa que de victoria a la cara o pare la victoria de cruz
% Tablero =    [x, "", o,
%		"","","",
%		x,  o, x]

%%% HECHOS
%% Lineas
% Horizontales
linea(1,2,3).
linea(4,5,6).
linea(7,8,9).

% Verticales
linea(1,4,7).
linea(2,5,8).
linea(3,6,9).

% Diagonales
linea(1,5,9).
linea(3,5,7).

%%% REGLAS
%% Amenaza
%
amenaza([X, Y, Z], B, X):-
	vacio(X, B),
	cruz(Y, B),
	cruz(Z, B).

%
amenaza([X, Y, Z], B, Y):-
       cruz(X, B),
       vacio(Y, B),
       cruz(Z, B).

%
amenaza([X, Y, Z], B, Z):-
	cruz(X, B),
	cruz(Y, B),
	vacio(Z, B).

%% Vacio
%
vacio(Casilla, Tablero):-
	argumento(Casilla, Tablero, Valor),
	Valor=[].

%% Cruz
%
cruz(Casilla, Tablero):-
	argumento(Casilla, Tablero, Valor),
	Valor=x.

%% Cara
%
cara(Casilla, Tablero):-
	argumento(Casilla, Tablero, Valor),
	Valor=o.

%% Argumento
%
argumento(Posicion, Lista, X):-
	Posicion=1,
	arg(1, Lista, X).

%
argumento(Posicion, Lista, X):-
	Posicion>1,
	arg(2, Lista, Y),
	Pos is Posicion-1,
	argumento(Pos, Y, X).

%% Movimiento forzoso
%
movimiento_forzoso(Tablero, Casilla) :-
	linea(Linea),
	amenaza(Linea, Tablero, Casilla),
	!. 
