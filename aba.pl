attacks((C1,X1), (C2,X2)) :- argument((C1,X1)),
                             argument((C2,X2)),
                             contrary(Y,C2),
                             member(Y,X2).
