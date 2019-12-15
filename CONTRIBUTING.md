# Contribuyendo al proyecto
Todo este proyecto pretende ser colaborativo con el fin de que, entre todos, consigamos unos apuntes limpios, fáciles de
entender y útiles para estudiar la asignatura de Ingeniería del Conocimiento de la Universidad de Valladolid (por lo menos).
Para esto, cualquiera está llamado a colaborar, de manera que los alumnos de los próximos años que cursen esta asignatura no
la vean como un obstáculo, sino como una asignatura interesante.

## ¿Cómo puedo colaborar?
Existen varios métodos de colaborar en el proyecto dependiendo de qué modificar o qué errores hayas visto.

### 1. Erratas
A cualquiera se nos escapa una letra de más, de menos, una tilde por aquí, esa mayúscula que está mal...

Si quieres avisar de una simple errata en el código (en los comentarios, por ejemplo), puedes crear un issue basado en la
siguiente plantilla:

**Título:**`Errata: <carpeta>/<fichero>`

**Comentario:**
- `linea <nLinea>: <palabraIncorrecta> -> <palabraCorrecta>`

No hace falta que haya una sola errata por issue, siempre y cuando pertenezcan al mismo fichero. Por ejemplo:

**Título:**`Errata: clips/1_introduccion/1.ejemploBasico.CLP`

**Comentario:**
- `linea 1: Ejmplo -> Ejemplo`
- `linea 2: continen -> contienen`

En el caso de que la errata sea en los apuntes, debido a la poca precisión que puede ofrecer un archivo PDF en este aspecto,
en el comentario habría que indicar el apartado exacto donde se encuentra la errata y la página, además de la palabra o
palabras a sustituir:

**Título:**`Errata: Apuntes/<fichero>`

**Comentario:**
- `apartado <apartado>:<subapartado>[:<subsubapartadoSiExiste>] @ pagina <Pagina>: <palabraIncorrecta> -> <palabraCorrecta>`

Por ejemplo:

**Título:**`Errata: Apuntes/Apuntes de ICon.pdf`

**Comentario:**
- `apartado Estrategias de resolucion:Estrategias de resolución:Estrategia de direccion @ pagina 3: sigiente -> siguiente`

### 2. Bugs
Puede ocurrir que el código del proyecto no compile, funcione de manera inesperada, directamente no funcione...

Si esto ocurre, pueden darse tres casos: que el código que hay que cambiar sea pequeño, que sea grande o que no sepas qué hay
que cambiar (o no te apetezca cambiarlo, todo es posible). Para cada opción te doy una solución:

#### a) El código que hay que cambiar es pequeño
Issue

#### b) El código que hay que cambiar es grande
[Fork](https://help.github.com/es/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork)

#### c) Quieres notificar un mal funcionamiento
Issue

### 3. Proposiciones de cambio
¿Eso que viene en los apuntes está bien? ¿Estás seguro? ¿No se entendería mejor si lo escribieras de esta otra manera?

No soy tan bueno explicando como a veces me gustaría, y nadie es perfecto. Si crees que una parte de los apuntes es
mejorable, tienes dos opciones

#### a) Notificarme de una sección mal explicada
Si quieres que cambie yo mismo la explicación de una sección, puedes crear un issue con el título `Cambio en apuntes` cuyo
comentario cuente claramente qué está mal explicado o qué no se entiende bien, indicando en qué apartado o apartados quieren
hacerse los cambios.

Antes de realizar una petición de cambio, hay que considerar que los apuntes están hechos para que no se repitan conceptos.
Esto significa que, si lo que no entiendes es porque no has leído los apartados anteriores, la petición de cambio se
rechazará.

Consideraré aceptables, por ejemplo, cambios referidos a malas definiciones, ejemplos poco explicativos o aclaradores,
conceptos de las diapositivas que no se encuentren aquí o conceptos que no se encuentren en un apartado correcto o que se
encuentren en un apartado en que no hacen falta.

De cualquier manera, cualquier petición de cambio (incluso las que he dicho que rechazaré) puede ser aceptada si está
bien razonada y/o explicada en los comentarios. Así que, insisto, cuéntame BIEN qué es lo que quieres que cambie.

#### b) Cambiar tú mismo los apuntes
[Fork](https://help.github.com/es/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork)
