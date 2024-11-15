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
#const hallway_neighbour_distribution = (
    (999,2),
    (1,2),
    (2,1)).

hallway_neighbour_type(X) :- X = @delta(hallway_neighbour_distribution).

#show hallway_neighbour_type/1.