module Main where

import Test.HUnit
import Solver

test1Light1Switch :: Test
test1Light1Switch =
  TestCase $ do (assertEqual
                 "Test 1 Digit and 1 "
                 (solve lights [switch])
                 ["S"])
  where
    lights = ["A"]
    switch = Switch {switchName="S", lights=["A"]}

test2Lights2Switches :: Test
test2Lights2Switches =
  TestCase $ do (assertEqual
                 "Test 2 Digit and 2 "
                 (solve lights switches)
                 ["S", "T"])
  where
    lights = ["A", "B"]
    switches = [Switch {switchName="S", lights=["A"]},
                Switch {switchName="T", lights=["B"]}]

test3Lights3Switches :: Test
test3Lights3Switches =
  TestCase $ do (assertEqual
                 "Test 2 Digit and 2 "
                 (solve lights switches)
                 ["S", "T", "V"])
  where
    lights = ["A", "B", "C"]
    switches = [Switch {switchName="S", lights=["A", "B"]},
                Switch {switchName="T", lights=["B"]},
                Switch {switchName="V", lights=["B", "C"]}]


test10Lights6Switches :: Test
test10Lights6Switches =
  TestCase $ do (assertEqual
                 "Test 10 Digit and 10"
                 (solve lights switches)
                 ["S", "T", "V", "X", "Y", "Z"])
  where
    lights = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    switches = [Switch {switchName="S", lights=["1", "3", "7"]},
                Switch {switchName="T", lights=["2", "8", "9"]},
                Switch {switchName="V", lights=["4"]},
                Switch {switchName="X", lights=["5"]},
                Switch {switchName="Y", lights=["6"]},
                Switch {switchName="Z", lights=["10"]}
               ]


main :: IO Counts
main =  runTestTT $ TestList [test1Light1Switch,
                              test2Lights2Switches,
                              test3Lights3Switches,
                              test10Lights6Switches]
