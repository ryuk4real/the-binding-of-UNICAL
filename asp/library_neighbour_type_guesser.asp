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
#const library_neighbour_distribution = (
    (999, 1),
    (1, 1)).

library_neighbour_type(X) :- X = @delta(library_neighbour_distribution).

#show library_neighbour_type/1.