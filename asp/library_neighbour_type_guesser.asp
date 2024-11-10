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
#const library_neighbour_distribution = (1,1).
library_neighbour_type_not_mapped(X) :- X = @delta(library_neighbour_distribution).
library_neighbour_type_mapped(999) :- library_neighbour_type_not_mapped(0).
library_neighbour_type_mapped(1) :- library_neighbour_type_not_mapped(1).

#show library_neighbour_type_mapped/1.