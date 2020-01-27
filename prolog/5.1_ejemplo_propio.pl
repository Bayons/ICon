/* Supongamos un autómata que lee dos cadenas del formato a^m, b^n y
 * comprueba que 2*m = n.
 *
 * Para dicho autómata llamaríamos a una función llamada resuelve(L, X),
 * donde L sería la cadena y X nos devolvería el resultado de la
 * operación.
 */

/* Estados:
 * - e1: el autómata cuenta el número de a's. Desde este se mueve al
 *  	estado e2 si recibe una b.
 * - e2: el autómata cuenta el número de b's. Desde este se mueve al 
 * 		estado final eF si no recibe más elementos.
 */

/* caso(E1, A, P1, E2, P2, M, N)*/
/* Argumentos:
 * - E1: estado actual.
 * - A: elemento recibido en este caso desde la lista.
 * - P1: estado actual de la pila.
 * - E2: considerando el estado actual, el elemento recibido y el estado
 * 		actual de la pila, el estado al que se moverá en el siguiente
 * 		caso.
 * - P2: estado siguiente de la pila.
 */
/* Casos: */
/* Estado inicial. Recibe una a y la pila está vacía. El autómata añade
 * dos 'a' a la pila y se mantiene en el mismo estado.
 */
caso(e0, a, [], e0, [a,a]).

/* Recibe una a en el estado 0. El autómata añade dos 'a' a la pila y se
 * mantiene en el mismo estado.
 */
caso(e0, a, P, e0, [a,a|P]).

/* Recibe una b en el estado 0. El autómata quita una a de la pila y se
 * mueve al estado e1.
 */
caso(e0, b, [a|P], e1, P).

/* Recibe una b en el estado 1. El autómata quita una a de la pila y se
 * mantiene en e1.
 */
caso(e1, b, [a|P], e1, P).

/* transita(Pr, Es, Li, Pi, Ef) */
/* Argumentos:
 * - Pr: Profundidad de la comprobación. En este caso usado para
 * 		imprimirlo.
 * - Es: Estado recibido.
 * - Li: Lista recibida.
 * - Pi: Pila recibida.
 * - Ef: Estado final. Utilizado para comprobar cuándo acaba.
 */
/* Casos */
/* Caso que finaliza la recursividad, comprobando que el último estado es
 * el e1, la lista recibida ha terminado y la pila está vacía. Devuelve
 * el estado final.
 */
transita(_, e1, [], [], eF).

/* Caso recursivo que maneja cada estado (llamándolo directamente). Los
 * estados se asignan solos al hacer la llamada a caso(...) al comparar
 * los valores recibidos, dado que estos tienen que coincidir. Además,
 * contiene una "traza" que comenta por salida estándar la profundidad,
 * la entrada recibida desde la lista, el contenido de la pila y el
 * siguiente estado de la iteración.
 * Las funciones de traza tienen una indentación distinta para 
 * diferenciarlas de las funciones sustanciales.
 */
transita(P, E1, [X|L], P1, Ef):-
    		write('Recibe: '),
    		write(X),
    		write(' en el estado: '),
    		write(E1),
    		write(', pila: '),
    		write(P1),
    		write(', profundidad: '),
    		Prof is P,
    		write(Prof),
    caso(E1, X, P1, E2, P2),
    		write('. Siguiente estado: '),
    		write(E2),
    		nl,
    transita((Prof+1), E2, L, P2, Ef).

/* Llamada base. Llama a la función transita, que se encarga de manejar
 * los estados posibles. 
 */
resuelve(L,X):-
    transita(1, e0, L, [], Ef),
    Ef = eF,
    X is 1,
    !.




/* Consejos:
 * - Comenzar por los casos. Ayudan a ver el movimiento de cada estado y
 * 	permiten saber qué es esencial que tenga la función equivalente a
 * 	'transita'.
 * - No pensar en el meta-interprete. Aquello de solve(...) es solo un
 *	nombre que le da a la función que, después, puedes llamar como
 *	quieras. Aquí, solve se llama transita.
 *
 */
