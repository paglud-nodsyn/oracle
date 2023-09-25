|=  action=@
=<
:-  being  becoming
|%
:: 
::  This tosses 3 coins
::  produces a list of 3 random numbers less than `2`
::  use p.-:linelist to get list
++  linelist
    %^  spin  (reap 3 0)
    ~(. og eny)
    |=([n=@ rng=_og] (rads:rng 2))
::
::  This converts a 3 coin toss as binary into 1 of 4 casting lines
++  cointoline
=>  ::  ---QQQ--- is this how to do this?
    |%
    ++  step1
    =/  linelist  p.-:linelist
    |=  linelist=(list @ud)
    ::  if 0 then 2; if 1 then 3
    =/  counter  3
    |-
    ?.  =(counter 0)
        ::  if no
        %=  $
        counter  (dec counter)
        linelist  ?:  =((snag (dec counter) linelist) 1)
            ::  if yes
            (snap linelist (dec counter) 3)
            ::  if no
            (snap linelist (dec counter) 2)
        ::  if yes
        linelist
        ==
    ++  step2
    |=  step1=(list @ud)
    ^-  @ud
    (roll add step1)
::
::  This repeats the threecointoss and cointoline 6 times to produce a being hexagram
++  cast6
::
::  This transforms the being hexagram into it's becoming hexagram as binary
++  becominghex
::
::  This converts the casting numbers of the being hexagram to binary
++  casttocode
::
::  This calls the Kig Wen hexgram #s from a map of binary codes
++  hexlookup
::
::  This is a map of Hexagram number values with binary lists as key
++  hexmap
--
