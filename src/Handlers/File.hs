{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}
module Handlers.File(getReadFile, postWriteFile) where

import Handlers.Lib.Types (Filename, FileContents)
import Data.Aeson
import qualified Data.Text as T
import qualified Data.Text.IO as T.IO

getReadFile :: Filename -> IO Value
getReadFile f = do
    fc <- readFile $ "./" ++ show f
    pure $ object [ "file-name" .= (f :: Filename)
                   , "contents" .= (fc :: FileContents) ]
postWriteFile = undefined
