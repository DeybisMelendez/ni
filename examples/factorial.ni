/ Creditos al usuario de Discord Jjony#5227
/ Devuelve el factorial de 1 dígito
@ / Ingreso de digito
>#30{<->} /transforma digito ASCII a entero
#01 / caso base 0!
< / regresa a la primer celda

( / si la primer celda no es cero
? / copia el valor
>= / lo guarda en la siguiente celda

[ / calcula el factorial
<- / decrementa en 1
(
>
{<{>+<}>-} / multiplicacion de la celda con la anterior
)
]
)
$0001.
