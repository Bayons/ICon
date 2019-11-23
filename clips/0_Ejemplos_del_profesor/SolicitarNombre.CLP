(defrule solicitar-nombre
	(declare (salience 10000))
=>
	(printout t  "Nombre: ")
	(bind ?respuesta (read))
	(assert (nombre-usuario ?respuesta))
)
