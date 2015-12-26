module Solver where

import Data.Maybe(fromJust)
import Data.List(find, nubBy, sort)

type LightName = String
type SwitchName = String

--Lights and Switches
data Light = Light {lightName::LightName, isOn::Bool} deriving (Show, Eq)
data Switch = Switch {switchName::SwitchName, lights::[LightName]} deriving (Show, Eq)

-- Reprets the current state of the lights and switches in the temple.
data Temple = Temple [Light] [Switch] deriving (Show, Eq)

type Stack = [(Temple ,[Switch])]

-- Get Lights from the temple that has given name.
getLight:: Temple -> LightName -> Light
getLight (Temple ls _) ln = fromJust $ find (\l->lightName l == ln) ls

-- Get Switch from given switch name
getSwitch:: Temple -> SwitchName -> Switch
getSwitch (Temple _ ss) sn = fromJust $ find (\s->switchName s == sn) ss

-- Checks if all lights in the temple is lit.
isSolved :: Temple -> Bool
isSolved (Temple ls _) = and $ (map (isOn) ls)


pressSwitch :: Temple -> Switch -> Temple
pressSwitch (Temple ls ss) s = Temple (fmap (turnLight) ls) ss
  where
    lns = lights s
    turnLight :: Light -> Light
    turnLight light@(Light ln on) = if ln `elem` lns
                                     then Light ln (not on)
                                     else light

step :: Stack -> Stack
step stack = do (temple@(Temple ls ss), solution) <- stack
                s <-ss
                let newSolution = s:solution
                    newTemple = pressSwitch temple s
                return (newTemple, newSolution)


solve' :: [(Temple ,[Switch])] -> [Switch]
solve' stack =
  case find (isSolved.fst) newStack of
    Just (_, sols) -> sols
    Nothing -> solve' newStack
  where
    newStack = nubBy stackEq $ step stack
    stackEq ((Temple l1 _),_) ((Temple l2 s2),_) = l1 == l2



solve :: [LightName] -> [Switch] -> [SwitchName]
solve lns ss = (sort.(fmap switchName)) $ solve' [(temple,[])]
  where
    -- create initial lights
    ls = fmap (\l-> Light l False) lns
    temple = Temple ls ss
