{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}

module Handlers.Home(getHome) where
    --import Yesod
import Data.Aeson

getHome = object [ "msg" .= "hello world" ]
