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
nsd'' a b = nsd' b x
    where x = zbytek a b