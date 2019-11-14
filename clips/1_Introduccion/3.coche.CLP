; Ejercicio 3:
; La figura 1 muestra un fragmento de una red causal que modela conocimiento
; del dominio para la tarea de diagnosis en el dominio de los automóviles. La
; red asocia posibles causas de fallo –fusible fundido, batería baja o depósito
; de combustible vacío–con estados intermedios –potencia, combustible en
; motor– y síntomas –comportamiento motor, inspección fusible, indicador
; batería... –. Se puede observar que la red refleja la dirección causal: la
; causa “Depósito de combustible vacío” tiene como efecto “Combustible en
; motor falso” que a su vez es causa de “Comportamiento motor se para”.

; a) A partir de la Red de la figura 1, elaborar una base de conocimiento
; basada en reglas utilizando el formalismo objeto-atributo-valor y un
; lenguaje proposicional (sin variables).

; b) Codificar la base de reglas elaborada en a) en CLIPS, utilizando
; patrones ordenados.

; c) Probar los siguientes escenarios:
; 	1. Se observa que el motor no arranca y que el indicador de batería
; 	marca cero.
; 	2. Se observa que el motor se para y que el indicador de combustible
; 	marca cero

;; Objetos:
;; O = {coche, motor, potencia, batería, fusible, combustible, depósito}
;; DA = {
;; 	coche.seParas: {true, false},
;; 	motor.arrancas: {true, false},
;; 	motor.combustibles: {true, false},
;; 	potencia.conectadas: {true, false},
;; 	bateria.indicadors:number,
;; 	bateria.estados: {alta, baja},
;; 	fusible.inspeccions: {roto, correcto},
;; 	fusible.estados: {fundido, funcional},
;; 	combustible.indicadors:number,
;; 	deposito.estados: {vacio, lleno}
;; }



;;;;;;;;;;;;;;;;;;;;;; Plantilla o-a-v
; (oav (objeto O) (atributo A) (valor V))
(deftemplate oav
        (slot objeto)
        (slot atributo)
        (slot valor)
)

;;;;;;;;;;;;;;;;;;;;;; Hechos (casos nombrados en el punto c)
; Descomentar el que se vaya a comprobar

;(deffacts escenario1
;	(oav	(objeto motor)
;		(atributo arranca)
;		(valor false)
;	)
;	(oav	(objeto bateria)
;		(atributo indicador)
;		(valor 0))
;)

(deffacts escenario2
	(oav	(objeto motor)
		(atributo se_para)
		(valor true)
	)
	(oav	(objeto combustible)
		(atributo indicador)
		(valor 0))
)

;;;;;;;;;;;;;;;;;;;;;;  Reglas
(defrule potencia_desconectada "Si el motor no arranca, puede que tenga
	la potencia desconectada"
        	(oav (objeto motor) (atributo arranca) (valor false))
        =>
        	(assert (oav
			(objeto potencia)
			(atributo conectada)
			(valor false)))
)

(defrule combustible_motor1 "Si el motor se para, puede que no llegue
	combustible a él"
        	(oav (objeto motor) (atributo se_para) (valor true))
        =>
        	(assert (oav
			(objeto motor)
			(atributo combustible)
			(valor false)))
)

(defrule combustible_motor "Si el motor no arranca, puede que no
	llegue combustible a él"
        	(oav (objeto motor) (atributo arranca) (valor false))
        =>
        	(assert (oav
			(objeto motor)
			(atributo combustible)
			(valor false)))
)

(defrule fusible_fundido "Si la potencia esta desconectada y el fusible se
	detecta como roto, puede que el fusible este fundido"
        	(oav (objeto potencia)(atributo conectada) (valor false))
        	(oav (objeto fusible) (atributo inspeccion) (valor roto))
        =>
        	(assert (oav
			(objeto fusible)
			(atributo estado)
			(valor fundido)))
)

(defrule bateria_baja "Si la potencia esta desconectada y el indicador
	de bateria marca cero, es posible que la bateria este baja"
        	(oav (objeto potencia)(atributo conectada) (valor false))
        	(oav (objeto bateria) (atributo indicador) (valor 0))
        =>
        	(assert (oav
			(objeto bateria)
			(atributo estado)
			(valor baja)))
)

(defrule deposito_vacio "Si no llega combustible al motor y el indicador de
	combustible marca cero, es posible que el deposito este vacio"
        	(oav (objeto motor)(atributo combustible) (valor false))
        	(oav (objeto combustible) (atributo indicador) (valor 0))
        =>
        	(assert (oav
			(objeto deposito)
			(atributo estado)
			(valor vacio)))
)