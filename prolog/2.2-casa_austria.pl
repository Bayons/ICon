% OPERADORES
% Las operaciones matematicas se pueden escribir como estructuras:
% 4 + 2 equivale a +(4, 2)
% 5 + 6 + 7 equivale a +(5, +(6, 7))
%
% Los operadores estan especificadas por:
% 	- posicion (infija, prefija, postfija)
% 	- precedencia (cuándo se realiza) [* antes que +]
% 	- asociatividad (por la izq. o la der.)[operadores aritmeticos
% 		por la izquierda: 8/4/2 = (8/4)/2]
% 	- Tabla (indica todo esto más su numero de indice)
%
% +, -, *, /: posicion infija, precedencia (*, /) > (+, -), asociatividad
% 	por la izquierda. Se pueden modificar (meta-interprete)
%
% El operador is evalua las operaciones a su derecha y compara:
% ?- X is 2 + 2.
% 	X = 4.
% El operador predefinido = no evalua, solo compara para hacer coincidir:
% ?- X = Y.
% 	X = Y.
%
% El operador predefinido \= se satisface si no se cumple que X = Y:
% ?- alpargata \= zapatilla.
% 	true.
%
% Operadores predefinidos (invariables): =, \=, <, >, =<, >=

%%%%%%%%%%%%%%%%%%%%%
%EJERCICIO
%%%%%%%%%%%%%%%%%%%%%
% Base de conocimiento: reyes de la casa de Austria en España.
% Hecho: reinado(nombre_rey,año_de_inicio_reinado,año_final_reinado).
% Construir la propiedad rey_casa_austria(X,Y) para averiguar que rey X
% 	era el que estaba en el trono en el año Y.

%%% HECHOS
reinado(carlos_i, 1516, 1556).
reinado(felipe_ii, 1556, 1598).
reinado(felipe_iii, 1598, 1621).
reinado(felipe_iv, 1621, 1665).
reinado(carlos_ii, 1665, 1700).

%%% REGLAS
rey_casa_austria(Rey, Año):-
	reinado(Rey, A1, A2),
	Año >= A1,
	Año < A2.
