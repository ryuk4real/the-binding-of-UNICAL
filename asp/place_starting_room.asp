#const map_size = 15.
#const hallway_size_distribution = (4,3,3,3,2,2).

%shape(ID,X,Y)
shape(0,0,0).
shape(0,0,1).
shape(0,0,2).

shape(1,0,0).
shape(1,1,0).
shape(1,1,1).
shape(1,1,2).

shape(2,0,0).
shape(2,0,1).
shape(2,0,2).
shape(2,-1,2).

shape(3,0,0).
shape(3,0,1).
shape(3,0,2).
shape(3,0,3).

shape(4,0,0).
shape(4,0,2).
shape(4,1,0).
shape(4,1,1).
shape(4,1,2).

shape(5,0,0).
shape(5,0,1).
shape(5,0,2).
shape(5,0,3).
shape(5,0,4).

placed_new(ROOM_ID, X, Y, Xr, Yr, SHAPE_ID) :-
    ROOM_ID = 0,
    X = 0,
    Y = 0,
    Xr = map_size / 2,
    Yr = map_size / 2,
    SHAPE_ID = @delta(hallway_size_distribution).

placed_new(ROOM_ID1, X1, Y1, Xr1, Yr1, SHAPE_ID) :-
    placed_new(ROOM_ID1, X2, Y2, Xr2, Yr2, SHAPE_ID),
    shape(SHAPE_ID, X2, Y2),
    shape(SHAPE_ID, X1, Y1),
    Xr1 = Xr2 + X1 - X2,
    Yr1 = Yr2 + Y1 - Y2.

#show placed_new/6.