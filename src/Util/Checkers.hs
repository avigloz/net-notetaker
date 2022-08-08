module Util.Checkers (checkForQuit, checkForEscape) where

import System.Exit (exitSuccess)
import Control.Monad (when)

checkForQuit :: String -> IO ()
checkForQuit s = when (s == "^QUIT^") exitSuccess

checkForEscape :: String -> IO Bool
checkForEscape s = return $ s == "^QUIT^"