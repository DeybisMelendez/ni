#!/bin/#!/bin/sh
luastatic main.lua /usr/lib/x86_64-linux-gnu/liblua5.1.a -I/usr/include/lua5.1
CC=x86_64-w64-mingw32-gcc luastatic main.lua /usr/x86_64-w64-mingw32/lib/liblua5.1.a -I/usr/x86_64-w64-mingw32/include/lua5.1/
rm main.luastatic.c
