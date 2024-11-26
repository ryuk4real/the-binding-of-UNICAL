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

type(inner_hallway).
type(bathroom).

% Generate neighbours both ways
neighbours(ROOM_ID1, ROOM_ID2) :- neighbours(ROOM_ID2, ROOM_ID1).

% Count all naighbours of current room for each room type
room_type_counter(TYPE, COUNT):-
    current_room(ROOM_ID, TYPE2),
    type(TYPE),
    COUNT = #count { NEIGHBOUR_ROOM_ID, TYPE :
        neighbours(ROOM_ID, NEIGHBOUR_ROOM_ID), 
        room(NEIGHBOUR_ROOM_ID, TYPE)
}.

% If current room has no neighbours of a certain type, the count is 0
room_type_counter(TYPE, COUNT):-
    COUNT = 0,
    type(TYPE),
    not neighbours(ROOM_ID1, ROOM_ID2),
    current_room(ROOM_ID1, _),
    room(ROOM_ID2, TYPE).

% If room types have been counted weights are calculated
room_weights(W1, W2) :-
    room_type_counter(inner_hallway, W1),
    room_type_counter(bathroom, W2).

% If room types have been counted a weighted distribution is applied
hallway_neighbour_type(X) :-
    X = @delta((
            (none,2),
            (inner_hallway,2 + W2),
            (bathroom,1 + W1)
        )
    ),
    room_weights(W1, W2).

#show hallway_neighbour_type/1.
% #show room_type_counter/2.
% #show room_weights/2.

% EXAMPLES OF ATOMS NEEDED:
%
% room(ID,TYPE)
% current_room(ROOM_ID, TYPE)
% neighbours(ROOM_ID1, ROOM_ID2)

%current_room(0, 0).
%room(0, 0).