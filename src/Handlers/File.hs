{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}
module Handlers.File(getReadFile, postWriteFile) where

import Handlers.Lib.Types (Filename, FileContents)
import Data.Aeson
import System.IO.Unsafe (unsafePerformIO)
import qualified Data.Text as T
import qualified Data.Text.IO as T.IO

getReadFile :: Filename -> Value
getReadFile f = object [ "file-name" .= (f :: Filename)
                        , "contents" .= (fc :: FileContents) ] 
                        where
                            fc = T.unpack $ unsafePerformIO $ T.IO.readFile $ "./" ++ show f
postWriteFile = undefined
