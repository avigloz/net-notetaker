module Util.Requests (getEntries, getEntriesPassword, makeEntry) where
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Char8 as S8
import qualified Data.ByteString.Lazy.Char8 as L8
import Network.HTTP.Conduit
import Control.Monad (void)

makeEntry filename message = do
    void . simpleHttp $ "http://localhost:1234/" ++ filename ++ "?entry=" ++ message
getEntries filename = do
    void . simpleHttp $ "http://localhost:1234/" ++ filename
getEntriesPassword filename password = do
    void . simpleHttp $ "http://localhost:1234/" ++ filename ++ "/" ++ password
