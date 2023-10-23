-- Skript pro PRPA.
main = putStrLn "Ahoj svete!"

mocnina a b = abs a ^ abs b

dvojnasobek a = a * 2

soucetCtvercu a b = (a ^ 2) + (b ^ 2)

soucetCtvercu' a b = (mocnina a 2) + (mocnina b 2)

jeMensi a b = a < b  

jeVetsi a b = a > b

mensi a b = min a b --predprogramovany pristup

mensi' a b = if a < b then a else b 

vetsi a b = if a > b then a else b

logickySoucet' a b = a || b --s pouzitim logickeho operatoru

logickySoucet a b = if a then True else b --bez

-- vzory
logickySoucet'' True _ = True 
logickySoucet'' _ True = True 
logickySoucet'' _ _ = False 

logickaPodminka a = logickySoucet (a < 0) (a > 0)

logickySoucin True True = True
logickySoucin _ _ = False

absolutniHodnota a = if (a >= 0) then a else (-a)

absolutniHodnota' a 
    | a >= 0 = a
    | otherwise = (-a)

sign a
    | a < 0     = (-1)
    | a == 0    = 0
    | otherwise = 1

-- n! = n * (n - 1)!  

-- faktorial n = n * faktorial (n - 1) -- stack

-- straze
faktorial' n  | n < 0 = error "n musi byt nezaporne"
              | n == 0 = 1
              | otherwise = n * faktorial' (n - 1)

faktorial'' n = if n < 0 then error "n musi byt nezaporne" else if n == 0 then 1 else n * faktorial'' (n - 1)

-- vzory
faktorial''' 0 = 1
faktorial''' n = n * faktorial''' (n - 1)

-- if
zbytek a d = if a < d then a else zbytek (a - d) d

-- strazci
zbytek' a d 
            | a < d = a
            | otherwise = zbytek (a - d) d

-- nejvetsi spolecny delitel
nsd n m   | n < 0 || m < 0 = error "n a m musi byt nezaporne"
          | n == 0 = m
          | m == 0 = n
          | otherwise = nsd (zbytek m n) n

--vzory
nsd' a 0 = a
nsd' a b = nsd' b (zbytek a b)

-- where
nsd'' a b = nsd'' b x
    where x = zbytek a b
-----------------------------------------
-- SEZNAMY
s1 = [1..100]   -- rozsahem, vzestupne
s2 = [100,99..1]
s3 = [(-1),(-2)..(-10)]
s4 = [10,20..100]
s4' = [10 * x | x <- [1..10]]
s5 = [100, 90..10]

mocniny = [x ^ 2 | x <- [1..10]] -- intenzionalni zapis
mocniny' = [mocnina x  2 | x <- [1..10]] 

variace = [[x, y, z] | x <- [1..4], y <- [1..4], z <- [1..4]]
variace' = let s = [1..4] in [[x, y, z] | x <- s, y <- s, z <- s] -- let
variace'' = let s = [1..4] in [(x, y, z) | x <- s, y <- s, z <- s] -- n-tice

mocninySudych = [x ^ 2 | x <- [1..10], even x] -- filtr
mocninySudych' = [x ^ 2 | x <- [2,4..10]]

delitele = let cislo = 1200600 in [x | x <- [1..cislo], (zbytek cislo x) == 0]
delitele' cislo =[x | x <- [1..cislo], (zbytek cislo x) == 0]

-- prvni seznam v poli
prvni (hlava:telo) = hlava 
prvni' (hlava:_) = hlava 

-- druhy
druhy (_:druhy:_) = druhy
druhy'(_:telo) = prvni telo

-- telo seznamu 
telo (_:telo) = telo

posledni [x] = x -- pokud jednoprvkovy
posledni (_:telo) = posledni telo -- rekurze, sekame hlavy

predposledni [x, _] = x  -- pole obsahuje dva prvky, vrátíme první z nich.
predposledni (_:telo) = predposledni telo 

prvek _ [] = False -- pada to protoze se seznam vycerpal... proto false (zadna koncova podminka)
prvek a (x:xs)
    | a == x = True
    | otherwise = prvek a xs

-- nty prvek seznamu
-- usekneme hlavu a prvky jsou na pozici o 1 nižší
nty n (x:xs)
    | n == 1 = x
    | otherwise = nty (n - 1) xs
-- nebo
nty' 1 (x:_) = x
nty' n (_:xs) = nty'(n - 1) xs

-- delka pole
delka [] = 0
delka (_:xs) = 1 + delka xs

-- soucet seznamu
soucet [] = 0  -- seznam prazdny => soucet je 0.
soucet (x:xs) = x + soucet xs

-- soucet seznamu
soucin [] = 1  -- seznam prazdny => soucin je 0.
soucin (x:xs) = x * soucin xs

nejmensi [x] = x
nejmensi (x:xs) = if x < nejmensi xs then x else nejmensi xs

-- smazat prvni element
smazPrvni _ [] = []
smazPrvni a (x:xs)
    | a == x = xs   -- pokud jsme nasli shodu, odstranime prvek a vratime zbytek seznamu
    | otherwise = x : smazPrvni a xs 

-- smazat vsechny elementy
smazVsechny _ [] = []
smazVsechny a (x:xs)
    | a == x = smazVsechny a xs   -- pokud jsme nasli shodu, odstranime prvek a vratime zbytek seznamu
    | otherwise = x : smazVsechny a xs

-- otoceni seznamu
otoc xs = otoc' xs []

-- pomocna funkce
-- otoc' xs akumulator
otoc' [] akumulator = akumulator
otoc' (x:xs) akumulator = otoc' xs (x:akumulator)

-- REZY
-----------------------------------------
-- zvyseni o 2
zvysO2 = (+2)
-- umocneni na 6
umocniNa6 = (^6)
-- umocneni hodnoty 6 na jeji argument
umocni6 = (6^)

-- aplikace funkce f na argumenty a b
aplikujBinarniFunkci a b f = f a b
-- pouziti
a1 = aplikujBinarniFunkci 1 2 (+)
-- pouziti castecne implementace
abf12 = aplikujBinarniFunkci 1 2 
aabf = abf12 (+)

-- zvyseni o 1
zvys [] = []
zvys (x:xs) = (x + 1) : zvys xs

-- aplikace funkce na prvky seznamu
-- funkce map
aplikujNaPrvkySeznamu _ [] = [] 
aplikujNaPrvkySeznamu f (x:xs) = f x : aplikujNaPrvkySeznamu f xs

aplikaceAbf12 = aplikujNaPrvkySeznamu abf12 [(+), (-), (*), (/)]

--zmena znamenka v seznamech VNORENE
zmenaZnamenekVSeznamech xs = aplikujNaPrvkySeznamu (aplikujNaPrvkySeznamu negate) xs