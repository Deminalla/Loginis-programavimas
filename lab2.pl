% Deniza Alijeva, 4 kursas, 4 grupė, variantai: 2.4; 4.3

% 2.4
/* faktų rinkinys */
studentas(nojus, 4).
studentas(monika, 3).
studentas(povilas, 4).
studentas(austeja, 2). 
studentas(gabriele, 3).
studentas(ieva, 2).
studentas(emilis, 1).
studentas(benas, 1).

yraVyresnis(nojus, monika).
yraVyresnis(monika, povilas).
yraVyresnis(povilas, austeja).
yraVyresnis(austeja, gabriele).
yraVyresnis(gabriele, ieva).
yraVyresnis(ieva, emilis).
yraVyresnis(emilis, benas).


/* predikatai */
yraVyresnisTranz(Studentas1, Studentas2) :-
    yraVyresnis(Studentas1, Studentas2).

yraVyresnisTranz(Studentas1, Studentas2) :-
    yraVyresnis(Studentas1, TarpinisStudentas),
    yraVyresnisTranz(TarpinisStudentas, Studentas2).

/* studentas1 yra jaunesnis už kito kurso studentą2 */
yraJaunesnis(Studentas1, Studentas2) :-
    studentas(Studentas1, Kursas1),
    studentas(Studentas2, Kursas2),
    Kursas1 \= Kursas2,
    yraVyresnisTranz(Studentas2, Studentas1).

/* 
true užklausos

yraJaunesnis(benas, ieva).
yraJaunesnis(benas, austeja).
yraJaunesnis(gabriele, nojus).

false užklausos

yraJaunesnis(benas, emilis).
yraJaunesnis(nojus, austeja).
yraJaunesnis(gabriele, monika).
*/

%.  % antras kintamasis tai yra rezultatas, kuris grazinamas
pell(1, 1).
pell(0, 0).

pell(N, Pel) :- 
    N > 1,
    N1 is N-1,  % minus
    N2 is N-2,  
    pell(N1, Pel1),
    pell(N2, Pel2),
    Pel is 2 * Pel1 + Pel2.

/*
uzklausos
pell(5, Pel).
pell(10, Pel).
pell(3, Pel)
*/
