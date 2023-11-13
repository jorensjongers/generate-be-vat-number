module MainTests exposing (suite)

import Expect
import List
import Main
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)


suite : Test
suite =
    test "View shows hello world" <|
        \_ ->
            Main.view ()
                |> .body
                |> List.head
                |> (\maybeHtml ->
                        case maybeHtml of
                            Nothing ->
                                Expect.fail "No html in body"

                            Just html ->
                                Query.fromHtml html
                                    |> Query.has [ text "Hello world!" ]
                   )
