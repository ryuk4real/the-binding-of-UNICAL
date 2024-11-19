% ENEMY TYPES
% 999 = none
% 0 = zombie
% 1 = student

#const none = 999.
#const zombie = 0.
#const student = 1.

#const enemy_distribution = (
    (none,1),
    (zombie,1),
    (student,1)).

% Applico una distribuzione di default se non ho ancora conteggiato i tipi di stanza
enemy_type(X) :-
    X = @delta(enemy_distribution).

#show enemy_type/1.