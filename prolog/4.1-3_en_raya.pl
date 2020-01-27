%%%%%%%%%%%%%%
% EJERCICIO
%%%%%%%%%%%%%%

% 3 EN RAYA
% Crear un programa que de victoria a la cara o pare la victoria de cruz
% Tablero =    [x, "", o,
%		"","","",
%		x,  o, x]

/* A partir de aquí, el programa es una ampliación del original
 * creado por github.com/Antazx
 */

/* El programa comprueba el tablero e indica la jugada a realizar en caso
 * de poder ganar (preferentemente) o perder.
 */

/* La función principal es forzoso. Encuentre lo que encuentre, forzoso
 * finalizará la ejecución del programa, dando como resultado las tres
 * posiciones que resultarán en una línea, tanto del rival (x) como del
 * jugador (o).
 */

/* Dentro del tablero, hay tres símbolos:
 * - Símbolo del jugador contrario: x
 * - Símbolo del propio jugador: o
 * - Símbolo de espacio vacío: e
 * En caso de no haber jugadas "forzosas" posibles, el programa responde
 * con false.
 */

/* Ejemplos de ejecución:
 * > No hay jugada forzosa:
 * ?- forzoso([e, e, e,
 *             e, e, e, 
 *             e, e, o], X).
 * Respuesta: false
 * 
 * > Hay una jugada ganadora:
 * ?- forzoso([x, e, o, 
 *             x, o, x, 
 *             e, e, o], X).
 * Respuesta: X = [7, 5, 3]
 * 
 * > Hay que impedir la jugada ganadora del rival:
 * ?- forzoso([o, x, x, 
 *             x, o, o, 
 *             e, x, x], X).
 * Respuesta: X = [7, 8, 9]
 */

/* Aquí están las jugadas posibles. Estas combinaciones se usarán como
 * respuesta y para contrastar las jugadas más adelante.
 */
/*  Horizontales*/
jugada([1, 2, 3]).
jugada([4, 5, 6]).
jugada([7, 8, 9]).

/*  Verticales*/
jugada([1, 4, 7]).
jugada([2, 5, 8]).
jugada([3, 6, 9]).

/*  Diagonal*/
jugada([1, 5, 9]).
jugada([7, 5, 3]).

/* queHay */
/* Devuelve la posicion de la casilla en la que se encuentra el símbolo
 * indicado, calculando la posición de manera recursiva, si se pasa
 * Casilla como variable y H como un valor específico (x|o|e).
 * También devuelve el contenido de una casilla si se pasa como variable
 * H y Casilla como valor específico (1 .. 9).
 */
/* Casos */
/* Si encuentra H en la cabeza de la lista (tablero), Casilla obtiene el
 * valor 1.
 */
queHay([H|_], Casilla, H) :-
    Casilla =:= 1, 
    !.

/* Si no es 1 (no está al inicio de la lista), hace una llamada
 * recursiva, de manera que el valor Casilla sumará +1 por cada llamada
 * realizada desde la primera hasta encontrar el valor que verifica.
 */
queHay([_|T], Casilla, Result) :-
    Casilla > 1,
    queHay(T, Casilla - 1, Result).

/* vacio */
/* Confirma que en una posición se encuentra el valor e */
vacio(Tablero, Casilla) :-
    queHay(Tablero, Casilla, e).

/* cara */
/* Confirma que en una posición se encuentra el valor o */
cara(Tablero, Casilla) :-
    queHay(Tablero, Casilla, o).

/* cruz */
/* Confirma que en una posición se encuentra el valor x */
cruz(Tablero, Casilla) :-
    queHay(Tablero, Casilla, x).

/* amenaza*/
/* Comprueba todos los casos en los que se puede dar una amenaza. Esto
 * es que, en la siguiente jugada, el rival puede ganar.
 */
/* Casos */
/* En una línea se encuentra e, x, x.
 */
amenaza(Tablero, [A ,B ,C]) :-
    jugada([A ,B ,C]),
    vacio(Tablero, A),
    cruz(Tablero, B),
    cruz(Tablero, C).

/* En una línea se encuentra x, e, x.
 */
amenaza(Tablero, [A ,B ,C]) :-
    jugada([A ,B ,C]),
    cruz(Tablero, A),
    vacio(Tablero, B),
    cruz(Tablero, C).

/* En una línea se encuentra x, x, e.
 */
amenaza(Tablero, [A ,B ,C]) :-
    jugada([A ,B ,C]),
    cruz(Tablero, A),
    cruz(Tablero, B),
    vacio(Tablero, C).

/* ganadora */
/* Comprueba todos los casos en los que se puede dar una jugada ganadora.
 * Esto es que, en la siguiente jugada, el jugador puede ganar.
 */
/* Casos*/
/* En una línea se encuentra e, o, o.
 */
ganadora(Tablero, [A ,B ,C]) :-
    jugada([A ,B ,C]),
    vacio(Tablero, A),
    cara(Tablero, B),
    cara(Tablero, C).

/* En una línea se encuentra o, e, o.
 */
ganadora(Tablero, [A ,B ,C]) :-
    jugada([A ,B ,C]),
    cara(Tablero, A),
    vacio(Tablero, B),
    cara(Tablero, C).

/* En una línea se encuentra o, o, e.
 */
ganadora(Tablero, [A ,B ,C]) :-
    jugada([A ,B ,C]),
    cara(Tablero, A),
    cara(Tablero, B),
    vacio(Tablero, C).

/* forzoso */
/* Función principal. Analiza primero si existe una jugada con la que se
 * pueda ganar y terminar la partida y, en caso contrario, busca si el
 * rival puede ganar en un movimiento, dando el resultado que puede
 * evitarlo.
 * En caso de que no haya ninguna jugada ganadora (ni para el jugador ni
 * para el rival), la función devuelve directamente false.
 */
/* Casos */
/* En el tablero se encuentra una jugada que permite ganar al jugador. En
 * este caso, el programa solo da una respuesta, debido a que es
 * innecesario saber de cuántas formas puedes ganar.
 */
forzoso(Tablero, Linea):-
    jugada(Linea),
    ganadora(Tablero, Linea),
    !.

/* En el tablero se encuentra una jugada que permite ganar al rival. En
 * este caso, el programa devuelve todas las respuestas, dando a entender
 * que, si el rival es consciente de todos los casos, el jugador no puede
 * ganar. La ejecución en este caso termina cuando se muestra el mensaje
 * "false".
 */
forzoso(Tablero, Linea) :-
    jugada(Linea),
    amenaza(Tablero, Linea).

