{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}

module Lib (
  embedFile,
) where

import qualified Data.Text.Lazy.IO as LT
import Language.Haskell.TH

embedFile :: FilePath -> ExpQ
embedFile fn = do
  con <- runIO $ LT.readFile fn
  runQ [e| con |]
