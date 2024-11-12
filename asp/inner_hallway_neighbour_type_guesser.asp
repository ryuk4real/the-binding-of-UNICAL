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
#const inner_hallway_neighbour_distribution = (
    (999, 1),
    (1, 1),
    (3, 3),
    (4, 3),
    (5, 2),
    (6, 2)).

inner_hallway_neighbour_type(X) :- X = @delta(inner_hallway_neighbour_distribution).

#show inner_hallway_neighbour_type/1.