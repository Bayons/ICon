; MIGUEL BAYÓN SANZ
; 44919111L
; EJERCICIO 2
; Para ver en qué está basado, ver el documento 2_SP_Cardio.pdf
; 1. Representar  la  información  de  los  parrafos  anteriores  mediante
;	un LRC  de  un Sistema  de Producción  que  emplee  el  formalismo
;	O-A-V con  variables. Incluir  la  declaración  de dominio y justificar
;	las elecciones realizadas.
; 2. Desarrollar una base de conocimiento para CLIPS a partir de la
;	representación obtenida en el apartado anterior.
; 3. Suponer conocidos todos los datos relevantes sobre los pacientes al inicio
;	de la consulta.
; 4. Obtener  el  diagnóstico  de  ambos  pacientes  y  categorizar  la
;	enfermedad  encontrada, informando al usuario en la salida estandar.

;;;;; PLANTILLAS
(deftemplate oav-u "Hechos Univaluados"
	(slot objeto (type SYMBOL))
	(slot atributo (type SYMBOL))
	(slot valor)
)

(deftemplate oav-m "Hechos Multivaluados"
	(slot objeto (type SYMBOL))
	(slot atributo (type SYMBOL))
	(slot valor)
)

;;;;; HECHOS
(deffacts observaciones_marta "Sintomas, evidencias y datos sobre Marta"
	(oav-u (objeto Marta)(atributo sexo)(valor mujer))
	(oav-u (objeto Marta)(atributo edad)(valor 12))
	(oav-m (objeto Marta)(atributo sintomas)(valor fiebre))
	(oav-m (objeto Marta)(atributo evidencias)(valor rumor_diastolico))
	(oav-u (objeto Marta)(atributo sistolica)(valor 150))
	(oav-u (objeto Marta)(atributo diastolica)(valor 60))
)

(deffacts observaciones_luis "Sintomas, evidencias y datos sobre Luis"
	(oav-u (objeto Luis)(atributo sexo)(valor hombre))
	(oav-u (objeto Luis)(atributo edad)(valor 60))
	(oav-m (objeto Luis)(atributo sintomas)(valor dolor_abdominal))
	(oav-m (objeto Luis)(atributo evidencias)(valor rumor_abdominal))
	(oav-m (objeto Luis)(atributo evidencias)(valor masa_pulsante))
	(oav-u (objeto Luis)(atributo sistolica)(valor 130))
	(oav-u (objeto Luis)(atributo diastolica)(valor 90))
)

(deffacts enfermedades "Descripcion de las enfermedades del dominio"
	(oav-u	(objeto aneurisma_arteria_abdominal)
		(atributo afecta)
		(valor vasos_sanguineos)
	)
	(oav-u	(objeto estenosis_arterial )
		(atributo afecta)
		(valor vasos_sanguineos)
	)
	(oav-u	(objeto arteriosclerosis)
		(atributo afecta)
		(valor vasos_sanguineos)
	)
	(oav-u	(objeto regurgitacion_aortica)
		(atributo afecta)
		(valor corazon)
	)
)

;;;;; REGLAS
(defrule hechos_univaluados "Garantiza la semantica de hechos univaluados"
	(declare (salience 10000))
	?f1 <- (oav-u (objeto ?obj) (atributo ?atr) (valor ?))
	?f2 <- (oav-u (objeto ?obj) (atributo ?atr) (valor ?))
	(test (neq ?f1 ?f2))
=>
	(retract ?f2)
)

(defrule A "La presión sanguínea se calcula restando la presión diastólica
a la presión sistólica"
	(declare (salience 10))
	(oav-u (objeto ?persona) (atributo sistolica) (valor ?sis))
	(oav-u (objeto ?persona) (atributo diastolica) (valor ?di))
=>
	(bind ?pulso (- ?sis ?di))
	(assert (oav-u	(objeto ?persona)
			(atributo pulso)
			(valor ?pulso)))
)

(defrule B1 "El paciente pertenece a un grupo de riesgo si lleva fumando mas
de 15 anyos"
	(declare (salience 5))
	(oav-u (objeto ?persona)(atributo tiempo_fumando)(valor ?t &:(> ?t 15)))
=>
	(assert (oav-u (objeto ?persona)(atributo riesgo)(valor true)))
)

(defrule B2 "El paciente pertenece a un grupo de riesgo si padece sobrepeso"
	(declare (salience 5))
	(oav-u (objeto ?persona)(atributo obeso)(valor true))
=>
	(assert (oav-u (objeto ?persona)(atributo riesgo)(valor true)))
)

(defrule B3 "El paciente pertenece a un grupo de riesgo si tiene mas de 50
anyos"
	(declare (salience 5))
	(oav-u (objeto ?persona)(atributo edad)(valor ?e &:(> ?e 50)))
=>
	(assert (oav-u	(objeto ?persona)
			(atributo riesgo)
			(valor true)))
)

(defrule C "Si el paciente siente dolor abdominal y se detecta un rumor
abdominal y una masa pulsante, probablemente sea una aneurisma de la arteria
abdominal"
	(oav-m (objeto ?persona)(atributo sintomas)(valor dolor_abdominal))
	(oav-m (objeto ?persona)(atributo evidencias)(valor rumor_abdominal))
	(oav-m (objeto ?persona)(atributo evidencias)(valor masa_pulsante))
=>
	(assert (oav-m	(objeto ?persona)
			(atributo padece)
			(valor aneurisma_arteria_abdominal)))
)

(defrule D1 "Es probablemente una regurgitación aórtica si el paciente tiene
la presión sistólica por encima de 140, la presión del pulso por encima de 50 y
se percibe un rumor sistolico"
	(oav-u (objeto ?persona)(atributo sistolica)(valor ?sis &:(> ?sis 140)))
	(oav-u (objeto ?persona)(atributo pulso)(valor ?p &:(> ?p 50)))
	(oav-m (objeto ?persona)(atributo evidencias)(valor rumor_sistolico))
=>
	(assert (oav-m	(objeto ?persona)
			(atributo padece)
			(valor regurgitacion_aortica)))
)

(defrule D2 "Es probablemente una regurgitación aórtica si el paciente tiene
la presión sistólica por encima de 140, la presión del pulso por encima de 50 y
se percibe una dilatacion del corazon"
	(oav-u (objeto ?persona)(atributo sistolica)(valor ?sis &:(> ?sis 140)))
	(oav-u (objeto ?persona)(atributo pulso)(valor ?p &:(> ?p 50)))
	(oav-m (objeto ?persona)(atributo evidencias)(valor dilatacion_corazon))
=>
	(assert (oav-m	(objeto ?persona)
			(atributo padece)
			(valor regurgitacion_aortica)))
)

(defrule E "Si el paciente siente un calambre en la pierna es muy probable que padezca estenosis arterial"
	(oav-u (objeto ?persona)(atributo sintomas)(valor calambre_pierna))
=>
	(assert (oav-m	(objeto ?persona)
			(atributo padece)
			(valor estenosis_arterial)))
)

(defrule F "Si el paciente padece estenosis arterial y pertenece a un grupo de
riesgo, es posible que se deba a una arteriosclerosis"
	(oav-m (objeto ?persona)(atributo padece)(valor estenosis_arterial))
	(oav-u (objeto ?persona)(atributo riesgo)(valor true))
=>
	(assert (oav-m	(objeto ?persona)
			(atributo padece)
			(valor arteriosclerosis)))
)

(defrule imprime1 "Imprime por salida estandar a que afecta la enfermedad
padecida"
	(oav-m (objeto ?persona)(atributo padece)(valor ?enfermedad))
	(oav-u (objeto ?enfermedad)(atributo afecta)(valor vasos_sanguineos))
=>
	(printout t ?persona " padece " ?enfermedad ", una enfermedad que afecta a los vasos sanguineos." crlf)
)

(defrule imprime2 "Imprime por salida estandar a que afecta la enfermedad
padecida"
	(oav-m (objeto ?persona)(atributo padece)(valor ?enfermedad))
	(oav-u (objeto ?enfermedad)(atributo afecta)(valor corazon))
=>
	(printout t ?persona " padece " ?enfermedad ", una enfermedad que afecta al corazon." crlf)
)