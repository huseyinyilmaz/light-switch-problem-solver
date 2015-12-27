module Main where

import Test.HUnit
import Solver

test1Light1Switch :: Test
test1Light1Switch =
  TestCase $ do (assertEqual
                 "Test 1 Digit and 1 "
                 (Just ["S"])
                 (solve lights [s]))
  where
    lights = ["A"]
    s = Switch "S" ["A"]

test2Lights2Switches :: Test
test2Lights2Switches =
  TestCase $ do (assertEqual
                 "Test 2 Digit and 2 "
                 (Just ["S", "T"])
                 (solve lights switches))
  where
    lights = ["A", "B"]
    switches = [(Switch "S" ["A"]),
                (Switch "T" ["B"])]

test3Lights3Switches :: Test
test3Lights3Switches =
  TestCase $ do (assertEqual
                 "Test 2 Digit and 2 "
                 (Just ["S", "T", "V"])
                 (solve lights switches))
  where
    lights = ["A", "B", "C"]
    switches = [(Switch "S" ["A", "B"]),
                (Switch "T" ["B"]),
                (Switch "V" ["B", "C"])]

test10Lights6Switches :: Test
test10Lights6Switches =
  TestCase $ do (assertEqual
                 "Test 10 Digit and 10"
                 (Just ["S", "T", "V", "X", "Y", "Z"])
                 (solve lights switches))
  where
    lights = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    switches = [(Switch "S" ["1", "3", "7"]),
                (Switch "T" ["2", "8", "9"]),
                (Switch "V" ["4"]),
                (Switch "X" ["5"]),
                (Switch "Y" ["6"]),
                (Switch "Z" ["10"])]


main :: IO Counts
main =  runTestTT $ TestList [test1Light1Switch,
                              test2Lights2Switches,
                              test3Lights3Switches,
                              test10Lights6Switches]
