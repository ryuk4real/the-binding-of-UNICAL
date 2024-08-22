#const map_size = 15.  

% map
rows(0..map_size).
cols(0..map_size).
map(X,Y) :- rows(X), cols(Y).

% If a room tile is placed place all other tiles
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
%
% also the id of the room is calculated based on the maximum id
%   of the placed_old rooms
placed_new(ROOM_ID1, X, Y, Xr, Yr, SHAPE_ID) :-
    ROOM_ID1 = #max{N : placed_old(ID, _, _, _, _, _), N = ID + 1},
    SHAPE_ID = @delta((1,1)),
    X = 0,
    Y = 0,
    Xr = xr,
    Yr = xr.


#show placed_new/6.
#show placed_old/6.








placed_old(0,0,0,7,7,5).
placed_old(0,0,1,7,8,5).
placed_old(0,0,2,7,9,5).
placed_old(0,0,3,7,10,5).
placed_old(0,0,4,7,11,5).
#const xr = 9. #const yr = 4.
