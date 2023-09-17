|%
::
::  There should be some point where this core is given reference to
::  our say generator which produces a random 6 7 8 or 9.
::  I do recall Neal saying something about needing to change the 
::  time input for ++eny or it will give the same reesult?
++  threecointoss
=>  +threecointoss
::
::  A gate which runs the 3cointoss generator
::  Note this gate 'accepts' x but there is no
::  'x' in this gate ...
++  casting
|=  x=@ud
^-  (list @ud)
=/  count  6
=/  cast  `(list @ud)`  [~]
|-
?(count 0)  cast
cast  (weld (limo threecointoss) cast)
count  (dec count)
--
::
::  This gate converts the list of 
::  6 @ud to two lists of 1s or 0s
::  This could work siilar to a fizz buzz problem
++  beingandbecoming
|=  cast=(list @ud)
^-  (pair (list @ub))
=/  count  6
=/  being  [~]
=/  becoming  [~]
|-  
?(count 0)  :-(being becoming)  :: if count runs out create a pair of these two lists
::  if not..
being  (weld (REPLACEMENTGATE1 cast) being)
becoming  (weld (REPLACEMENTGATE2  becoming) becoming)
count  (dec count)
--
::  
::  converts 6s and 7s to 0, and 8s and 9s to 1.
++  replacementbeing
|=  x=@ud
^-  @ub
?(x 9)...
::  converts 7s and 9s to 0, and 6s and 8s to 1.
++  replacementbecoming
|=  x=@ud
^-  @ub
?(x 9)...
==