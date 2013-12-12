-module(verifica).
-export([contar/1]).

contar(L) ->
    contarElementos(L,0,contarLista(L,0)+1,[]).
contarLista([],N) ->
    N;
contarLista([_H|T],N) ->
    contarLista(T,N+1).

contarElementos([],_Ne,Nl,_T) ->
    Nl;
contarElementos([H|T],Ne,Nl,_T2) ->
    contarElementos2(H,Ne,Nl,T).

contarElementos2([],Ne,Ne,T2)->
    contarElementos(T2,0,Ne,T2);
contarElementos2([],_Ne,_Nl,_T2)->
    false;
contarElementos2([_H|T],Ne,Nl,T2)->
    contarElementos2(T,Ne+1,Nl,T2).

    
    
