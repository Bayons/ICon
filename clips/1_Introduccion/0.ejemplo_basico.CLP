; Ejemplo inicial: AMIGOS
; Los ficheros CLP contienen todos los comandos ordenados que se ejecutaran en
;	la ventana Dialog de CLIPS

; Hechos
; Estos hechos se añadiran como iniciales al ejecutarse
; Se agrupan en un grupo de hechos llamado 'amigos'. A continuacion se anade
;	una descripcion y, despues, los hechos.
(deffacts amigos "algunos amigos"
	(persona "Luis Prieto" 53 1.83)
	(persona "Ana Perez" 56 1.70)
)

; Reglas
; De manera similar a como se añaden los hechos se anaden tambien las reglas:
; 	nombre, descricpion y cuerpo de la regla. Aqui, se declara primero
;	la prioridad de la regla (salience), y despues el cuerpo del mismo.
(defrule nombre-amigos "Encontrar el nombre de los amigos"
	(declare (salience 0))
	(persona ?x ? ?)
=>
	(assert (encontrado ?x))
)