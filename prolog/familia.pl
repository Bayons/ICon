%%%% Clasico ejercicio de prolog del arbol genealogico donde hay que
%	buscar entre miembros de la familia quien es que de quien.
%	Añado que se puede hacer sin incluir generos, aunque por
%	comodidad en este ejercicio he añadido esta regla.

%%% HECHOS
%% hombre
hombre(juan).
hombre(julio).
hombre(fernando).
hombre(javier).
hombre(gonzalo).
hombre(alvaro).
hombre(guillermo).

%% mujer
mujer(ana).
mujer(elena).
mujer(maria).
mujer(isabel).
mujer(beatriz).
mujer(eva).

%% hijo_de(Hijo, Padre)
% hijos de Juan y Ana
hijo_de(julio, juan).
hijo_de(elena, juan).
hijo_de(fernando, juan).
hijo_de(julio, ana).
hijo_de(elena, ana).
hijo_de(fernando, ana).

% hijos de Julio y Maria
hijo_de(isabel, julio).
hijo_de(gonzalo, julio).
hijo_de(alvaro, julio).
hijo_de(isabel, maria).
hijo_de(gonzalo, maria).
hijo_de(alvaro, maria).

% hijos de Javier y Elena
hijo_de(beatriz, javier).
hijo_de(eva, javier).
hijo_de(guillermo, javier).
hijo_de(beatriz, elena).
hijo_de(eva, elena).
hijo_de(guillermo, elena).

%% pareja(Hombre, Mujer)
pareja(juan, ana).
pareja(julio, maria).
pareja(javier, elena).

%%% REGLAS

%% son matrimonio (cabe aclarar que tomo este caso cerrado, por favor
%	no malinterpreteis ),: )
matrimonio(Hombre, Mujer):-
	pareja(Hombre, Mujer),
	hombre(Hombre),
	mujer(Mujer).

%% es hijo/a de
es_hijo_de(Hijo, Padre):-
	hijo_de(Hijo, Padre),
	hombre(Hijo).

es_hija_de(Hija, Padre):-
        hijo_de(Hija, Padre),
        mujer(Hija).

%% es abuelo/a de
es_abuelo_de(Abuelo, Nieto):-
	hijo_de(Padre, Abuelo),
	hijo_de(Nieto, Padre),
	hombre(Abuelo).

es_abuela_de(Abuela, Nieto):-
        hijo_de(Padre, Abuela),
        hijo_de(Nieto, Padre),
	mujer(Abuela).

%% es padre/madre de
es_padre_de(Padre, Hijo):-
	hijo_de(Hijo, Padre),
	hombre(Padre).

es_madre_de(Madre, Hijo):-
	hijo_de(Hijo, Madre),
	mujer(Madre).

%% es hermano/a de
es_hermano_de(Hmno, Otro):-
	hijo_de(Hmno, X),
	hijo_de(Otro, X),
	hombre(Hmno),
	hombre(X),
	not(Otro = Hmno).

es_hermana_de(Hmna, Otro):-
        hijo_de(Hmna, X),
        hijo_de(Otro, X),
        mujer(Hmna),
        hombre(X),
        not(Otro = Hmna).

%% es tio/a de
es_tio_de(Tio, Sb):-
	hijo_de(Sb, Pa),
	es_hermano_de(Tio, Pa).

es_tio_de(Tio, Sb):-
	hijo_de(Sb, Pa),
	es_hermana_de(Tia, Pa),
	matrimonio(Tio, Tia).

es_tia_de(Tia, Sb):-
        hijo_de(Sb, Pa),
        es_hermana_de(Tia, Pa).

es_tia_de(Tia, Sb):-
        hijo_de(Sb, Pa),
        es_hermano_de(Tio, Pa),
        matrimonio(Tio, Tia).

%% es primo/a de
es_primo_de(Primo, Tu):-
	es_padre_de(Tio, Primo),
	hijo_de(Tu, Padre),
	es_hermano_de(Tio, Padre),
	hombre(Primo).

es_primo_de(Primo, Tu):-
        es_madre_de(Tia, Primo),
        hijo_de(Tu, Padre),
        es_hermana_de(Tia, Padre),
        hombre(Primo).

es_prima_de(Prima, Tu):-
        es_padre_de(Tio, Prima),
        hijo_de(Tu, Padre),
        es_hermano_de(Tio, Padre),
        mujer(Prima).

es_prima_de(Prima, Tu):-
        es_madre_de(Tia, Prima),
        hijo_de(Tu, Padre),
        es_hermana_de(Tia, Padre),
        mujer(Prima).

%% es sobrino/a de
es_sobrino_de(Sno, Tio):-
	es_tio_de(Tio, Sno),
	hombre(Sno).

es_sobrino_de(Sno, Tia):-
	es_tia_de(Tia, Sno),
	hombre(Sno).

es_sobrina_de(Sna, Tio):-
	es_tio_de(Tio, Sna),
	mujer(Sna).

es_sobrina_de(Sna, Tia):-
	es_tia_de(Tia, Sna),
	mujer(Sna).

%%% Queries de ejemplo
%%
% es_hijo_de(X, julio).
% es_abuelo_de(juan, X).
% es_abuelo_de(javier, X).
% es_hermano_de(X, isabel).
% es_hermana_de(X, gonzalo).
% es_tio_de(fernando, X).
% es_tia_de(maria, X).
% es_primo_de(X, alvaro).
% es_sobrino_de(X, fernando).
