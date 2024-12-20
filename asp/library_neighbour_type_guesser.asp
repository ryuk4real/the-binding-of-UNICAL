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

#const none = 999.
#const inner_hallway = 1.

#const library_neighbour_distribution = (
    (none, 1),
    (inner_hallway, 1)).

library_neighbour_type(X) :- X = @delta(library_neighbour_distribution).

#show library_neighbour_type/1.

% EXAMPLES OF ATOMS NEEDED:
%
% room(ID)
% current_room(ROOM_ID, TYPE)
% neighbours(ROOM_ID1, ROOM_ID2)
