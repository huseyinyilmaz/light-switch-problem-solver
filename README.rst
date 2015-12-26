Light switch problem solver
===========================

I stumble upon this problem on a `youtube video about battle field 4`_

There are certain number of lights in a room. There are also certain number of switches. Every switch opens some variaty of lights. If a light is already lit, switch closes the light. If it is not lit, it opens the light.

For instance in the diagram we have 2 lights A and B. We also have a switch S. Light A is lit and light B is not lit.

::

        +----------+---------+
        |##########|         |      +--+
        |### A ####|    B    |      |S |
        |##########|         |      +-++
        +----+-----+----+----+        |
             |          |             |
             +----------+-------------+

If we press the switch S which is connected to Light A and B, Light A will be turned off and ligt B will be runed on.

::

        +----------+---------+
        |          |#########|      +--+
        |    A     |### B ###|      |S#|
        |          |#########|      +-++
        +----+-----+----+----+        |
             |          |             |
             +----------+-------------+


Things get little more complicated if we have multiple switches connected to same light. Here are 3 ligts with 2 switches. Light B is connected to both switches So if we press one button light B will be turned on and if we press it again light will be turned off.


::

           1 - Initial state

                  +--------+-----------------+
                  |        |                 |
      +-------+---+---+----+--+             ++-+
      |       |       |       |             |T |
      |   A   |   B   |   C   |       +--+  +--+
      |       |       |       |       |S |
      +---+---+---+---+-------+       ++-+
          |       |                    |
          +-------+--------------------+


           2 - Turn on switch T
                  +--------+-----------------+
                  |        |                 |
      +-------+---+---+----+--+             ++-+
      |       |#######|#######|             |T#|
      |   A   |## B ##|## C ##|       +--+  +--+
      |       |#######|#######|       |S |
      +---+---+---+---+-------+       ++-+
          |       |                    |
          +-------+--------------------+

           3 - Turn on switch S
                  +--------+-----------------+
                  |        |                 |
      +-------+---+---+----+--+             ++-+
      |#######|       |#######|             |T#|
      |## A ##|   B   |## C ##|       +--+  +--+
      |#######|       |#######|       |S#|
      +---+---+---+---+-------+       ++-+
          |       |                    |
          +-------+--------------------+


So problem is given the number of switches and lights and specification about how they are connected, find a switch combination that lits all the lights.

Here is the types for the solver.

::

    module Solver where

    type LightName = String
    type SwitchName = String

    data Light = Light {lightName::LightName, isOn::Bool}
    data Switch = Switch {switchName::SwitchName, lights::[LightName]}

    solve :: [LightName] -> [Switch] -> [SwitchName]
    solve lights switches = []


Run unittest against you solution by

::

   stack test



.. _youtube video about battle field 4: https://www.youtube.com/watch?v=JuuzmOXL1bc&feature=youtu.be
