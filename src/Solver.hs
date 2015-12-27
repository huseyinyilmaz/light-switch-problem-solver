module Solver where

import Data.List(find)

type LightName = String
type SwitchName = String

data Switch = Switch SwitchName [LightName] deriving (Show, Eq)
data Light = Light LightName Bool

combinations :: [a] -> [[a]]
combinations [] = []
combinations (i:is) = [i:r |r<-[]:rest] ++ rest
  where
    rest = combinations is

switch :: [Light] -> Switch -> [Light]
switch ls (Switch _ lns) = foldr switchLight ls lns
  where
    switchLight :: LightName -> [Light] -> [Light]
    switchLight ln = fmap (\l@(Light name lit) -> if name == ln
                                                  then Light name (not lit)
                                                  else l)

-- Checks if all lights in the temple is lit.
isSolved :: [Light] -> Bool
isSolved ls = and $ fmap (\(Light _ isLit) -> isLit) ls

solve :: [LightName] -> [Switch] -> Maybe [SwitchName]
solve lns switches = find (isSolution) solutions >>= (\rs-> return $ fmap (\(Switch name _) -> name) rs)
  where
    ls :: [Light]
    ls = fmap (\ln -> Light ln False) lns
    solutions :: [[Switch]]
    solutions = combinations switches
    isSolution :: [Switch] -> Bool
    isSolution ss = isSolved $ foldl (switch) ls ss
