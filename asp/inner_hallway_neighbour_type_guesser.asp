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

type(classroom).
type(office).
type(storage).
type(library).

% EXAMPLES OF ATOMS NEEDED:
%
% room(ID)
% current_room(ROOM_ID)
% neighbours(ROOM_ID1, ROOM_ID2)

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
room_weights(W2, W3, W4, W5) :-
    room_type_counter(classroom, W2),
    room_type_counter(office, W3),
    room_type_counter(storage, W4),
    room_type_counter(library, W5).

% If room types have been counted a weighted distribution is applied where the probability of having a room
%   of a certain type as a neighbour is increased by the number of rooms of that type already counted
inner_hallway_neighbour_type(X) :-
    X = @delta((
        (none, 1),
        (inner_hallway, 1),
        (classroom, 3 + W2),
        (office, 3 + W3),
        (storage, 2 + W4),
        (library, 2 + W5))
    ),
    room_weights(W2, W3, W4, W5).

#show inner_hallway_neighbour_type/1.
% #show room_type_counter/2.
% #show room_weights/4.

% current_room(1, 1).
% room(1, 1).
% room(2, 3).
% room(3, 3).
% neighbours(1, 2).
% neighbours(2, 3).

