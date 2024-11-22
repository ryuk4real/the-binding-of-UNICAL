% ROOM TYPES
% 0 = hallway
% 1 = inner_hallway
% 2 = bathroom - has no neighbours
% 3 = classroom
% 4 = office
% 5 = storage
% 6 = library

#const none = 999.
#const inner_hallway = 1.
#const classroom = 3.
#const office = 4.
#const storage = 5.
#const library = 6.

#const inner_hallway_neighbour_distribution = (
    (none, 1),
    (inner_hallway, 1),
    (classroom, 3),
    (office, 3),
    (storage, 2),
    (library, 2)).

inner_hallway_neighbour_type(X) :- X = @delta(inner_hallway_neighbour_distribution).

#show inner_hallway_neighbour_type/1.

% EXAMPLES OF ATOMS NEEDED:
%
% room(ID)
% current_room(ROOM_ID)
% neighbours(ROOM_ID1, ROOM_ID2)
% enemy(ROOM_ID, ENEMY_ID)
% player_stat(STAT_ID, AMOUNT)