; EJERCICIO 1
; Proponer una soluci�n computacional en CLIPS para garantizar la
;	sem�ntica univaluadade los tripletes Objeto-Atributo-Valor
;	univaluados (hacer su trabajo). Codificar la soluci�n en
;	CLIPS y probarla con un ejemplo sencillo.


; Definimos la plantilla de hechos univaluados
(deftemplate oav-u "Hechos Univaluados"
	(slot objeto (type SYMBOL))
	(slot atributo (type SYMBOL))
	(slot valor)
)

; Para la plantilla descrita, definimos una funci�n que garantice que
;	solo habr� un valor por atributo descrito.
(defrule hechos_univaluados "Garantiza la semantica de hechos univaluados"
	(declare (salience 10000))
	?f1 <- (oav-u (objeto ?obj) (atributo ?atr) (valor ?))
	?f2 <- (oav-u (objeto ?obj) (atributo ?atr) (valor ?))
	(test (neq ?f1 ?f2))
	=>
	(retract ?f2)
)

; Comprobamos que se queda el ultimo valor a�adido (tambi�n se puede
;	comprobar a�adiendo hechos por la ventana de dialogo)
(deffacts color_coche
	(oav-u (objeto coche)(atributo color)(valor rojo))
	(oav-u (objeto coche)(atributo color)(valor verde))
	(oav-u (objeto coche)(atributo color)(valor amarillo))
)