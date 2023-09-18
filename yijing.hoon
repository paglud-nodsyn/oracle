!:
|%
::
::  There should be some point where this core is given reference to
::  our say generator which produces a random 6 7 8 or 9.
::  I do recall Neal saying something about needing to change the 
::  time input for ++eny or it will give the same reesult?
++  threecointoss
    =>  :: do we need to tell it do this then that?
    /-  threecointoss.hoon
    *   ::  Will this noun activate the %say?
::
::  A gate which runs the 3cointoss generator
::  Note this gate 'accepts' x but there is no
::  'x' in this gate ... Should we instead give it a %say structure?
++  casting
    |=  x=@ud
    ^-  (list @ud)
    =/  count  6
    =/  cast  `(list @ud)`  [~]
    |-
    ?:  =(count 0)  cast
    cast  (weld (limo threecointoss) cast)
    count  (dec count)
    ==
::
::  This gate converts the list of 
::  6 @ud to two lists of 1s or 0s
::  This could work siilar to a fizz buzz problem
::  Maybe this would be better as an |^ (core that evaluates immediately?)
::  (see HSL23.3 lesson #4)
++  beingandbecoming
    |=  cast=(list @ud)
    ^-  (pair (list @ub))
    =/  count  6        ::  counter for index and trap completion
    =/  being  [~]      ::  empty list for welding
    =/  becoming  [~]   ::  empty list for welding 
    |-  
    ?.  =(count 0)      ::  if no...
    being  (weld (replacebeing cast) being)
    becoming  (weld (replacebecoming  cast) becoming)
    count  (dec count)
    ::  if yes...
    :-(being becoming)      
    ==
::
::  This arm uses the binary list to index 2 hexagrams
++  getbyhexagram
=>  :: do we need to tell it do this then that?
/+  hexagram.hoon
=>  :: do we need to tell it do this then that?
(getby i.beingandbecoming hexmap)
(getby t. beingandbecoming hexmap)
::
::
::
::  BELOW THIS LINE IS WIP
::  ---------------------------------------------------------
::  converts 6s and 7s to 0, and 8s and 9s to 1.
::  I think that these need to be in the ++beingandbecoming arm..
++  replacebeing
    |=  cast=(list @ud)
    ^-  @ub  :: do we want the binaries to be @ub lists?
::  Something like...
    ?:  =((snag (dec counter) cast) 6)
    (weld 0 being)
:: or 
    (snap cast counter 1)
    (snap cast counter 0)
::  
::  converts 7s and 9s to 0, and 6s and 8s to 1.
++  replacebecoming
::
::  -fin-
--
