% Deniza Alijeva, 4 kursas, 4 grupė, variantai: 1.9; 2.4; 3.3; 4.3

% 1.9 
% the amount of odd numbers in a list
knelyg([], 0).

knelyg([Head|Tail], K) :-
    Head mod 2 =:= 1,   % If the head of the list is odd
    knelyg(Tail, K1),   % Recursively process the tail
    K is K1 + 1.     % Increment the count

knelyg([Head|Tail], K) :-
    Head mod 2 =:= 0,   % If the head of the list is even
    knelyg(Tail, K).    % Process the tail without incrementing the count

/*
uzklausos

knelyg([1,8,3,7,5,2], K).
4

knelyg([8,6,2], K).
0

knelyg([69,110,2], K).
1

knelyg([1,1,3,3,3,2], K).
5
*/


% 2.4 
% the first K amount of elements from the list
pirmieji(_, 0, []). % if K is 0, the result is empty list
pirmieji([], _, []). % given empty list results in empty list regardless of K

pirmieji([Head|Tail], K, [Head|R]) :-
    K > 0,
    K_size is K - 1,            % Decrement K
    pirmieji(Tail, K_size, R).  % Recursively take elements from the tail

/*
uzklausos

pirmieji([a,b,c,d,e],3,R).
[a,b,c]

pirmieji([a,5,c,8],2,R). 
[a,5]

pirmieji([a,5,c,8],0,R). 
[]

pirmieji([c,d],5,R). 
[c,d]

pirmieji([a,b],-1,R). 
false
*/

% 3.3
% result is list of unique elements (by remomving repeating stuff)

% check if element is in list (instead of member function)
yra_sarase(Element, [Element|_]). % true, if the element matches the first element in list
yra_sarase(Element, [_|Tail]) :- 
    yra_sarase(Element, Tail). % check the rest of the list recursively

istrinti(_,[],[]). % if list is empty, return empty list (regardless of head)
% ?????????
istrinti(Element, [Element|Tail], FilteredTail):- 
    istrinti(Element, Tail, FilteredTail). % if the repeating element is the first in the list, then we skip it and continue
istrinti(Element, [Head|Tail], [Head|FilteredTail]) :- 
    istrinti(Element, Tail, FilteredTail). % if the repeating element isnt the first in the list, 
% then keep it and continue deletion search with the tail
% ???????????????

nesikartoja([],[]).

nesikartoja([Head|Tail], [Head|FilteredTail]) :- 
    yra_sarase(Head, Tail),!, %
    istrinti(Head, Tail, R1), % if Head element repeats in Tail, then its removed from all the places and only then we move on with recursion
    nesikartoja(R1, FilteredTail). 

nesikartoja([Head|Tail], [Head|FilteredTail]):-
    nesikartoja(Tail, FilteredTail).


% dar variantas kaip butu galima padaryti
set([], []).
% Put the head in the result,
% remove all occurrences of the head from the tail,
% make a set out of that.
set([H|T], [H|T1]) :- 
    remv(H, T, T2),
    set(T2, T1).
% Removing anything from an empty list yields an empty list.
remv(_, [], []).
% If the head is the element we want to remove,
% do not keep the head and
% remove the element from the tail to get the new list.
remv(X, [X|T], T1) :- remv(X, T, T1).
% If the head is NOT the element we want to remove,
% keep the head and
% remove the element from the tail to get the new tail.
remv(X, [H|T], [H|T1]) :-
    X \= H,
    remv(X, T, T1).

/*
uzklausos

nesikartoja([a,b,a,d],R).
[a,b,d]

nesikartoja([a,a,a,a,a],R).
[a]

nesikartoja([1,2,11,a,2,c],R).
[1,2,11,a,c]
*/

% 4.3
% decimal to hexadecimal
% its a list of numbers but is one decimal, so [1,9,8,5] is 1985 that needs to be converted to hex

i_sesiolik(Des, Ses) :- 
    desimtainis_i_skaiciu(Des, Number), 
    sesioliktainis(Number, SesReversed),
    apversti(SesReversed, [], Ses).

% list of ints to number
desimtainis_i_skaiciu([Des], Des). % if 1 element in list

desimtainis_i_skaiciu([Head|Tail], Number) :-
    desimtainis_i_skaiciu(Tail, NewTail), % will call until it goes down to 1 element
    indeksas(Tail, Index),
    Number is Head * 10^Index + NewTail,
    Number > 0.

indeksas([], 0).
indeksas([_|Tail], Index) :- 
    indeksas(Tail, Index1), 
    Index is Index1 + 1.

sesioliktainis(0, []) :- !.
sesioliktainis(Number, [Head|Tail]) :-
    Remainder is Number mod 16, % liekana
    sesioliktainis_skaitmuo(Remainder, Head),
    N1 is Number // 16, % dalyba, bet rezultatas be kablelio
    sesioliktainis(N1, Tail).

sesioliktainis_skaitmuo(Number, Number) :- 
    Number < 10, !.
sesioliktainis_skaitmuo(10, a) :- !.
sesioliktainis_skaitmuo(11, b) :- !.
sesioliktainis_skaitmuo(12, c) :- !.
sesioliktainis_skaitmuo(13, d) :- !.
sesioliktainis_skaitmuo(14, e) :- !.
sesioliktainis_skaitmuo(15, f) :- !.

apversti([], SesReversed, SesReversed).

apversti([Head|Tail], Accumulator, SesReversed) :- 
    apversti(Tail, [Head|Accumulator], SesReversed). % kadangi iskvieciam su tail, gaunasi kiekviena kart i pradzia dedam tail elementa

/* 
apversti([9, 3],[],_740)
apversti([3],[9],_740)
apversti([],[3, 9],_740)
*/

/*
uzklausos
i_sesiolik([1,9,8,5],Ses).
[7,c,1]

i_sesiolik([3, 3, 3],Ses).
[1, 4, d]

i_sesiolik([1, 1, 1],Ses).
[6, f]

i_sesiolik([5,7],Ses).
[3,9]

i_sesiolik([3,7,8,2,1],Ses).
[9, 3, b, d]
*/