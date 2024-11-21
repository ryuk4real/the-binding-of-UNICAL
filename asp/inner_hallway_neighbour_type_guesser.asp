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
% x2 = classroom
% x3 = office
% x4 = storage
% x5 = library

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