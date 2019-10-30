%%%%%%%%%%%%%%
% EJERCICIO
%%%%%%%%%%%%%%

% 3 EN RAYA
% Crear un programa que de victoria a la cara o pare la victoria de cruz
% Tablero =    [x, "", o,
%		"","","",
%		x,  o, x]

%%% HECHOS
%% Lineas
% Horizontales
linea(1,2,3).
linea(4,5,6).
linea(7,8,9).

% Verticales
linea(1,4,7).
linea(2,5,8).
linea(3,6,9).

% Diagonales
linea(1,5,9).
linea(3,5,7).
