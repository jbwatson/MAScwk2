% unattacked if nothing attacks it.
unattacked(A) :- argument(A), \+(attacks(_,A)).

% Defends itelf if for every arg X that attacks A, there exists an arg which
% attacks X and is grounded. 
selfdefends(A) :- argument(A),
               forall( (argument(X), attacks(X,A)),
                       (attacks(Y, X), Y\==X, Y\==A, grounded(Y)) ).

%given a list of arguments As, finds if it defends itelf
defendedby(A,_) :- unattacked(A). 
defendedby(A,D) :- attacks(X,A),
		   member(Y,D),
		   attacks(Y,X).

%if a set of arguments defends itself
selfdefendsset(As) :- forall(member(A,As), defendedby(A,As)).

%given a list of arguments As, checks if they are conflict free
conflictfree(As) :- \+((member(X,As),member(Y,As),attacks(X,Y))).

%complete extension
complete(As) :- selfdefends(As), conflictfree(As).

% Empty set is grounded by definition (needed?), may not be complete?
grounded([]). 

%examples
argument(a).
argument(b).
argument(c).

attacks(a,b).
attacks(c,a).
