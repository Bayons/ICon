% ----------------------------
% SUPUESTO DE EJERCICIO
% ----------------------------
% Crear un programa que recoja una cadena del tipo
% 	a^w, b^x, c^y, d^z
% en ese orden, y compruebe que:
% > w = x
% > y = x+w
% > z = 2*y

% Para plantear esto, se va a plantear aquí con varias pilas (quizás se
% pueda hacer de otras maneras, pero así se pueden ver varias pilas con
% varias funciones a la vez):
% 1a pila: guarda el numero de a's encontradas.
% 2a pila: guarda tantas a's como b's encontradas (guarda c's para mayor
% 	comodidad.
% 3a pila: guarda el numero de c's encontradas (de dos en dos).

% Ejemplo de entrada:
% comprueba([a,a,b,b,c,c,c,c,d,d,d,d,d,d,d,d],X).

% Primero plantearemos los estados:
caso(e0, a,     [],     [],     [], e0,    [a],    [c],       []).
caso(e0, a,     P1,     P2,     [], e0, [a|P1], [c|P2],       []).
caso(e0, b, [a|P1],     P2,     [], e1,     P1, [c|P2],       []).
caso(e1, b, [a|P1],     P2,     [], e1,     P1, [c|P2],       []).
caso(e1, c,     [], [c|P2],     [], e2,     [],     P2,    [d,d]).
caso(e2, c,     [], [c|P2],     P3, e2,     [],     P2, [d,d|P3]).
caso(e2, d,     [],     [], [d|P3], e3,     [],     [],       P3).
caso(e3, d,     [],     [], [d|P3], e3,     [],     [],       P3).

% Después el movimiento entre estados:
mueve(e3, [], [], [], [], eF).

mueve(E1, [Li|L], Pi1, Pi2, Pi3, Ef):-
		write('Entrada: '),
		write(Li),
		write(', P1: '),
		write(Pi1),
		write(', P2: '),
		write(Pi2),
		write(', P3: '),
		write(Pi3),
		nl,
	caso(E1, Li, Pi1, Pi2, Pi3, E2, Pn1, Pn2, Pn3),
	mueve(E2, L, Pn1, Pn2, Pn3, Ef).

% Ahora la función principal:
comprueba(L, Res):-
	mueve(e0, L, [], [], [], Ef),
	Ef = eF,
	Res is 1,
	!.
