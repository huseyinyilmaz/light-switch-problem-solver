module Solver where

type LightName = String
type SwitchName = String

data Light = Light {lightName::LightName, isOn::Bool}
data Switch = Switch {switchName::SwitchName, lights::[LightName]}

solve :: [LightName] -> [Switch] -> [SwitchName]
solve lights switches = []
