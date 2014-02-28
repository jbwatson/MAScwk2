argument((C,[C])) :- myAsm(C).
argument((C,S)) :- myRule(C,S1),
		   findall(A,
			   (member(C2,S1), argument((C2,S2)), member(A,S2)),
			   S).

attacks((C1,X1), (C2,X2)) :- argument((C1,X1)),
                             argument((C2,X2)),
                             contrary(Y,C1),
                             member(Y,X2).
myAsm(a).
myAsm(b).
contrary(a,p).
myRule(p,[b]).
myRule(p,[]).
