(deftemplate persona   (multislot nombre)   (multislot hijos))

(deffacts algunas-personas (persona   (nombre Juan Rodrigo)  (hijos Pablo Ana))
   (persona  (nombre Jose Gimenez)  (hijos Pedro)))

(defrule print-hijos
   (print-hijos $?nombre)
   (persona (nombre $?nombre)
	(hijos $?hijos))
   =>
   (printout t ?hijos " son hijos de " $?nombre "." crlf))
