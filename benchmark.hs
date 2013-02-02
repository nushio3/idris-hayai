#!/usr/bin/env runhaskell
import Control.Monad
import Data.Time (getCurrentTime, diffUTCTime)
import Data.String.Utils (replace)
import System.IO
import System.IO.Unsafe (unsafePerformIO)
import System.Process (system, runInteractiveCommand)
import Text.Printf(printf)


{-# NOINLINE idrisTemplate #-}
idrisTemplate :: String
idrisTemplate =
  unsafePerformIO $
  readFile "sum-template.idr"


main = do
  fp  <- openFile "bench-idr.txt" WriteMode
  fp2 <- openFile "bench-hs.txt" WriteMode
  forM (map (2^) [0..20]) $ \n ->do
    writeFile "sum-gen.idr" $
      replace "<<<n>>>" (show n) idrisTemplate
    system "make sum-gen-idr"
    beginTime <- getCurrentTime
    (_, hOut,_,_) <- runInteractiveCommand "./sum-gen-idr"
    outStr <- hGetContents hOut
    putStr outStr
    endTime <- getCurrentTime

    beginTime2 <- getCurrentTime
    (_, hOut2,_,_) <- runInteractiveCommand $
                     printf "./sum-hs %d" n
    outStr2 <- hGetContents hOut2
    putStr outStr2
    endTime2 <- getCurrentTime

    let diffUTC  =diffUTCTime endTime beginTime
        diff, diff2 :: Double
        diff  = fromRational $ toRational diffUTC
        diff2 = fromRational $ toRational $
          diffUTCTime endTime2 beginTime2
    hPutStr fp $ printf "%d\t%f\n" (n::Integer) diff
    hFlush fp
    hPutStr fp2 $ printf "%d\t%f\n" (n::Integer) diff2
    hFlush fp2
  hClose fp
  hClose fp2
