% ENEMY TYPES
% 999 = none
% 0 = zombie
% 1 = student

#const none = 999.
#const zombie = 0.
#const student = 1.

type(zombie).
type(student).

% Count all enemies of current room for each enemy type
enemy_counter(ENEMY_TYPE, COUNT):-
    current_room(ROOM_ID, _),
    enemy(_, _, ENEMY_TYPE),
    COUNT = #count { ENEMY_ID, ENEMY_TYPE :
        enemy(ROOM_ID, ENEMY_ID, ENEMY_TYPE)
}.

% If current room has no enemies of a certain type, the count is 0
enemy_counter(ENEMY_TYPE, COUNT):-
    COUNT = 0,
    type(ENEMY_TYPE),
    not enemy(_, _, ENEMY_TYPE).

enemy_weights(W1, W2) :-
    enemy_counter(zombie, W1),
    enemy_counter(student, W2).

% If enemy types have been counted, I apply a weighted distribution where the probability of having an enemy
%   of a certain type is increased the less enemies of that type have been counted
enemy_type(X) :-
    X = @delta((
        (none, 1),
        (zombie, 1 + W2),
        (student, 1 + W1))
    ),
    enemy_weights(W1, W2).

#show enemy_type/1.

% EXAMPLES OF ATOMS NEEDED:
% current_room(ROOM_ID, TYPE)
% enemy(ROOM_ID, ENEMY_ID, ENEMY_TYPE)
% player_stat(STAT_ID, AMOUNT)