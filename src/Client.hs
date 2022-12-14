-- A web client is preferrable, but this is for practice.
module Client (doClient) where
import Util.Checkers (checkForQuit, checkForEscape)
import Util.Requests (makeEntry, getEntries, getEntriesPassword)
import Control.Monad ( unless, when )

doClient :: String -> IO ()
doClient = clientMenu

clientMenu :: String -> IO ()
clientMenu f = do
    putStrLn ""
    putStrLn $ "USING FILE: " ++ f
    putStrLn "Enter the option number (1-3, XOR):"
    putStrLn "1: Make an entry"
    putStrLn "2: Read from file"
    putStrLn "3: Exit"
    opt <- getLine
    when (opt == "1") $ writeLoop f
    when (opt == "2") $ getEntries f
    unless (opt == "3") $ clientMenu f

writeLoop :: String -> IO ()
writeLoop f = do
    putStrLn ""
    putStrLn $ "USING FILE: " ++ f
    putStrLn "Enter your log entry:"
    putStrLn "(Or enter ^QUIT^ to escape)"
    entryOrEscape <- getLine
    shouldEscape <- checkForEscape entryOrEscape
    unless shouldEscape $ do
        makeEntry f entryOrEscape
        writeLoop f
