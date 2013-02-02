
factori :: Int -> Int -> Int
factori n accum = if n <=0 then accum else factori (n-1) $ n+accum
facto :: Int -> Int
facto n = factori n 0

main = print $ facto 1234567