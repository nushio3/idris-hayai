#!/usr/bin/env runhaskell
import Control.Monad
import Data.Time
import Data.String.Utils (replace)
import System.IO.Unsafe (unsafePerformIO)
import System.Process (system)


{-# NOINLINE idrisTemplate #-}
idrisTemplate :: String
idrisTemplate =
  unsafePerformIO $
  readFile "sum-template.idr"


main = do
  forM (map (2^) [0..20]) $ \n ->do
    writeFile "sum-gen.idr" $
      replace "<<<n>>>" (show n) idrisTemplate
    system "make sum-gen-idr"