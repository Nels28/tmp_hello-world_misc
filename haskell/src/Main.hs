{-# LANGUAGE OverloadedStrings #-}

import Network.Wai
import Network.Wai.Handler.Warp
import Network.HTTP.Types (status200)

main :: IO ()
main = run 8080 app

app :: Application
app request respond = respond $ responseLBS status200 [("Content-Type", "text/plain")] "Hello World"
