% unattacked if nothing attacks it.
unattacked(A) :- argument(A), \+(attacks(_,A)).

% Defends itelf if for every arg X that attacks A, there exists an arg which
% attacks X and is grounded. 
selfdefends(A) :- argument(A),
               forall( (argument(X), attacks(X,A)),
                       (attacks(Y, X), Y\==X, Y\==A, grounded(Y)) ).

%given a list of arguments As, checks if they are conflict free
conflictfree(As) :- \+((member(X,As),member(Y,As),attacks(X,Y))).

% Empty set is grounded by definition (needed?)
grounded(A) :- A==[]. 

%examples
argument(a).
argument(b).
argument(c).

attacks(a,b).
