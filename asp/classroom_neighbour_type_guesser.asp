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

#const classroom_neighbour_distribution = (
    (none,1),
    (inner_hallway,1)).

classroom_neighbour_type(X) :- X = @delta(classroom_neighbour_distribution).

#show classroom_neighbour_type/1.

% EXAMPLES OF ATOMS NEEDED:
%
% room(ID)
% current_room(ROOM_ID)
% neighbours(ROOM_ID1, ROOM_ID2)
