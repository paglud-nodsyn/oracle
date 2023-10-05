
|^
:: =/  yijing  `(map @ud @ud)`
:: (my ~[
:: [111.111 %1]
:: [000.000 %2]
:: [100.010 %3]
:: ])
[111111 1] 
[000000 2]
:: (~(get by yijing) 111.111)
"000000"
~[0 0 0 0 0 0]

Jack:
list of booleans
more specfic

=/  cast  cast6
:-
(changinglines cast)
:-
(beinghex cast)
(becominghex cast)

::
::  Here is where we should consult the =^ rune page
::  eny will be random, but dviding it will not be random. 
::  Not proper.
++  linelist
    |=  counter=@ud
    %^  spin  (reap 3 0)
    ~(. og (div eny counter))
    |=([n=@ rng=_og] (rads:rng 2))

:: Should generate a line. -> convert to a list
|=  x-@ud
^-  (list @ud)
=+  rng=~(. og eny)
=^  r1  rng  (rads:rng 2)
=^  r2  rng  (rads:rng 2)
=^  r3  rng  (rads:rng 2)
`(list @ud)`[r1 r2 r3 ~]

::  
::

::  why add 2?... 0 could be changing yin... 1 could be yin ... etc.
++  add2
    |=  line=(list @ud)
    =/  a2  |=(a=@ud (add a 2))
    (turn line a2)
:: ~[1 0 1] --> [3 2 3 ~] --> 8

++  linesum
    |=  x=(list @ud)
    ^-  @ud
    (roll x add)

++  cast6
    =/  counter  6
    =/  hex  `(list @ud)`[~]
    |-
    ?:  =(counter 0)  hex
    %=  $
    counter  (dec counter)
    hex  (weld (limo [(linesum (add2 p.-:(linelist counter))) ~]) hex)
    ==
[8 7 9 6 7 8]

++  beinghex
    |=  cast=(list @ud)
    =/  n  6
    =/  x  (snag (dec n) cast)
    |-
    ::  is n=0? if yes return cast
    ?:  =(n 0)  cast
    ::  if no, make the following changes
    %=  $
    n  (dec n)
    x  (snag (dec n) cast)
    ::  To cast first ask: Is it a 6?
    cast  ?:  |(=(x 6) =(x 7))
    ::  %.y --> 0
        (snap cast (dec n) 0)
    ::  %.n --> 1
    (snap cast (dec n) 1)
    ==

++  becominghex
    |=  cast=(list @ud)
    =/  n  6
    =/  x  (snag (dec n) cast)
    |-
    ::  is n=0? if yes return cast6
    ?:  =(n 0)  cast
    ::  if no, make the following changes
    %=  $
    n  (dec n)
    x  (snag (dec n) cast)
    cast  ?:  |(=(x 7) =(x 9)) 
    ::  %.y --> 0
        (snap cast (dec n) 0)
    ::  %.n --> 1
    (snap cast (dec n) 1)
    ==

++  changinglines
    |=  cast=(list @ud)
    (sort 
    (weld 
    (fand `(list @ud)`~[6] cast) 
    (fand `(list @ud)`~[9] cast)) 
    gth)
--
