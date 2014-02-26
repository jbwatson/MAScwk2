% Grounded if nothing attacks it.
grounded(A) :- argument(A), \+(attacks(_,A)).

% Grounded if for every arg X that attacks A, there exists an arg which
% attacks X and is grounded. 
grounded(A) :- argument(A),
               forall( (argument(X), attacks(X,A)),
                       (attacks(Y, X), Y\==X, Y\==A, grounded(Y)) ).

% Empty set is grounded by definition (needed?)
grounded(A) :- A==[]. 


