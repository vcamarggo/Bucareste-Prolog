﻿vizinhos(arad, [d(sibiu,140), d(timisoara,118), d(zerind,75)]).
vizinhos(bucharest, [d(fagaras,211), d(giurgiu,90), d(pitesti,101), d(urziceni,85)]).
vizinhos(craiova, [d(dobreta,120), d(pitesti,138), d(rimnicu_vilcea,146)]).
vizinhos(dobreta, [d(mehadia,75), d(craiova,120)]).
vizinhos(eforie, [d(hirsova,86)]).
vizinhos(fagaras, [d(bucharest,211), d(sibiu,99)]).
vizinhos(giurgiu, [d(bucharest,90)]).
vizinhos(hirsova, [d(eforie,86), d(urziceni, 98)]).
vizinhos(iasi, [d(neamt, 87), d(vaslui, 92)]).
vizinhos(lugoj, [d(mehadia, 70), d(timisoara, 111)]).
vizinhos(mehadia, [d(dobreta, 75), d(lugoj, 70)]).
vizinhos(neamt, [d(iasi, 87)]).
vizinhos(oradea, [d(sibiu, 151), d(zerind, 71)]).
vizinhos(pitesti, [d(rimnicu_vilcea, 97), d(craiova, 138), d(bucharest, 101)]).
vizinhos(rimnicu_vilcea, [d(sibiu, 80), d(pitesti, 97), d(craiova, 146)]).
vizinhos(sibiu, [d(oradea, 151), d(arad, 140), d(fagaras, 99), d(rimnicu_vilcea, 80)]).
vizinhos(timisoara, [d(arad, 118), d(lugoj, 111)]).
vizinhos(urziceni, [d(bucharest, 85), d(hirsova, 98), d(vaslui, 142)]).
vizinhos(vaslui, [d(iasi, 92), d(urziceni, 142)]).
vizinhos(zerind, [d(oradea, 71), d(arad, 75)]).

heuristica(arad, 366).
heuristica(bucharest, 0).
heuristica(craiova, 160).
heuristica(dobreta, 238).
heuristica(eforie, 161).
heuristica(fagaras, 178).
heuristica(giurgiu, 77).
heuristica(hirsova, 151).
heuristica(iasi, 226).
heuristica(lugoj, 244).
heuristica(mehadia, 241).
heuristica(neamt, 234).
heuristica(oradea, 380).
heuristica(pitesti, 98).
heuristica(rimnicu_vilcea, 193).
heuristica(sibiu, 253).
heuristica(timisoara, 329).
heuristica(urziceni, 80).
heuristica(vaslui, 199).
heuristica(zerind, 374).

%% melhor_caminho(?O, ?C) is nondet
% Verdadeiro se C é o melhor caminho entre O e bucharest
% Exemplo:
%  ?- melhor_caminho(sibiu, C).
%  C = [sibiu, rimnicu_vilcea, pitesti, bucharest].
melhor_caminho(bucharest, [bucharest]) :- !.
melhor_caminho(O, [O|Cs]) :-
	melhor_vizinho(O, V), !,
	melhor_caminho(V, Cs).

%% melhor_vizinho(?O, ?V) is nondet
% Verdadeiro se V é o melhor vizinho de O
% Exemplo:
%  ?- melhor_vizinho(sibiu, V).
%  V = rimnicu_vilcea.
melhor_vizinho(O, Z) :-
	vizinhos(O,B),
	list_min(B,L),
	A = d(Z,L),
	member(A,B), !.


%list_min( L, Min) is
% Verdadeiro se Min é o mínimo da lista L, tal que L é uma lista de
% distancias de estruturas d(Cidade,Distancia)
%Exemplo
%?- list_min([1, 2, 3], Min).
%Min = 1.
list_min([L|Ls], Min) :-
    d(_,X) = L,
    list_min(Ls, X, Min).

list_min([], Min, Min).

list_min([L|Ls], Min0, Min) :-
    d(_,X) = L,
    Min1 is min(X, Min0),
    list_min(Ls, Min1, Min).


