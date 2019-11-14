; Ejemplo inicial: AMIGOS
; Los ficheros CLP contienen todos los comandos ordenados que se ejecutaran en
;	la ventana Dialog de CLIPS

;;;;;;;;;;;;;;; Hechos ;;;;;;;;;;;;;;;
; Estos hechos se añadiran como iniciales al ejecutarse
; Se agrupan en un grupo de hechos llamado 'amigos'. A continuacion se anade
;	una descripcion y, despues, los hechos.
(deffacts amigos-edad-altura "gente con su edad y altura"
	(persona "Luis Prieto" 53 1.83)
	(persona "Ana Perez" 56 1.70)
)

(deffacts amigos-sexo "gente con su sexo"
	(persona "Luis Prieto" sexo hombre)
	(persona "Ana Perez" sexo mujer)
)

;;;;;;;;;;;;;;; Reglas ;;;;;;;;;;;;;;;
; De manera similar a como se añaden los hechos se anaden tambien las reglas:
; 	nombre, descricpion y cuerpo de la regla. Aqui, se declara primero
;	la prioridad de la regla (salience), y despues el cuerpo del mismo.

;;; nombre-amigos ;;;
; Busca a todas las personas x de cualquier edad y altura y crea un nuevo hecho
;	llamado <<encontrado>> con el nombre de la persona
(defrule nombre-amigos "Encontrar el nombre de los amigos"
	(declare (salience 0))
	(persona ?x ? ?)
=>
	(assert (encontrado ?x))
)

;;; guarda-amigos-chico ;;;
; Busca a todos los chicos y los guarda como amigos
(defrule guarda-amigos-chico "Registra chicos como amigos"
	(declare (salience 10))
	(persona ?x sexo hombre)
=>
	(assert (amigo ?x))
)

;;; guarda-amigos-chica ;;;
; Busca a todas las chicas y las guarda como amigos
(defrule guarda-amigos-chica "Registra chicas como amigas"
	(declare (salience 10))
	(persona ?x sexo mujer)
=>
	(assert (amiga ?x))
)

; Para establecer una estrategia de resolucion de conflictos (solo en dialog):
; (set-strategy depth).

; Se pueden establecer varios: depth, breadth, simplicity, complexity, lex,
;	mea o random. Conviene recordar que en los apuntes el profesor escribe
;	mal la estrategia breaDth

; Ejercicio 1:
;	Determinar el orden de disparo de las reglas, el
;	contenido de la memoria de trabajo y el índice de
;	cada hecho cuando el motor de inferencias se para.

; Respuesta dada en la entrega (no es del todo correcta):
;; En el modo por defecto Depth, al generarse las consultas se almacenan como
;; una pila por niveles, colocando cada nueva consulta en la parte más alta de
;; las reglas de su nivel (contando además con el valor de prioridad de salida
;; o salience). Además, por cada regla se genera el número de consultas
;; necesarias para cubrir todos los hechos que coincidan, y primero se realizan
;; las consultas de los últimos hechos introducidos.
;;
;; En el modo Breadth, el orden de prioridad se mantiene, pero las consultas se
;; realizan antes sobre los primeros hechos que sobre los últimos.