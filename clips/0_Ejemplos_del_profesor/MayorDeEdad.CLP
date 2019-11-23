(deftemplate persona (slot nombre) (slot edad))

(defrule mayor-de-edad
	(persona 	(nombre ?nombre)
			(edad ?edad & :(>= ?edad 18)))
=>
	(printout t ?nombre " es mayor de edad." crlf)
)
