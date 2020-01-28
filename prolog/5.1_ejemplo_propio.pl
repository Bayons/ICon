% Supongamos un autómata que lee dos cadenas del formato a^m, b^n y
% comprueba que 2*m = n.
%
% Para dicho autómata llamaríamos a una función llamada resuelve(L, X),
% donde L sería la cadena y X nos devolvería el resultado de la
% operación.

% Estados:
% - e1: el autómata cuenta el número de a's. Desde este se mueve al
%  	estado e2 si recibe una b.
% - e2: el autómata cuenta el número de b's. Desde este se mueve al 
% 		estado final eF si no recibe más elementos.

% Ejemplo de ejecución:
% ?- resuelve([a,a,a,b,b,b,b,b,b], X).
% Resultado: X = 1 (correcto)

% caso(E1, A, P1, E2, P2, M, N)
% Argumentos:
% - E1: estado actual.
% - A: elemento recibido en este caso desde la lista.
% - P1: estado actual de la pila.
% - E2: considerando el estado actual, el elemento recibido y el estado
% 		actual de la pila, el estado al que se moverá en el
% 		siguiente caso.
% - P2: estado siguiente de la pila.
%
% Casos:
% Estado inicial. Recibe una a y la pila está vacía. El autómata añade
% dos 'a' a la pila y se mantiene en el mismo estado.
caso(e0, a, [], e0, [a,a]).

% Recibe una a en el estado 0. El autómata añade dos 'a' a la pila y se
% mantiene en el mismo estado.
caso(e0, a, P, e0, [a,a|P]).

% Recibe una b en el estado 0. El autómata quita una a de la pila y se
% mueve al estado e1.
caso(e0, b, [a|P], e1, P).

% Recibe una b en el estado 1. El autómata quita una a de la pila y se
% mantiene en e1.
caso(e1, b, [a|P], e1, P).

% transita(Pr, Es, Li, Pi, Ef)
% Argumentos:
% - Pr: Profundidad de la comprobación. En este caso usado para
% 		imprimirlo.
% - Es: Estado recibido.
% - Li: Lista recibida.
% - Pi: Pila recibida.
% - Ef: Estado final. Utilizado para comprobar cuándo acaba.
% Casos
% Caso que finaliza la recursividad, comprobando que el último estado es
% el e1, la lista recibida ha terminado y la pila está vacía. Devuelve
% el estado final.
transita(e1, [], [], eF).

% Caso recursivo que maneja cada estado (llamándolo directamente). Los
% estados se asignan solos al hacer la llamada a caso(...) al comparar
% los valores recibidos, dado que estos tienen que coincidir.
transita(E1, [X|L], P1, Ef):-
    caso(E1, X, P1, E2, P2),
    transita(E2, L, P2, Ef).

% Llamada base. Llama a la función transita, que se encarga de manejar
% los estados posibles. 
resuelve(L,X):-
    transita(e0, L, [], Ef),
    Ef = eF,
    X is 1,
    !.

% Esto no es necesario. Lo dan en el examen para solucionar un problema de
% privilegios (que curiosamente también tengo en mi ordenador). En
% principio parece que no hace falta aprendérselo, porque lo dan ellos
% mismos.
solve(A):-
    predicate_property(A,built_in),
    !,
    call(A).

% Meta-intérprete Vanilla mejorado
% El meta-intérprete en principio solo sirve para hacer llamadas tal y
% como las harías directamente sin él (en este caso, con resuelve(...),
% pero con la ventaja de que se le pueden añadir ciertas
% 'funcionalidades'. Esto significa que el meta-intérprete, sin esas
% funcionalidades, se comportaría en principio como la llamada directa al
% programa.
%
% Las llamadas con el meta-intérprete serían solve(resuelve(...)). En este
% caso, el meta-intérprete solo tiene la 'funcionalidad' de mejora (ese !
% que se supone que se salta iteraciones innecesarias en este caso, creo),
% por lo que no notaremos la diferencia en este ejemplo, pero hay otras
% muchas como pintar traza que sí ofrecen cambios notables. Existen muchas
% de estas 'funcionalidades' extra aquí:
% https://github.com/eduglzg/Ingenieria-Informatica/blob/master/TercerCurso/ICON/Prolog/metainterpretes.pl
%
% Un ejemplo de llamada para este caso sería este:
% 	solve(resuelve([a,a,b,b,b,b],X)).
% 	Respuesta: X = 1.
% Como vemos, la diferencia entre usar solve y no usarlo es nula en este
% caso. En otros ejemplos utilizaré otros meta-intérpretes.
solve(true).
solve((A,B)):-
	!,
	solve(A),
	solve(B).
solve(A):-
	clause(A,B),
	solve(B).

% Consejos:
% - Esquematizar cada estado, aunque sea mentalmente, para saber qué hace
%	cada uno, a cuál va cada uno y adonde. En este caso hay 2 estados
%	sin contar el final: el primero recibe el caracter 'a' y mete en
%	la pila dos 'a' y el segundo recibe 'b' y elimina un 'a' de la
%	pila. Pero quizás otra persona pueda hacerlo de otro modo y con
%	otros estados.
%
% - Comenzar por los casos. Ayudan a ver el movimiento de cada estado y
% 	permiten saber qué es esencial que tenga la función equivalente a
% 	'transita'.
%
% - El meta-interprete solo sirve para llamar a la función principal.
% 	Como diría Morty, "es como una llamada pero con más pasos".
%
% - No es obligatorio usar solo una pila. Si crees que el ejercicio se
%	simplifica mucho utilizando dos, utilizalas. En el siguiente
%	ejercicio de autómata, se utilizarán dos para ver mejor el caso.
