% ------------------------------
%	SUPUESTO DE EJERCICIO
% ------------------------------

% Leer una cadena a^x, b^y, c^z tal que y = x + z

% Hecho de esta manera, los estados son independientes de las pilas.
caso(e0,	a,	[],	e0,	[a]).
caso(e0,	a,	H,	e0,	[a|H]).
caso(e0,	b,	[a|H],	e1,	H).
caso(e1,	b,	[a|H],	e1,	H).
caso(e1,	b,	[],	e1,	[b]).
caso(e1,	b,	H,	e1,	[b|H]).
caso(e1,	c,	[b|H],	e2,	H).
caso(e2,	c,	[b|H],	e2,	H).

mueve(e2, [], [], eF).
mueve(Ei, [Li|L], Pi, Ef):-
	caso(Ei, Li, Pi, En, Pn),
	write(Pn), nl,
	mueve(En, L, Pn, Ef).

comprueba(L, Res):-
	mueve(e0, L, [], Ef),
	Ef = eF,
	Res is 1,
	!.

solve(A):-
    predicate_property(A,built_in),
    !,
    call(A).
solve(true):-!.
solve((A,B)):-
        !,
        solve(A),
        solve(B).
solve(A):-
        clause(A,B),
        solve(B).


% --------------------------
%	EXPLICACION
% --------------------------
%
% Este ejercicio es algo más complicado al ser mayor la subcadena
% intermedia que las otras dos. Utilizando una sola pila, la mejor opción
% es volver a rellenar la misma una vez el número de b's haya rebasado el
% número de a's. La explicación de los estados es:
%
% Estado 1.
% 	Siempre que reciba una 'a', añadirá este símbolo a la pila.
% 	Cambiará de estado al encontrar una 'b'.
% Estado 2.
% 	Siempre que encuentre una 'b', quitará una 'a' de la pila. Cuando
% 	la pila se quede vacía (y si sigue encontrando el símbolo 'b'),
% 	añadirá el símbolo a la pila.
% Estado 3.
% 	Siempre que encuentre una 'c', quitará una 'b' de la pila hasta
% 	vaciarlo.
%
% El autómata finaliza correctamente si la lista y la pila están vacías.
% De esta manera, nos aseguramos que el funcionamiento es correcto. Sin
% embargo, cabe replantearse si este es el mejor comportamiento.
