module Solver where

type LightName = String
type SwitchName = String

data Switch = Switch SwitchName [LightName] deriving (Show, Eq)

solve :: [LightName] -> [Switch] -> Maybe [SwitchName]
solve _lns _ss = Nothing
