% Deniza Alijeva, 4 kursas, 4 grupė, variantai: 3; 16; 29; 37

/* faktų rinkinys */
asmuo(juozapas, vyras, 78, begimas).
asmuo(jelena, moteris, 78, skaitymas).
asmuo(jonas, vyras, 50, krepsinis).
asmuo(lijana, moteris, 49, smuikas).
asmuo(lija, moteris, 1, verkimas).
asmuo(juozas, vyras, 18, zaidimai).
asmuo(emilija, moteris, 15, piesimas).
asmuo(tesa, moteris, 1, smuikas).
asmuo(kasparas, vyras, 69, miegas).
asmuo(alisa, moteris, 68, mezgimas).
asmuo(tadas, vyras, 37, futbolas).
asmuo(lina, moteris, 37, kepimas).
asmuo(tomas, vyras, 1, verkimas).

mama(lijana, juozas).
mama(lijana, emilija).
mama(lijana, tesa).
mama(alisa, tadas).
mama(alisa, lijana).
mama(lina, tomas).
mama(jelena, jonas).

pora(juozapas, jelena).
pora(jonas, lijana).
pora(kasparas, alisa).
pora(tadas, lina).

/* predikatai */

/* mamos dukra */
dukra(Dukra, TevasMama) :- 
  asmuo(Dukra, moteris, _, _),
  mama(TevasMama, Dukra),
  pora(Tevas, TevasMama),
  asmuo(Tevas, vyras, _, _).

/* tėvo dukra */
dukra(Dukra, TevasMama) :- 
  asmuo(Dukra, moteris, _, _),
  pora(TevasMama, Zmona),
  mama(Zmona, Dukra).

/* anūkas iš dukros | mamos pusės */
anukas(Anukas, SenelisSenele) :-
  asmuo(Anukas, _, _, _),
  mama(Mama, Anukas),
  dukra(Mama, SenelisSenele).

/* anūkas iš sūnaus | tėvo pusės */
anukas(Anukas, SenelisSenele) :-
  asmuo(Anukas, _, _, _),
  mama(Mama, Anukas),
  pora(Tevas, Mama),
  (mama(SenelisSenele, Tevas); mama(Senele, Tevas), pora(SenelisSenele, Senele)).

bendraamziai(Asmuo1, Asmuo2) :-
asmuo(Asmuo1, _, Amzius1, _),
asmuo(Asmuo2, _, Amzius2, _),
Amzius1 =:= Amzius2,
Asmuo1 \== Asmuo2.

vunderkindas(Kudikis) :-
asmuo(Kudikis, _, Amzius, Pomegis),
Amzius < 2,
Pomegis = smuikas.



/*
true užklausos

dukra(emilija, lijana).
dukra(lijana, alisa).

anukas(juozas, juozapas).
anukas(tomas, alisa).
anukas(juozas, kasparas).

bendraamziai(jelena, juozapas).
bendraamziai(tesa, tomas).

vunderkindas(tesa).
--------------------
false užklausos

dukra(juozas, lijana).
dukra(emilija, jelena).

anukas(juozas,  jonas).
anukas(jonas, juozapas).
anukas(tadas, alisa).

bendraamziai(lina, lijana).
bendraamziai(kasparas, tomas).

vunderkindas(lijana).
vunderkindas(tomas).
*/
