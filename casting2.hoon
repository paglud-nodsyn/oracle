|%
:: +$  yaos  [y1=(list @ud) y2=(list @ud) y3=(list @ud) y4=(list @ud) y5=(list @ud) y6=(list @ud)]
++  yao
    |=  eny=@uvj
    :: ^-  yaos
    =+  rng=~(. og eny)
        =^  r1  rng  (rads:rng 2)
        =^  r2  rng  (rads:rng 2)
        =^  r3  rng  (rads:rng 2)
        =^  r4  rng  (rads:rng 2)
        =^  r5  rng  (rads:rng 2)
        =^  r6  rng  (rads:rng 2)
        =^  r7  rng  (rads:rng 2)
        =^  r8  rng  (rads:rng 2)
        =^  r9  rng  (rads:rng 2)
        =^  r10  rng  (rads:rng 2)
        =^  r11  rng  (rads:rng 2)
        =^  r12  rng  (rads:rng 2)
        =^  r13  rng  (rads:rng 2)
        =^  r14  rng  (rads:rng 2)
        =^  r15  rng  (rads:rng 2)
        =^  r16  rng  (rads:rng 2)
        =^  r17  rng  (rads:rng 2)
        =^  r18  rng  (rads:rng 2)
    :*
        y1=~[r1 r2 r3]
        y2=~[r4 r5 r6]
        y3=~[r7 r8 r9]
        y4=~[r10 r11 r12]
        y5=~[r13 r14 r15]
        y6=~[r16 r17 r18]
    ==
++  cast
    |=  [y1=(list @ud) y2=(list @ud) y3=(list @ud) y4=(list @ud) y5=(list @ud) y6=(list @ud)]
    =/  add2
        |=  x=(list @ud)
        =/  a2  |=(a=@ud (add a 2))
        (turn x a2)
    =/  linesum
        |=  x=(list @ud)
        (roll x add)
    :~
        (linesum (add2 y1))
        (linesum (add2 y2))
        (linesum (add2 y3))
        (linesum (add2 y4))
        (linesum (add2 y5))
        (linesum (add2 y6))
    ==
++  beinghex
    |=  cast=(list @ud)
    =/  n  6
    =/  x  (snag (dec n) cast)
    |-
    ?:  =(n 0)  cast
    %=  $
        n  (dec n)
        x  (snag (dec n) cast)
        cast  ?:  |(=(x 6) =(x 7))
            (snap cast (dec n) 0)
        (snap cast (dec n) 1)
    ==
++  becominghex
    |=  cast=(list @ud)
    =/  n  6
    =/  x  (snag (dec n) cast)
    |-
    ?:  =(n 0)  cast
    %=  $
        n  (dec n)
        x  (snag (dec n) cast)
        cast  ?:  |(=(x 7) =(x 9)) 
            (snap cast (dec n) 0)
        (snap cast (dec n) 1)
    ==

++  changing-lines
    |=  cast=(list @ud)
    %+  turn
    %+  sort  
    %+  weld 
        (fand `(list @ud)`~[6] cast) 
        (fand `(list @ud)`~[9] cast)
    gth
    |=(a=@ud (add a 1))
--


