
% i need a placed_new atom
% i need to check collision
% the room can't be placed outside the grid


#const map_size = 10.

% map
rows(0..map_size).
cols(0..map_size).
map(X,Y) :- rows(X), cols(Y).


placed_new(ROOM_ID1, X1, Y1, Xr1, Yr1) :-
    placed_new(ROOM_ID1, X2, Y2, Xr2, Yr2),
    room(ROOM_ID1, X2, Y2),
    room(ROOM_ID1, X1, Y1),
    Xr1 = Xr2 + X1 - X2,
    Yr1 = Yr2 + Y1 - Y2.

#show placed_new/5.
#show placed_old/5.