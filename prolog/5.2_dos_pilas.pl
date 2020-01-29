% ---------------------------
% EJERCICIO
% ---------------------------
% Construir un programa en PROLOG que acepte cadenas del lenguaje
%		a^n, b^n, c^n
% Es decir, que contenga siempre el mismo número de a's, de b's y de c's.

%
 % Ejemplo de ejecución:
 % ?- comprueba([a,a,b,b,c,c], X).
 % Resultado: X = 1 (correcto)
 %/

% caso(Es1, Ca, P1, P2, Es2, Pn1, Pn2)
% Argumentos:
% - Es1: estado actual
% - Ca: caracter recibido
% - P1: pila actual de caracteres 'a'
% - P2: pila actual de caracteres 'b'
% - Es2: estado al que se desplaza
% - Pn1: pila de 'a' usada en el próximo estado
% - Pn2: pila de 'b' usada en el próximo estado
caso(e0, a, [], [], e0, [a], []).
caso(e0, a, P1, [], e0, [a|P1], []).
caso(e0, b, P1, [], e1, P1, [b]).
caso(e1, b, P1, P2, e1, P1, [b|P2]).
caso(e1, c, [a|P1], [b|P2], e2, P1, P2).
caso(e2, c, [a|P1], [b|P2], e2, P1, P2).

% controla(Es, Li, P1, P2, Ef)
% Argumentos:
% - Es: estado actual del autómata
% - Li: lista actual usada por el autómata
% - P1: pila usada para llevar la cuenta de las a's encontradas
% - P2: pila usada para llevar la cuenta de las b's encontradas
% - Ef: estado final (usado para comprobaciones finales).
controla(e2, [], [], [], eF).
controla(E1, [X|L], Pi1, Pi2, Ef):-
    caso(E1, X, Pi1, Pi2, E2, Pn1, Pn2),
    controla(E2, L, Pn1, Pn2, Ef).
controla(e0, [], [], [], eF).

% comprueba(L, Res)
% Argumentos:
% - L: lista con los elementos a comprobar. Para que sea una lista
% 		"correcta", debe tener el mismo número de a's, b's y c's.
% - Res: variable que contendrá 1 si es correcto.
comprueba(L, Res):-
    controla(e0, L, [], [], Ef),
    Ef = eF,
    Res is 1,
    !.
    
% Meta-intérprete Vanilla mejorado
% Llamada con el meta-interprete:
%	solve(comprueba([a,a,b,b,c,c], X)).
solve(A):-
    predicate_property(A,built_in),
    !,
    call(A).
solve(true).
solve((A,B)):-
	solve(A),
	solve(B).
solve(A):-
	clause(A,B),
	solve(B).

% Funcion propia. nl significa 'new line'.
pinta_call(A):-
	write('Call: '),
	write(A),
	nl.
pinta_exit(A):-
	write('Exit: '),
	write(A),
	nl.

% Meta-intérprete Vanilla mejorado con traza
% Llamada con el meta-interprete:
%	solve_traza(comprueba([a,a,b,b,c,c], X)).
solve_traza(A):-
    predicate_property(A,built_in),
    !,
    call(A).
solve_traza(true).
solve_traza((A,B)):-
	solve_traza(A),
	solve_traza(B).
solve_traza(A):-
	pinta_call(A),
	clause(A,B),
	solve_traza(B),
	pinta_exit(A).

% Meta-intérprete Vanilla mejorado con traza y de derecha a izquierda
% De derecha a izquierda es tan solo cambiar A por B en el 3er bloque.
% Llamada con el meta-interprete:
%	solve_traza(comprueba([a,a,b,b,c,c], X)).
solve_traza_inverso(A):-
    predicate_property(A,built_in),
    !,
    call(A).
solve_traza_inverso(true).
solve_traza_inverso((A,B)):-
	solve_traza_inverso(B),
	solve_traza_inverso(A).
solve_traza_inverso(A):-
	pinta_call(A),
	clause(A,B),
	solve_traza_inverso(B),
	pinta_exit(A).
