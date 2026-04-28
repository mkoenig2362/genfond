#include "solve_state_constraints.lp".

% policy, edges, and connectedness
connected(I, S, S) :- state(I, S). 
connected(I, S, T) :- connected(I, S, X), good_trans(I, X, _, T).

% all  cycles  on S via T are  blocked (contain  terminating  states)
blocked_cycles(I, S, T) :- blocked_paths(I, S, T).
blocked_cycles(I, S, T) :- blocked_paths(I, T, S).

% there is no (S,T)-path or all  such  paths  have a terminating  state
blocked_paths(I, S, T) :- state(I, S), state(I, T), not  connected(I, S, T).
blocked_paths(I, S, T) :- connected(I, S, T), terminates(I, S).
blocked_paths(I, S, T) :- connected(I, S, T), terminates(I, T).
blocked_paths(I, S, T) :- S != T, connected(I, S, T), blocked_paths(I, X, T): good_trans(I, S, _, X), S != X.

% fair(S) iff there is a feature f that is decreased, then all cycles in which F is increased contain a terminating state 
fair(I, S1) :- good_trans_delta(I, S1, A1, S2, F, -1), blocked_cycles(I, S1, S3) : good_trans(I, S3, A2, S4), trans_delta(I, S3, A2, S4, F, 1).

% terminating states
terminates(I, S) :- goal(I, S).
terminates(I, S) :- fair(I, S), good_trans(I, S, _, T), terminates(I, T).
terminates(I, S) :- not fair(I, S), good_trans(I, S, _, _), terminates(I, T) : good_trans(I, S, _, T).
:- alive(I, S), not terminates(I, S).

#show terminates/2.
#show fair/2.