{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}
{-# LANGUAGE ViewPatterns         #-}
module Server (doServer) where

import Yesod
import Handlers.Home (getHome)
import Handlers.File (getReadFile, postWriteFile)
import Handlers.Lib.Types (Filename)

data NNServer = NNServer

mkYesod "NNServer" [parseRoutes|
    / HomeR GET
    #Filename ReadFileR GET
|]
-- /#String/#String WriteFileR POST

instance Yesod NNServer

getHomeR = return $ getHome
getReadFileR f = return $ getReadFile f 
-- postWriteFileR = return $ postWriteFile

doServer :: IO ()
doServer = do
    warp 1234 NNServer

