; 2: En un entorno de CLIPS vacio evaluamos los siguientes
; constructores en el orden proporcionado:

(deffacts hechos-iniciales
		(hecho 1 )
		(hecho 2 )
		(hecho 3 )
		(hecho 4 )
		(hecho 5 )
		(hecho 6 )
)

(defrule regla-1 "hechos 1-2-3"
		(hecho 1)
		(hecho 2)
		(hecho 3)
	=>
		(assert (regla disparada 1))
)
(defrule regla-2 "hechos 3-2"
		(hecho 3)
		(hecho 2)
	=>
		(assert (regla disparada 2))
)

(defrule regla-3 "hecho 2-6-4"
		(hecho 2)
		(hecho 6)
		(hecho 4)
	=>
		(assert (regla disparada 3))
)

(defrule regla-4 "hecho 6-4-3-2"
		(hecho 6)
		(hecho 4)
		(hecho 3)
		(hecho 2)
	=>
		(assert (regla disparada 4))
)

; Determinar el orden de disparo de las reglas con cada
; una de las siguientes estrategias: Depth, BreaDth, LEX,
; MEA y Complexity.
;; 1. (set-strategy depth)
;;	orden: 3, 4, 1, 2
;; 2. (set-strategy breadth)
;;	orden: 2, 1, 4, 3
;; 3. (set-strategy lex)
;;	orden: 4, 3, 1, 2
;; 4. (set-strategy mea)
;;	orden: 4, 2, 3, 1
;; 5. (set-strategy complexity)