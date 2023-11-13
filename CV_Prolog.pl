% Ve VSC => Load document => cislice(0). => true. // cislice(a). => false.
% cislice(objekt, ktery bude cislici).
% AND operator => ,
% OR operator => ;
% NOT operator => \+
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

% N:\Ukazky\Karel.Maly\rodina.pdf

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