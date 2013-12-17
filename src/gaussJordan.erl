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
    print(gauss3:convert(L),N).

print([],_N) ->
    io:format("La matriz no es valida~n");

print(L,N) ->
    imprimir:pass(L,N).
