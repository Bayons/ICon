;  Ejemplo hecho: Colegas

;  Definir plantilla

(deftemplate persona 	
	"Un ejemplo de plantilla"
	(multislot nombre)
	(slot edad)
	(slot color-ojos)
	(slot color-pelo ))


;	Hechos iniciales

(deffacts colegas "Algunos colegas"
	(persona 	(nombre Luis Perez Rubio)
			(edad 23)
			(color-ojos azul)
			(color-pelo rubio))
	(persona 	(nombre Juan Soto Garcia)
			(edad 24)
			(color-ojos gris)
			(color-pelo castaño))
)

; Única regla

(defrule edad-colegas "Encontrar la edad de los colegas"
	(persona (nombre ?x ? ?)
			(edad ?y))
=>
	(printout t " " ?x " tiene " ?y " años." crlf)
)
