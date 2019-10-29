%%%%%%%%%%%%%%%%
% EJERCICIO
%%%%%%%%%%%%%%%%
% Calcular un número combinatorio
% comb(m,n) = m! / ((m - n)! * n!)
%	donde m > n
%
% Mas eficiente:
% comb(m,n) = (m*(m-1)*(m-2)*...*(n+1))/(m-n)!


facto(1, 1).
facto(Res, X):-
	X > 1,
	S is -(X, 1),
	facto(A, S),
	Res is *(A, X).

comb(M, N, Res):-
	M > N,
	facto(A, M),
	facto(B, -(M, N)),
	facto(C, N),
	Res is /(A, *(B, C)).
