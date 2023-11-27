% Ve VSC => Load document => cislice(0). => true. // cislice(a). => false.
% cislice(objekt, ktery bude cislici).
% AND operator => ,
% OR operator => ;
% NOT operator => \+     // opak pozitivniho
% Deleni => /
% Celociselne deleni => //
% Mensi\Vetsi nebo rovno => >= // =<
% Promenne => Velke pismena // cislice(C).

% A = 1 + 2. => A = 1+2.
% 3 = 1 + 2. => false.
% 2 + 1 = 1 + 2. => false.
% 2 + 1 = 2 + 1. => true.
% p(A,2,3) = p(1,2,B). => A = 1, B = 3.

% A is 1 + 2. => A = 3.
% 3 is 1 + 2. => true.

% t1 =:= t2 (splneno pokud se rovnaji)
% t1 =\= t2 (opak)
% 1 + 2 =:= 2 + 1. => true.
% A =:= 3. => error
% A = 1 + 2, A =:= 3. => A = 1 + 2.

% t1 == t2 => splneno pokud term t1 je shodný s term t2 // prisne porovnavani
% t1 \== t2 => opak
% A == A. => true.
% A == B. => false.
% A = B, A == B. => A = B // true // promenna A se rovna promenna B, NE HODNOTA!
% A == 1 + 2. => false.
% 1 + 2 == 2 + 1. => false.

% Vetsi nez 5
% cislice(A), A > 5.

% Variace s podminkou na cislice
% cislice(A), cislice(B), A < B.

% Variace aby tri cisla nebyly stejne
% cislice(A), cislice(B), cislice(C),  A \= B, A \= C, B \= C.

% Program.

cislice(0).
cislice(1).
cislice(2).
cislice(3).
cislice(4).
cislice(5).
cislice(6).
cislice(7).
cislice(8).
cislice(9).

% N:\Ukazky\Karel.Maly\prolog\rodina.pdf

% zeny
zena(romana).
zena(sylva).
zena(sarka).
zena(vera).
zena(petra).
zena(julie).
zena(iveta).
zena(michala).
zena(jana).
zena(anna).

% muzi
muz(franta).
muz(jan).
muz(karel).
muz(petr).
muz(tomas).
muz(hektor).
muz(jiri).
muz(josef).

% rodice
% leva vetev
rodice(karel, jana, michala).
rodice(karel, jana, jan).

rodice(jan, sarka, franta).
rodice(jan, sarka, tomas).

% franta
rodice(franta, sylva, romana).
% tomas
rodice(tomas, petra, vera).

% prava vetev
rodice(josef, michala, anna).
rodice(josef, michala, iveta).
% anna
rodice(jiri, anna, hektor).
% iveta
rodice(petr, iveta, julie).

% rodic(Rodic, Potomek).
% rodice(karel, jan). => true.

% rodice(Rodic, Potomek) :- rodice(Rodic,_,Potomek); rodice(_, Rodic, Potomek).

% ekvivalence

% rodice(Rodic, jan). => Rodic = karel; Rodic = jana.
rodice(Rodic, Potomek) :- rodice(Rodic,_,Potomek).
rodice(Rodic, Potomek) :- rodice(_, Rodic, Potomek).

% potomci
% rodice(karel,Potomek).

% otec(Otec, Potomek). => Vsichni otci a jejich potomci
% otec(karel, Potomek). => Potomci Karla
otec(Otec, Potomek) :- muz(Otec), rodice(Otec, Potomek).
% to stejne pro matku
matka(Matka, Potomek) :- zena(Matka), rodice(Matka, Potomek).
% syn
syn(Syn, Rodic) :- muz(Syn), rodice(Rodic, Syn).
% dcera
dcera(Dcera, Rodic) :- zena(Dcera), rodice(Rodic, Dcera).
% sourozenec(S1, S2).
% musi byt stejni rodice pro oba potomky a nesmi se rovnat
% sourozenec(jan, S2). => S2 = michala
sourozenec(S1, S2) :- rodice(Otec, Matka, S1), rodice(Otec, Matka, S2), S1 \= S2.
% predek(Predek, Osoba).
% rekurze...
% predek(Predek, romana). // vypis predku
predek(Predek, Osoba) :- rodice(Predek, Osoba).
predek(Predek, Osoba) :- rodice(Rodic, Osoba), predek(Predek, Rodic).
% potomci =>
% predek(karel, Potomek).
% nebo...
potomek(Potomek, Predek) :- predek(Predek, Potomek).

% \+ muz(A). // zadny muzi v databazi nejsou? => false.
% \+ \+ muz(A). // negace negace... vraci true.

% osoba(A), \+ muz(A). => vypise vsechny osoby, co nejsou muzi
osoba(A) :- muz(A); zena(A).
% osoba pro kterou plati, ze neni muz
neni_muz(A) :- osoba(A), \+ muz(A).

% write(ahoj). => vypise ahoj true.
% write(ahoj), nl. => odradkovani
% A = ahoj, write(A). => ahoj
% write(A), nl. => neco random
% read(A). => ceka co napisu // vstup... ! i vstup je ukončen tečkou
% read(ahoj). => vstup ahoj. => true.
% read(ahoj). => vstup nazdar. => false.

% Uloha nalezeni predku zadane osoby.
% vypise jen jednoho predka
% doplnime predikat, ktery nebude nikdy splnen => fail => vypise vsechny.
vypsani_predku :- write('Zadejte jmeno osoby:'), nl, read(Osoba), predek(Predek, Osoba), write('Nalezeny predek: '), write(Predek), nl, fail.
% aby konec byl true
vypsani_predku.

% vypsani muzu
% muz(A), write(A), nl, fail.

% aritmeticky prumer
aritmeticky_prumer :- 
    write('Zadejte dve hodnoty pro aritmeticky prumer:'), 
    nl, 
    read(PHodnota), 
    read(DHodnota), 
    Prumer is (PHodnota + DHodnota) / 2,
    write('Aritmeticky prumer je: '), 
    write(Prumer), 
    nl.

% faktorial
% vztah mezi hodnotou N a faktorialem cisla
% faktorial (N, !N)
% faktorial(5, F) => F = 120.
faktorial(0, 1).
faktorial(N, F) :- 
    N > 0,
    N1 is N - 1,
    faktorial(N1, F1),
    F is N * F1.

% N:\Ukazky\Karel.Maly\prolog\trojuhelnik.pdf

trojuhelnik(A,B,C,D,E,F) :-
    cislice(A),
    cislice(B),
    cislice(C),
    cislice(D),
    cislice(E),
    cislice(F),

    A \= B,
    A \= C,
    A \= D,
    A \= E,
    A \= F,

    B \= C,   
    B \= D,
    B \= E,
    B \= F,
   
    C \= D,
    C \= E,
    C \= F,

    D \= E,
    D \= F,

    E \= F,

    A + B + C =:= C + D + E,
    C + D + E =:= A + E + F.

vypis_trojuhelnik :-
    trojuhelnik(A,B,C,D,E,F),
    write(A:B:C:D:E:F),
    nl,
    fail.
vypis_trojuhelnik.

% SEZNAMY.
% [1,2,3,4] = [Hlava|Telo].
% Hlava = 1
% Telo = [2,3,4]

% [1] = [Hlava|Telo].
% Hlava = 1
% Telo = []

% Spojeni seznamu
% S = [1,2,3,4], S2 = [0|S]
% S = [1,2,3,4] ,
% S2 = [0,1,2,3,4]

% [1,2,3,4] = [A,B,C|T].
% A = 1, B = 2, C = 3, T = [4]

% Vypsani hlavy a tela seznamu
% vypis_hlavu_a_telo(Seznam).
vypis_hlavu_a_telo([Hlava|Zbytek]) :-
    write('Hlava seznamu: '), write(Hlava), nl,
    write('Telo seznamu: '), write(Zbytek).
% Hlava seznamu: 1
% Telo seznamu: [2,3,4,5,6,7]
% vypis_hlavu_a_telo([1]).
% Hlava seznamu: 1
% Telo seznamu: []
% vypis_hlavu_a_telo([]).
% false.

% prvni prvek
% prvni(Prvni, Seznam).
prvni(Prvni, [Prvni|_]).
% prvni(Prvni, []). -> false.
% prvni(Prvni, [1]). -> Prvni = 1.
% prvni(1, [1,2,3,4]). -> true.

% druhy prvek
druhy(Druhy, [_, Druhy|_]).
% druhy(Druhy, [1]). -> false.

% posledni
posledni(Posledni, [Posledni]).
posledni(Posledni, [_|Zbytek]) :- posledni(Posledni,Zbytek).

% predposledni
predposledni(Predposledni, [Predposledni, _]).
predposledni(Predposledni, [_|Zbytek]) :-
    predposledni(Predposledni, Zbytek).

% je v seznamu?
% prvek(Prvek, Seznam).
prvek(Prvek, [Prvek|_]).
prvek(Prvek, [_|Zbytek]) :- 
    prvek(Prvek, Zbytek).
% prvek(3, [1,2,3,4]). -> true.
% prvek(5, [1,2,3,4]). -> false.
% prvek(P, [1,2,3,4]). -> vycet prvku seznamu, kdy to bude platit
% v prologu uz vestavena funkce... member
% member(P, [1,2,3,4]).

% v seznamu muze byt cokoliv
% prvek(P, [1,a,1 + 2, ahoj]).

% vypis_prvky(Seznam).
vypis_prvky([]).
vypis_prvky([Prvek|Zbytek]) :-
    write(Prvek), nl,
    vypis_prvky(Zbytek).

% obracene
vypis_obracene([]).
vypis_obracene([Prvek|Zbytek]) :- 
    vypis_obracene(Zbytek),
    write(Prvek), nl.

% n-ty prvek
nty([Prvek|_], 1, Prvek).
nty([_|Telo], N, Prvek) :- 
    N > 1,
    N2 is N - 1, 
    nty(Telo, N2, Prvek).
% nty([1,2,3,4],3, Prvek). -> Prvek = 3
% nty([1,2,3,4],10, Prvek). -> false.

% pouze kladna cisla
% kladna_cisla(Seznam).
kladna_cisla([]).
kladna_cisla([Hlava|Telo]) :-
    number(Hlava),
    Hlava > 0,
    kladna_cisla(Telo).
% kladna_cisla([1,-2,3]). -> false.
% kladna_cisla([1,2,3]). -> true.
% kladna_cisla([1,a,3]). -> false.



