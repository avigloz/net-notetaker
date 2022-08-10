{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}
{-# LANGUAGE DeriveGeneric       #-}
module Handlers.Lib.Types (Filename, Password, FileContents) where

import Yesod
import Data.Text hiding (elem, length)
import qualified Data.Text as T
import GHC.Generics
import Data.Aeson

newtype Filename = Filename Text deriving (Generic, Eq, Show, Read)
newtype Password = Password Text deriving (Generic, Eq, Show, Read)
newtype FileContents = FileContents Text deriving (Generic, Eq, Show, Read)

-- TODO: change to using splitOn '.' instead of elem '.' (then check for length > 1)
instance PathPiece Filename where
    fromPathPiece s = 
        case T.unpack s of
          [] -> Nothing
          w
            | elem '.' w -> Just $ Filename $ T.pack w
            | otherwise -> Nothing
    toPathPiece (Filename s) = s

instance PathPiece Password where
    fromPathPiece s = 
        case T.unpack s of
          [] -> Nothing
          p
            | length p < 8 -> Nothing
            | otherwise -> Just $ Password $ T.pack p
    toPathPiece (Password p) = p

instance PathPiece FileContents where
    fromPathPiece s =
        case T.unpack s of
          "" -> Just $ FileContents $ T.pack ""
          w -> Just $ FileContents $ T.pack w
    toPathPiece (FileContents fc) = fc

instance ToJSON Filename
instance ToJSON Password
instance ToJSON FileContents


