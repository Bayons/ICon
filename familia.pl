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


%%% Queries de ejemplo
