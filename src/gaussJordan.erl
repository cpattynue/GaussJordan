-module(gaussJordan).
-export([verificar/1]).
-import(verifica).
-import(gauss3).
-import(imprimir).
verificar(L) ->
    valida(verifica:contar(L),L).

valida(N,_L) when N =:= false->
    io:format("La matriz no es valida~n");

valida(N,L) ->
    imprimir:pass(gauss3:convert(L),N).
