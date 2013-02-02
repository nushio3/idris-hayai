module Main

factori : Integer -> Integer -> Integer
factori n accum = if n <= 0 then accum else  factori (n-1) $ n + accum

facto : Integer -> Integer
facto n = factori n 0

main : IO ()
main = print $ facto 1234567