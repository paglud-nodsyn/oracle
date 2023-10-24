|%
+$  element  ?(%heaven %lake %fire %thunder %wind %water %mountain %earth)
+$  name  ?(%qian %dui %li %zhen %xun %kan %gen %kun)
+$  trigram  [element name]
++  tricall
    |=  key=(list @ud)
    (~(get by trimap) key)
++  trigrams
|=  key=(list @ud)
=/  trimap  `(map (list @ud) trigram)`(malt (limo ~[:~(1 1 1) [%heaven %qian]]))
=/  trilist
:~
[:~(1 1 1) [%heaven %qian]]
[:~(1 1 0) [%lake %dui]]
[:~(1 0 1) [%fire %li]]
[:~(1 0 0) [%thunder %zhen]]
[:~(0 1 1) [%wind %xun]]
[:~(1 0 1) [%water %kan]]
[:~(0 0 1) [%mountain %gen]]
[:~(0 0 0) [%earth %kun]]
==
`(map (list @ud) trigram)`(~(gas by trimap) trilist)
--




  =/  tri1
        ^-  (pair)
        :-  :~(1 1 1)  [%heaven %qian]
    (my ~[tri1])
--

    =/  tri2
        ^-  (pair)
        :-  :~(1 1 0)  [%lake %dui]
    =/  tri3
        ^-  (pair)
        :-  :~(1 0 1)  [%fire %li]
    =/  tri4
        ^-  (pair)
        :-  :~(1 0 0)  [%thunder %zhen]
    =/  tri5
        ^-  (pair)
        :-  :~(0 1 1)  [%wind %xun]
    =/  tri6
        ^-  (pair)
        :-  :~(1 0 1)  [%water %kan] 
    =/  tri7
        ^-  (pair)
        :-  :~(0 0 1)  [%mountain %gen]
    =/  tri8
        ^-  (pair)
        :-  :~(0 0 0)  [%earth %kun]
    (my ~[tri1 tri2 tri3 tri4 tri5 tri6 tri7 tri8])
