|^

=/  cast  cast6
:-
(changinglines cast)
:-
(beinghex cast)
(becominghex cast)
++  linelist
    ^-  (list @ud)
    =+  rng=~(. og eny)
        =^  r1  rng  (rads:rng 2)
        =^  r2  rng  (rads:rng 2)
        =^  r3  rng  (rads:rng 2)
    :~(r1 r2 r3)
++  add2
    |=  line=(list @ud)
    =/  a2  |=(a=@ud (add a 2))
    (turn line a2)
++  linesum
    |=  x=(list @ud)
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
