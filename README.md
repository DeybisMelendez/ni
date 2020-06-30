# Ni

<img src="https://raw.githubusercontent.com/DeybisMelendez/ni/master/logo.jpg" width="300"/>

Spanish description in: https://github.com/DeybisMelendez/ni/blob/master/README-es.md

## ¿What is Ni?

Ni is an esoteric programming language influenced by brainfuck. The name Ni comes from Nicaragua.

## Language Overview

Like brainfuck, Ni operates on a tape containing cells, cells can store 64-bit integers.

The cells are pointed by a head, the head can move from left to right or jump to a cell directly.

There is also a clipboard where you can store data from one cell and insert any other.

## Instructions

|Instruction|Description |
|-----------|------------|
|>          |Move the head to the right|
|<          |Move the head to the left|
|+          |Increment the targeted cell|
|-          |Decrement the targeted cell|
|@          |Reads the first character, converts it to its ASCII number and stores it in the pointed cell|
|.          |Print the number stored in the targeted cell|
|!          |Print the ASCII equivalent of the number stored in the pointed cell |
|#          |Set a hexadecimal number in the pointed cell|
|?          |Copy the number of the pointed cell|
|=          |Stores the copied number in the pointed cell|
|*          |Converts the number of the pointed cell to 0|
|$          |Moves the spindle to the cell indicated with a hexadecimal number |
|[]         |(While) Loop that continues execution if the pointed cell is not equal to 0 |
|{}         |(For) Loop that executes the instructions the number of times that the memory of the pointed cell indicates|
|()         |(if) Executes the set of instructions if the pointed number is equal to the clipboard|
|/          |Ignore the rest of the line|

## How to run

Download Ni here: https://github.com/DeybisMelendez/ni/releases

### Windows

CMD ->  **ni yourcode.ni**

### Linux

Terminal -> **./ni yourcode.ni**

### Lua 5.2

CMD or Terminal -> **lua main.lua yourcode.ni**

## Examples

### Hello World!

#48!#65!#6c!#6c!#6f!#20!#57!#6f!#72!#6c!#64!#21!#0a!

### Cat

#01[@!#0a!]

More in *examples/*.

## Send examples

The main purpose of programming in Ni is fun, the challenge of creating a program that works, these programs are collected in the *examples/* folder.

You can send pull requests if you write one, send it as an issue or Discord to add it.

There are a number of popular problems to solve and show the ability of an esoteric programming language, the list is here: https://esolangs.org/wiki/Popular_problem

The main problems to solve are:

- Program that calculates the factorial of a digit. (added by Discord user Jjony # 5227)
- Program that prints the sequence of [Thue-Morse] (https://es.wikipedia.org/wiki/Sucesi%C3%B3n_de_Thue-Morse) or any other known sequence.
- Program that prints the [Sierpinski Triangle] (https://es.wikipedia.org/wiki/Tri%C3%A1ngulo_de_Sierpinski).
- Program that [Quine] does (https://es.wikipedia.org/wiki/Quine_ (program)).

Also, I add these:

- Program that executes the [Game of life] (https://es.wikipedia.org/wiki/Juego_de_la_vida).
- Program that runs the [Langton Ant] (https://es.wikipedia.org/wiki/Hangiga_de_Langton).

## Discord

https://discord.gg/dxYxZs5
