module Main where
import Client (doClient)
import Server (doServer)
import System.Environment
import System.Exit (exitSuccess)
import Control.Monad (when)

main :: IO ()
main = do
    args <- getArgs
    putStrLn "Enter desired behavior (SERVER or CLIENT):"
    behavior <- getLine
    when (null args && behavior /= "SERVER") noArgsHelper
    if behavior == "SERVER" 
        then doServer 
        else doClient $ head args

noArgsHelper :: IO ()
noArgsHelper = do
    putStrLn "ERROR - Missing required argument: filename"
    putStrLn "Example execution for CLIENT: ./Main test.txt"
    exitSuccess