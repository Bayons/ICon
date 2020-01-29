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
	caso(E1, Li, Pi1, Pi2, Pi3, E2, Pn1, Pn2, Pn3),
	mueve(E2, L, Pn1, Pn2, Pn3, Ef).

% Ahora la función principal:
comprueba(L, Res):-
	mueve(e0, L, [], [], [], Ef),
	Ef = eF,
	Res is 1,
	!.

% Meta-interprete Vanilla mejorado
solve(A):-
    predicate_property(A,built_in),
    !,
    call(A).
solve(true):-
	!.
solve((A,B)):-
	!,
	solve(A),
	solve(B).
solve(A):-
	clause(A,B),
	solve(B).

% Meta-interprete con traza y tabulacion
solve_traza_tab(A,_):-
    predicate_property(A,built_in),
    !,
    call(A).
solve_traza_tab(true,_):-!.
solve_traza_tab((A, B),N) :-!,solve_traza_tab(A,N), solve_traza_tab(B,N).
solve_traza_tab(A, N):-tab(N*3),write('Call: '), write(A), nl,clause(A,B), N1 is N+1,solve_traza_tab(B,N1),tab(N*3),write('Exit: '), write(A), nl.

solve_traza_tab(A):-
    predicate_property(A,built_in),
    !,
    call(A).
solve_traza_tab(A):- solve_traza_tab(A,0).

% Meta-interprete con pruebas
% Ejemplo de llamada:
%	solve_proof(comprueba([a,b,c,c,d,d,d,d],Res), Prueba).
solve_proof(A,_):-
    predicate_property(A,built_in),
    !,
    call(A).
solve_proof(true,true):-!.
solve_proof((A,B),(ProofA,ProofB)):-
	solve_proof(A,ProofA),
	solve_proof(B,ProofB).
solve_proof(A,(A:-Proof)):-
	clause(A,B),
	solve_proof(B,Proof).

