# ICon - Ingeniería del Conocimiento
Los ejercicios aquí hechos pertenecen a la asignatura de Ingeniería del Conocimiento de la Universidad de Valladolid.

## APUNTES
En la carpeta [Apuntes](https://github.com/Bayons/ICon/tree/master/Apuntes) se encuentran los resúmenes de las diapositivas de la asignatura ICon escritos con la intención de que cualquiera pueda comprender la asignatura (es posible que contengan fallos). También contiene (o se pretende que contenga) glosarios del lenguaje utilizado a la hora de tratar Lenguaje Proposicional y Lógica de Primer Orden. En el futuro se pretende que estos apuntes estén subidos en Latex para que cualquiera pueda modificarlos mediante un fork y mejorar las definiciones escritas o solucionar los errores cometidos.

## PROLOG
En la carpeta [prolog](https://github.com/Bayons/ICon/tree/master/prolog) se encuentran los ejercicios dedicados al repaso de este lenguaje y a la creación con el mismo de metaintérpretes:

### Repaso de PROLOG 1:
- [Familia](https://github.com/Bayons/ICon/blob/master/prolog/1.1-familia.pl): hace preguntas sobre las lineas familiares
### Repaso de PROLOG 2:
- [Mi biblioteca](https://github.com/Bayons/ICon/blob/master/prolog/2.1-mi_biblioteca.pl): contiene unos pocos ejemplos de estructuras
- [Casa Austria](https://github.com/Bayons/ICon/blob/master/prolog/2.2-casa_austria.pl): contiene ejemplos de operadores
- [Combinatorio](https://github.com/Bayons/ICon/blob/master/prolog/2.3-combinatorio.pl): realiza una combinacion sin repeticion
### Repaso de PROLOG 3:
- [Listas](https://github.com/Bayons/ICon/blob/master/prolog/3.1-listas.pl): busca en listas los elementos indicados
- [Bicicleta](https://github.com/Bayons/ICon/blob/master/prolog/3.2-bicicleta.pl): descompone la parte de la bicicleta que indiques en elementos básicos
### Repaso de PROLOG 4:
- [3 en Raya](https://github.com/Bayons/ICon/blob/master/prolog/4.1-3_en_raya.pl): devuelve la jugada capaz de ganar la partida o evitar que la gane el rival
### Ejercicios de meta-intérprete y autómatas:
- [Ejemplo propio de autómata](https://github.com/Bayons/ICon/blob/master/prolog/5.1_ejemplo_propio.pl): comprueba que una cadena tiene el doble de b's que de a's. Contiene además documentación de cada paso dado y de todas las funciones, junto con pequeños consejos para realizar estos ejercicios.
- [Autómata con dos pilas](https://github.com/Bayons/ICon/blob/master/prolog/5.2_varias_pilas.pl): comprueba que una cadena tiene el mismo número de a's, b's y c's.
- [Autómata con varias pilas](https://github.com/Bayons/ICon/blob/master/prolog/5.3_varias_pilas.pl): comprueba varios casos a la vez mediante 3 pilas.
- [Ejemplo de un examen](https://github.com/Bayons/ICon/blob/master/prolog/5.4_ejemplo_de_examen.pl): comprueba que el número de letras 'b' (en el medio de la cadena) sea el mismo que la suma del resto de letras.
- [Palíndromos](https://github.com/Bayons/ICon/blob/master/prolog/5.5_palindromos.pl): comprueba que una cadena de palabras forme un palíndromo.

## CLIPS
En la carpeta [clips](https://github.com/Bayons/ICon/tree/master/clips) se encuentran los ejercicios dedicados al autoaprendizaje en CLIPS y al manejo del formalismo Objeto-Atributo-Valor:

### 0: Ejemplos del profesor:
Carpeta con ejemplos muy simples de programas de CLIPS.

### 1: Introducción:
- [Ejemplo básico](https://github.com/Bayons/ICon/blob/master/clips/1_Introduccion/1.ejemplo_basico.CLP): introduce el lenguaje y propone (en los comentarios) el primer ejercicio, que consiste en determinar el orden de disparo de las reglas creadas dependiendo de la estrategia de resolución de conflictos (se analizan solo las estrategias depth y breadth).
- [Orden de disparo de reglas](https://github.com/Bayons/ICon/blob/master/clips/1_Introduccion/2.orden_de_disparo_de_reglas.CLP): utilizando unas reglas y hechos predefinidos en el enunciado, hay que comprobar en que orden se disparan las mismas reglas dependiendo de la estrategia de resolución (de manera similar al ejercicio 1 de Ejemplo básico.
- [Coche](https://github.com/Bayons/ICon/blob/master/clips/1_Introduccion/3.coche.CLP): conociendo las causas que pueden provocar fallos en un coche, este programa razona qué está estropeado en el mismo.

### 2: Lenguaje Objeto-Atributo-Valor:
- [Semántica univaluada](https://github.com/Bayons/ICon/blob/master/clips/2_Introduccion_II_OAV/1_semantica_univaluada.CLP): contiene la plantilla para atributos univaluados de objetos junto con la regla que permite garantizar su propiedad.
- [SP Cardio](https://github.com/Bayons/ICon/blob/master/clips/2_Introduccion_II_OAV/2_SP_Cardio.CLP): busca, mediante los conocimientos introducidos usando reglas, si uno de los dos pacientes representados en los hechos tiene una enfermedad cardiovascular. En la misma [carpeta](https://github.com/Bayons/ICon/tree/master/clips/2_Introduccion_II_OAV) se encuentra tanto el enunciado del ejercicio como la documentación a realizar para el mismo.

### 3: Ampliación con Factores de Certeza:
- [SP Cardio con fc](https://github.com/Bayons/ICon/blob/master/clips/3_Factores_de_certeza/sp_cardio_certeza.CLP): Ampliación del ejercicio [SP Cardio](https://github.com/Bayons/ICon/blob/master/clips/2_Introduccion_II_OAV/2_SP_Cardio.CLP), pero utilizando factores de certeza.

## Por último...
Si te ha sido útil, por favor no dudes en marcar este repositorio con una estrella. Me ayudará a ver lo valioso que está siendo este repositorio y a seguir mejorándolo.
