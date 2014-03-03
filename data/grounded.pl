% unattacked if nothing attacks it.
unattacked(A) :- argument(A), \+(attacks(_,A)).

% Defends itelf if for every arg X that attacks A, there exists an arg which
% attacks X and is grounded. 
selfdefends(A) :- argument(A),
               forall( (argument(X), attacks(X,A)),
                       (attacks(Y, X), Y\==X, Y\==A, grounded(Y)) ).

%given a list of arguments As, finds if it defends itelf
defendedby(A,_) :- unattacked(A). 
defendedby(A,D) :- argument(X), argument(Y),
		   attacks(X,A),
		   member(Y,D),
		   attacks(Y,X).

% Empty set is grounded by definition (needed?), may not be complete?
%grounded([]). 

% fixed point grounded
grounded(A) :- grounded(A,[]).
grounded(A, S) :- member(A, S); 
		  findall(X, defendedby(X,S), S2),
		  S2 \== S,
		  grounded(A,S2).
