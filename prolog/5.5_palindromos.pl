% -------------------------
%	EJERCICIO
% -------------------------
%
% Crear un autómata que reconozca un palíndromo. El palíndromo tendrá la
% siguiente forma: w^n, e^x, w^n


caso(e0,	w,	[],	e0,	[w]).
caso(e0,	w,	H,	e0,	[w|H]).
caso(e0,	e,	H,	e1,	H).
caso(e1,	e,	H,	e1,	H).
caso(e1,	w,	[w|H],	e2,	H).
caso(e2,	w,	[w|H],	e2,	H).

desplaza(e2, [], [], eF).
desplaza(Ei, [Li|L], Pi, Ef):-
	caso(Ei, Li, Pi, En, Pn),
	desplaza(En, L, Pn, Ef).

comprueba(L, Res):-
	desplaza(e0, L, [], Ef),
	Ef = eF,
	Res is 1,
	!.
