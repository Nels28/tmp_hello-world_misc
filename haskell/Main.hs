{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty

main :: IO ()
main = scotty 8080 $ do
    get "/" $ do
        text "Hello World"
