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
#const classroom_neighbour_distribution = (1,1).
classroom_neighbour_type_not_mapped(X) :- X = @delta(classroom_neighbour_distribution).
classroom_neighbour_type_mapped(999) :- classroom_neighbour_type_not_mapped(0).
classroom_neighbour_type_mapped(1) :- classroom_neighbour_type_not_mapped(1).

#show classroom_neighbour_type_mapped/1.