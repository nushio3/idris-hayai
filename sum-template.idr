module Main

sumAcc : Integer -> Integer -> Integer
sumAcc n accum = if n <= 0 then accum else (sumAcc (n-1) $ n + accum)

sumUpto : Integer -> Integer
sumUpto n = sumAcc n 0

main : IO ()
main = do
  print $ sumUpto <<<n>>>
