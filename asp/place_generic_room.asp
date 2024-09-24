#const map_size = 50.
#const offset = 6.
#const generic_room_size_distribution = (2,2,3,3,3,1,1). 

shape(6, 0..1, 0).
shape(7, 0, 0..1).
shape(8, 0..1, 0..1).
shape(9, 0..1, 0..2).
shape(10, 0..2, 0..1).
shape(11, 0..9, 0..7).
shape(12, 0..7, 0..9).

% map
rows(0..map_size).
cols(0..map_size).
map(X,Y) :- rows(X), cols(Y).


placed_new(ROOM_ID1, X, Y, Xr, Yr, SHAPE_ID) :-
    ROOM_ID1 = #max{N : placed_old(ID, _, _, _, _, _), N = ID + 1},
    SHAPE_ID = @delta((generic_room_size_distribution)) + offset,
    X = 0,
    Y = 0,
    Xr = xr,
    Yr = xr.


% If a room tile is placed by the rule above place all other tiles
placed_new(ROOM_ID1, X1, Y1, Xr1, Yr1, SHAPE_ID) :-
    placed_new(ROOM_ID1, X2, Y2, Xr2, Yr2, SHAPE_ID),
    shape(SHAPE_ID, X2, Y2),
    shape(SHAPE_ID, X1, Y1),
    Xr1 = Xr2 + X1 - X2,
    Yr1 = Yr2 + Y1 - Y2.


% It is impossible to place a new room on top of an old room
:- placed_old(_, _, _, Xr, Yr, _), placed_new(_, _, _, Xr, Xr, _).


% A room can only be placed if it is within the map
:- placed_new(_, _, _, Xr, Yr, _), not map(Xr, Yr).


% Count the number of old rooms
old_room_counter(N) :- N = #count{ID : placed_old(ID, _, _, _, _, _)}.


% Count the number of new rooms
new_room_counter(N) :- N = #count{ID : placed_new(ID, _, _, _, _, _)}.


% Count the number of all rooms
room_counter(N) :- old_room_counter(N1), new_room_counter(N2), N = N1 + N2.

#show placed_new/6.
#show placed_old/6.
#show n_rooms/1.