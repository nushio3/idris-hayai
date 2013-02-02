import Data.String.Utils
import System.Unsafe

{-# NOINLINE idrisTemplate #-}
idrisTemplate :: String
idrisTemplate = unsafePerformIO $
	readFile "sum-template.idr"


main = do
