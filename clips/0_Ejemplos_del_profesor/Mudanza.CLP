(deftemplate persona 
   (slot nombre)
   (slot direccion)
)

(deftemplate mudanza
   (slot nombre)
   (slot direccion))

(defrule procesar-informacion-mudanza
   ?f1 <- (mudanza (nombre ?nombre) (direccion ?direccion))
   ?f2 <- (persona (nombre ?nombre))
   =>
   (retract ?f1)
   (modify ?f2 (direccion ?direccion))
)

(deffacts informacion-mudanza
   (persona (nombre "Juan Rodrigo")
		(direccion "Paseo Zorrilla 37"))
   (mudanza (nombre "Juan Rodrigo")
		(direccion "Calle Gaviota 12"))
)