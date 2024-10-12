# Lab 1
## Sąlyga
Duomenų bazėje saugomi duomenys apie asmenis ir jų giminystės ryšius faktais:
- asmuo(Vardas, Lytis, Amžius, Pomėgis);
- mama(Mama, Vaikas);
- pora(Vyras, Žmona).

Kad būtų paprasčiau, faktų aibė sudaroma atsižvelgiant į šias prielaidas:
- Kiekvienas asmuo vienareikšmiškai identifikuojamas vardu;
- Kiekvienoje šeimoje vaikai skirtingo amžiaus;
- Kiekvieno vaiko tėtis yra jo mamos vyras;
- Jeigu vaikas turi mamą, tai jis būtinai turi ir tėtį ir atvirkščiai;

### Apibrėžkite predikatus:
1. dukra(Dukra, TevasMama) - Pirmasis asmuo (Dukra) yra antrojo (TevasMama) dukra;
2. anukas(Anukas, SenelisSenele) - Pirmasis asmuo (Anukas) yra antrojo (SenelisSenele) anūkas (bet ne anūkė!);
3. bendraamziai(Asmuo1, Asmuo2) - Asmenys Asmuo1 ir Asmuo2 yra vienodo amžiaus;
4. vunderkindas(Kudikis) - Asmuo Kudikis „dar kūdikis, o jau groja (mėgsta groti) smuiku“;

# Lab 2
## Sąlyga
Duomenų bazėje saugomi duomenys apie studentus faktais: studentas(Vardas, Kursas); yraVyresnis(StudentoVardas1, StudentoVardas2).\
Sąryšis „būti vyresniu“ yra tranzityvus, todėl į faktų aibę neįtraukiami tie faktai, kurie seka iš tranzityvumo sąryšio. Tai reiškia, kad, jeigu Jonas vyresnis už Miglę, o Miglė už Ritą, tai faktų aibėje yra predikatai yraVyresnis(jonas, migle) ir yraVyresnis(migle, rita), bet nėra predikato yraVyresnis(jonas, rita). Taip pat sąryšis „būti vyresniu“ yra pilnai sutvarkantis studentų aibę. Tai reiškia, kad, kokius bepaimsime du skirtingus studentus Studentas1 ir Studentas2, arba Studentas1 bus vyresnis už Studentas2, arba Studentas2 bus vyresnis už Studentas1. Taigi, pavyzdžiui, tokia faktų aibė yra negalima: yraVyresnis(jonas, migle), yraVyresnis(migle, rita), yraVyresnis(jonas, tadas) ir yraVyresnis(tadas, rita). 
### Apibrėžkite predikatą:
„studentas A yra jaunesnis už kito kurso studentą B“.
## Sąlyga
Duotas natūrinis skaičius N.
### Naudodami rekursyvųjį algoritmą, raskite:
N-ąjį Pelo skaičių. Pavyzdžiui:
?- pell(10,Pel).

Pel = 2378.

# Lab 3
## Sąlyga
Apibrėžkite paskirtus keturis predikatus pagal nurodytas sąlygas. Nors kai kurių užduočių formulavimas yra procedūrinis, reikia siekti, kiek įmanoma, deklaratyvios programos. Nenaudokite Prolog darbo su sąrašais predikatų. Pasiaiškinkite, kaip taikomas atkirtos (!) operatorius ir kur jį galima būtų panaudoti Jūsų predikatuose.
### Paprasti predikatai su sveikųjų skaičių sąrašais
knelyg(S,K) - skaičių sąrašo S nelyginių elementų kiekis yra K. Pavyzdžiui:
?- knelyg([1,8,3,7,5,2],K).
K = 4.

### Paprasti nearitmetiniai predikatai:
pirmieji(S,K,R) - sąrašas R - pirmųjų K duoto sąrašo S elementų sąrašas. Pavyzdžiui:
?- pirmieji([a,b,c,d,e],3,R).
R = [a,b,c].

### Sudėtingesni predikatai:
nesikartoja(S,R) - sąrašas R gaunamas iš duotojo sąrašo S pašalinus pasikartojančius elementus. Pavyzdžiui:
?- nesikartoja([a,b,a,d],R).
R = [a,b,d].

### Operacijos su natūraliaisiais skaičiais, išreikštais skaitmenų sąrašais. Skaitmenų sąrašo elementai turi būti natūralūs skaičiai nuo 0 iki 9 (ne simboliai '0', '1',...). Nenaudokite Prolog konvertavimo tarp sąrašo ir skaičiaus predikatų (number_chars/2, number_codes/2 ir kt...):
i_sesiolik(Des,Ses) - Des yra skaičius vaizduojami dešimtainių skaitmenų sąrašu. Ses - tas pats skaičiaus, vaizduojamas šešioliktainių skaitmenų sąrašu. Pavyzdžiui:
?- i_sesiolik([1,9,8,5],Ses).

Ses = [7,c,1].
