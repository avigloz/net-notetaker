{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}

module Handlers.File(getReadFile, postWriteFile) where
import Data.Aeson
import Handlers.Lib.Types

import qualified Data.Text as T

-- TODO: actually do file reading
getReadFile f = object [ "file-name" .= f]
postWriteFile = undefined
