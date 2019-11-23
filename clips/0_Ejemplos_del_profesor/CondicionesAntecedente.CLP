(deftemplate emergencia (slot tipo))

(deffacts emergencias-varias
(emergencia (tipo fuego))
(emergencia (tipo inundacion))
)


(defrule cortar-electricidad
	(or	(emergencia (tipo inundacion))
		(emergencia (tipo fuego)))
=>
	(printout t "Desconectar electricidad." crlf)
)



(deftemplate potencia-electrica (slot estado))

(defrule cortar-electricidad-una-vez
	(and (potencia-electrica (estado on))
		(emergencia (tipo fuego)))
=>
	(printout t "Desconectar electricidad." crlf)
)

(deftemplate persona (slot nombre) (slot edad))

(deffacts algunas-personas 
 (persona (nombre Juan) (edad 22))
)

(defrule comprobar-edad-par
	(persona (nombre ?nombre)
		 (edad ?edad))
	(test (and (numberp ?edad)
		   (eq 0 (mod ?edad 2))))
=>
	(printout t "La edad de " ?nombre " es par." crlf)
)

(defrule sin-emergencia 
	(informar)
	(not (emergencia))
=>
	(printout t "No hay ninguna emergencia." crlf)
)

(deffacts numeros
	(numero 1) (numero 2) (numero 3)
)

(defrule numero-mayor
	(numero ?x)
	(not (numero ?y&:(> ?y ?x)))
=>
	(printout t "El número mayor es: " ?x crlf)
)