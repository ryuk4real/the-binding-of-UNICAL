#const map_size = 15.  

% map
rows(0..map_size).
cols(0..map_size).
map(X,Y) :- rows(X), cols(Y).

% the constant id is directly written on the file when the program is used by the engine
%   -> #const id = {room_id}.
placed_new(ROOM_ID1, X1, Y1, Xr1, Yr1, SHAPE_ID) :-
    placed_new(ROOM_ID1, X2, Y2, Xr2, Yr2, SHAPE_ID),
    shape(SHAPE_ID, X2, Y2),
    shape(SHAPE_ID, X1, Y1),
    Xr1 = Xr2 + X1 - X2,
    Yr1 = Yr2 + Y1 - Y2.


% xr and xr are the coordinates of the top left corner of the room
%   they are calculated by the engine and added to the file as constants
%   -> #const xr = {x}.
%   -> #const xr = {y}.
placed_new(ROOM_ID1, X, Y, Xr, Yr, SHAPE_ID) :-
    ROOM_ID1 = #max{N : placed_old(ID, _, _, _, _, _), N = ID + 1},
    SHAPE_ID = @delta((1,1)),
    X1 = 0,
    Y1 = 0,
    Xr1 = xr,
    Yr1 = xr.


#show placed_new/6.
#show placed_old/6.


shape(0, 0, 0).
shape(0, 1, 0).

placed_old(1, 0, 0, 34, 35, 0).





