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
#const hallway_neighbour_distribution = (2,2,1).

hallway_neighbour_type_not_mapped(X) :- X = @delta(hallway_neighbour_distribution).
hallway_neighbour_type_mapped(999) :- hallway_neighbour_type_not_mapped(0).
hallway_neighbour_type_mapped(1) :- hallway_neighbour_type_not_mapped(1).
hallway_neighbour_type_mapped(2) :- hallway_neighbour_type_not_mapped(2).

#show hallway_neighbour_type_mapped/1.