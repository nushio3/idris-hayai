import System.Environment

sumAcc :: Int -> Int -> Int
sumAcc n accum = if n <=0 then accum else sumAcc (n-1) $ n+accum

sumUpto :: Int -> Int
sumUpto n = sumAcc n 0

main = do
  n <- fmap (read . head) $ getArgs
  print $ sumUpto n