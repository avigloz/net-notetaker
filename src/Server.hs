{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}
module Server (doServer) where

import Yesod
import Handlers.Home (getHome)

data NNServer = NNServer

mkYesod "NNServer" [parseRoutes|
    / HomeR GET
|]

instance Yesod NNServer

getHomeR = return $ getHome

-- very basic function, meat is above
doServer :: IO ()
doServer = do
    warp 3000 NNServer

