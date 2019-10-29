% Estructuras: similar a los hechos, aunque representan objetos
%	compuestos.
% Estan formados por:
% 	- Functor: objeto/nombre del objeto.
% 	- Functores: composicion del objeto. Pueden ser otros Functor.
% Ejemplo:
% tiene(belarmino, libro).
% tiene(belarmino, libro(hobbit, tolkien)).
% tiene(belarmino, libro(hobbit, autor(jrr, tolkien))).
% tiene(belarmino, yo_robot).
% tiene(belarmino, hobbit).

%%%%%%%%%%%%%%
% EJERCICIO
%%%%%%%%%%%%%%
% Crea un fichero PROLOG, mi_biblioteca.pl, con una definición de tus
% 	libros, diferenciados por géneros, y después realiza consultas
%	concretas, con variables y con variables anónimas. Comenta cuál
%	sería la pregunta original

%%% ESTRUCTURAS
libro(ficcion, relatos_completos).
libro(ficcion, farenheit_451).
libro(poesia, dios_es_chiste).
libro(poesia, rimas_y_leyendas).


%%% HECHOS
%% Generos
genero(ficcion).
genero(poesia).

%% Titulos
titulo(relatos_completos).
titulo(dios_es_chiste).
titulo(rimas_y_leyendas).
titulo(farenheit_451).


%%% QUERIES 
% libro(ficcion, X).
% libro(poesia, X).
