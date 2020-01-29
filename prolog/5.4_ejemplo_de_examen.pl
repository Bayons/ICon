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
