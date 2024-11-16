% ROOM TYPES
% 0 = hallway
% 1 = inner_hallway
% 2 = bathroom - has no neighbours
% 3 = classroom
% 4 = office
% 5 = storage
% 6 = library

% MAPPED ROOM TYPES
% x0 = none
% x1 = inner_hallway
% x2 = bathroom

#const none = 999.
#const bathroom = 2.
#const inner_hallway = 1.

#const hallway_neighbour_distribution = (
    (none,2),
    (inner_hallway,3),
    (bathroom,2)).

% Applico una distribuzione di default se non ho ancora conteggiato i tipi di stanza
hallway_neighbour_type(X) :-
    X = @delta(hallway_neighbour_distribution),
    not room_type_counter(_,_).

% Applico una distribuzione pesata in base ai conteggi dei tipi di stanza
%  in modo da favorire la generazione di stanze non ancora generate partendo
%  dalla distribuzione di default
hallway_neighbour_type(X) :-
    X = @delta((
            (none,2),
            (inner_hallway,3 + P1 + P0),
            (bathroom,2 + P2 + P0)
        )),
    room_type_counter(none, P0),
    room_type_counter(bathroom, P1),
    room_type_counter(inner_hallway, P2).

% Atomi aggiunti a runtime ad ogni step della generazione
%  per tenere conto dei tipi di stanza generati
room_type_counter(none, 0).
room_type_counter(bathroom, 0).
room_type_counter(inner_hallway, 0).

#show hallway_neighbour_type/1.