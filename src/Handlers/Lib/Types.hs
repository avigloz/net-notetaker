{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}
{-# LANGUAGE DeriveGeneric       #-}
module Handlers.Lib.Types (Filename, FileContents, Password) where

import Yesod
import Data.Text hiding (elem, length)
import qualified Data.Text as T
import GHC.Generics
import Data.Aeson

newtype Filename = Filename Text deriving (Generic, Eq, Read)
newtype Password = Password Text deriving (Generic, Eq, Show, Read)
type FileContents = String

-- TODO: change to using splitOn '.' instead of elem '.' (then check for length > 1)
instance PathPiece Filename where
    fromPathPiece s = 
        case T.unpack s of
          [] -> Nothing
          w
            | elem '.' w -> Just $ Filename $ T.pack w
            | otherwise -> Nothing
    toPathPiece (Filename s) = s
instance Show Filename where
  show (Filename s) = T.unpack s -- (Text) rather than (Filename Text)

instance PathPiece Password where
    fromPathPiece s = 
        case T.unpack s of
          [] -> Nothing
          p
            | length p < 8 -> Nothing
            | otherwise -> Just $ Password $ T.pack p
    toPathPiece (Password p) = p

instance ToJSON Filename
instance ToJSON Password


