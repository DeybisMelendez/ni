# Ni

<img src="https://raw.githubusercontent.com/DeybisMelendez/ni/master/logo.jpg" width="300"/>

## ¿Qué es Ni?
Ni es un lenguaje de programación esotérico escrito en Lua influenciado por Brainfuck. El nombre Ni viene de Nicaragua.

## ¿Cómo funciona?

Al igual que Brainfuck, Ni opera en una cinta que contiene celdas, las celdas pueden almacenar enteros de 64 bits.

Las celdas están señaladas por un cabezal, el cabezal puede moverse de izquierda a derecha o saltar directamente a una celda.

También hay un portapapeles donde puede almacenar datos de una celda e insertarla en cualquier otra.

## Instrucciones

|Instrucción|Descripción |
|-----------|------------|
|>          |Mueve el cabezal a la derecha |
|<          |Mueve el cabezal a la izquierda|
|+          |Suma 1 al número de la celda apuntada|
|-          |Resta 1 al número de la celda apuntada|
|@          |Lee el primer caracter, lo convierte a su número ASCII y lo almacena en la celda apuntada|
|.          |Imprime en pantalla el número almacenado en la celda apuntada|
|!          |Imprime en pantalla el equivalente ASCII del número almacenado en la celda apuntada|
|#          |Establece un número hexadecimal en la celda apuntada|
|?          |Copia el número de la celda apuntada|
|=          |Almacena el número copiado en la celda apuntada|
|*          |Convierte a 0 el número de la celda apuntada|
|$          |Mueve el cabezal hacia la celda que se indique con un número hexadecimal|
|[]         |(While) Bucle que continua ejecución si la celda apuntada no es igual a 0|
|{}         |(For) Bucle que ejecuta las instrucciones el número de veces que indica la memoria de la celda apuntada|
|()         |(if) Ejecuta el conjunto de instrucciones si el número apuntado es igual al portapapeles|
|/          |Ignora el resto de la línea|

## Como ejecutar

Descarga Ni aquí: https://github.com/DeybisMelendez/ni/releases

### Windows

CMD ->  **ni yourcode.nic**

### Linux

Terminal -> **./ni tucodigo.nic**

### Mac

Lua es requerido, puedes instalar Lua con [brew](https://brew.sh/).

Comandos:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

`brew update`

`brew install lua`

Entonces puedes ejecutar **lua ni.lua tucodigo.nic**

### Lua

CMD o Terminal -> **lua ni.lua tucodigo.nic**

## Ejemplos

### Hola Mundo!

#48!#6f!#6c!#61!#20!#4d!#75!#6e!#64!#6f!#21!#0a!

### Cat

#01[@!#0a!]

Hay mas ejemplos en la carpeta *examples/*.

## Envía ejemplos

El objetivo principal de programar en Ni es la diversión, el desafío de crear un programa que funcione, en la carpeta *examples* se recopilan estos programas.

Puedes enviar pull requests si escribes uno, enviarlo como un issue o en Discord para añadirlo.

Hay una serie de problemas populares para resolver y mostrar la capacidad de un lenguaje de programación esotérico, la lista está aquí: https://esolangs.org/wiki/Popular_problem

Los principales problemas a resolver son:

- Programa que calcule el factorial de un dígito. (agregado por usuario de Discord Jjony#5227, falla en versiones >=0.2.1)
- Programa que imprima la sucesión de [Thue-Morse](https://es.wikipedia.org/wiki/Sucesi%C3%B3n_de_Thue-Morse) o cualquier otra sucesión conocida.
- Programa que imprima el [Triangulo de Sierpinski](https://es.wikipedia.org/wiki/Tri%C3%A1ngulo_de_Sierpinski).
- Programa que haga [Quine](https://es.wikipedia.org/wiki/Quine_(programa)).

Además, añado estos:

- Programa que ejecute el [Juego de la vida](https://es.wikipedia.org/wiki/Juego_de_la_vida).
- Programa que ejecute la [Hormiga de Langton](https://es.wikipedia.org/wiki/Hormiga_de_Langton).

## Discord

https://discord.gg/dxYxZs5
