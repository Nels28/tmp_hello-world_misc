open System
open Suave
open Suave.Filters
open Suave.Successful

let app : WebPart =
    choose [
        GET >=> path "/" >=> OK "Hello, World!"
        NOT_FOUND "Not Found"
    ]

[<EntryPoint>]
let main argv =
    let config = { defaultConfig with bindings = [ HttpBinding.mk (IPAddress.Parse("0.0.0.0"), 8080) ] }
    startWebServer config app
    |> ignore
    0
