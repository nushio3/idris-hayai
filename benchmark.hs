import Control.Monad
import Data.String.Utils
import System.IO.Unsafe

{-# NOINLINE idrisTemplate #-}
idrisTemplate :: String
idrisTemplate =
  unsafePerformIO $
  readFile "sum-template.idr"


main = do
  forM (map (2^) [0..30]) $ \n ->do
    writeFile "sum-gen.idr" $
      replace "<<<n>>>" (show n) idrisTemplate
