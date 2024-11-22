% ROOM TYPES
% 0 = hallway
% 1 = inner_hallway
% 2 = bathroom - has no neighbours
% 3 = classroom
% 4 = office
% 5 = storage
% 6 = library

% x0 = none
% x1 = inner_hallway
% x2 = bathroom

#const none = 999.
#const inner_hallway = 1.
#const bathroom = 2.

#const hallway_neighbour_distribution = (
    (none,2),
    (inner_hallway,2),
    (bathroom,1)).

hallway_neighbour_type(X) :- X = @delta(hallway_neighbour_distribution).

#show hallway_neighbour_type/1.

% EXAMPLES OF ATOMS NEEDED:
%
% room(ID)
% current_room(ROOM_ID)
% neighbours(ROOM_ID1, ROOM_ID2)
% enemy(ROOM_ID, ENEMY_ID)
% player_stat(STAT_ID, AMOUNT)