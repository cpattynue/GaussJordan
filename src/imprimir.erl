-module(imprimir).
-export([pass/2]).
pass([],_N) ->
    [];
pass([H|T],N) ->
    P1=part1(H,N),
    P2=part2(H,N),
    [[P1|P2]|pass(T,N)].
part1([H|T],N) when N/=1  ->
   [H|part1(T,N-1)];

part1([_H|_T],_N)  ->
   [].

part2([H|_T],N) when N =:= 1->
    H;

part2([_H|T],N) ->
    part2(T,N-1).

