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
#const inner_hallway_neighbour_distribution = (1,1,3,3,2,2).

inner_hallway_neighbour_type_not_mapped(X) :- X = @delta(inner_hallway_neighbour_distribution).
inner_hallway_neighbour_type_mapped(999) :- inner_hallway_neighbour_type_not_mapped(0).
inner_hallway_neighbour_type_mapped(1) :- inner_hallway_neighbour_type_not_mapped(1).
inner_hallway_neighbour_type_mapped(3) :- inner_hallway_neighbour_type_not_mapped(2).
inner_hallway_neighbour_type_mapped(4) :- inner_hallway_neighbour_type_not_mapped(3).
inner_hallway_neighbour_type_mapped(5) :- inner_hallway_neighbour_type_not_mapped(4).
inner_hallway_neighbour_type_mapped(6) :- inner_hallway_neighbour_type_not_mapped(5).

#show inner_hallway_neighbour_type_mapped/1.