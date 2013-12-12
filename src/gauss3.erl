-module(gauss3).
-export([convert/1]).

convert(L) ->
    convertOne(L,0,0,L).

convertOne([],_C,_Cp,L) ->
    L;

convertOne([H|_T],C,C,L) ->
    P=foundPivot(H,C),
    LineaPivote= pivot(H,P,C),
    Total=replace(L,LineaPivote,C,0),
    Pass=convertZeroPass(LineaPivote,Total,C),
    convertOne(Pass,C+1,0,Pass);

convertOne([_H|T],C,Cp,L) ->
    convertOne(T,C,Cp+1,L).

foundPivot([H|_T],0)->
    H;
foundPivot([_H|T],C) ->
    foundPivot(T,C-1).

pivot(L,P,_C) ->
    [ X/P || X<- L].

replace([],_Ln,_P,_C)->
    [];
replace([_H|T],Ln,P,P) ->
    [Ln|replace(T,Ln,P,P+1)];

replace([H|T],Ln,P,C) ->
    [H|replace(T,Ln,P,C+1)].

firstElement([H|_T],C,C)->
   H;
firstElement([_H|T],B,C) ->
    firstElement(T,B,C+1).

convertZeroPass(Lp,Lb,C) ->
    convertZero(Lp,Lb,Lb,0,C).

convertZero(_L,[],Lb,_C,_B) ->
    Lb;
convertZero(L,[L|T],Lb,C,B)->
    convertZero(L,T,Lb,C+1,B);
 
convertZero(L,[H|T],Lb,C,B) ->
    F=firstElement(H,B,0),
    Fe= compare(F),
    New=newRow(L,Fe),
    New2=createNewRow(New,H),
    Acc=replace(Lb,New2,C,0),
    convertZero(L,T,Acc,C+1,B).
newRow(L,Fe) ->
    [X * Fe || X<-L]. 
    
createNewRow([],[]) ->
    [];
createNewRow([H1|T1],[H2|T2]) ->
    [H1+H2|createNewRow(T1,T2)].

compare(F) when F<0 ->
   -(F);
compare(F) ->  
    -F.
    




