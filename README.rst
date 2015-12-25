Light switch problem solver
===========================

I stumble upon this problem on a `youtube video about battle field 4`_

There are certain number of lights in a room. There are also certain number of switches. Every switch opens some variaty of lights. If the lights is already lit, switch closes the light. If it is not lit, it opens the light.

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



.. _youtube video about battle field 4: https://www.youtube.com/watch?v=JuuzmOXL1bc&feature=youtu.be
