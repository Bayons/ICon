%%%%%%%%%%%%%%
% EJERCICIO
%%%%%%%%%%%%%%

% Definir el árbol mediante las relaciones:
% 	pieza_basica(cadena).
% 	ensamblaje(bicicleta, [rueda_delantera, cuadro, rueda_trasera]).
% Construir relaciones “piezas_de”, que sirva para obtener la lista de
% piezas básicas para construir una determinada parte de (o toda) la
% bicicleta.

%%% HECHOS
%% Pieza basica
pieza_basica(llanta).
pieza_basica(radios).
pieza_basica(eje).
pieza_basica(manillar).
pieza_basica(sillin).
pieza_basica(plato).
pieza_basica(pedales).
pieza_basica(cadena).
pieza_basica(piñones).

%% Ensamblaje
ensamblaje(bicicleta, [rueda_delantera, cuadro, rueda_trasera]).
ensamblaje(rueda_delantera, [llanta, radios, eje]).
ensamblaje(cuadro, [manillar, sillin, traccion]).
ensamblaje(traccion, [eje, plato, pedales, cadena]).
ensamblaje(rueda_trasera, [llanta, radios, eje, piñones]).


%%% REGLAS
%% Desmontar(Lista_entrada, Resultado)
% LLega una basica
desmontar([B|_], B):-
	pieza_basica(B).
% Dado o no lo anterior y sea lo que sea lo siguiente
desmontar([_|L], R):-
	desmontar(L, R).
% Llega una compuesta
desmontar([C|_], R):-
	ensamblaje(C, L),
	desmontar(L, R).

%% Piezas de (Elemento, Resultado)
% Funcion principal
piezas_de(X, L):-
	ensamblaje(X, L1),
	desmontar(L1, L).
