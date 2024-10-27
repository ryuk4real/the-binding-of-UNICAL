#const map_size = 50.
#const hallway_size_distribution = (4,3,3,3,2,2).
#const configuration_distribution_shape_0 = (1,1).

#const up = 1.
#const down = -1.
#const left = -2.
#const right = 2.

#const hallway = 0.

% shape(ID,X,Y)
shape(0,0,-1).
shape(0,0,0).
shape(0,0,1).

% door_configuration(CONFIGURATION_ID,SHAPE_ID).
door_configuration(0,0).
door_configuration(1,0).

% door_placeholder(DOOR_ID,CONFIGURATION_ID,X,Y,DIRECTION).
door_placeholder(0,0,0,0,down).
door_placeholder(1,0,0,1,up).
door_placeholder(2,0,0,-1,right).

shape(1,-1,-1).
shape(1,0,-1).
shape(1,0,0).
shape(1,0,1).

shape(2,-1,1).
shape(2,0,-1).
shape(2,0,0).
shape(2,0,1).

shape(3,0,-1).
shape(3,0,0).
shape(3,0,1).
shape(3,0,2).

shape(4,0,-2).
shape(4,0,-1).
shape(4,0,0).
shape(4,0,1).
shape(4,0,2).

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

type(ROOM_ID, TYPE) :-
    placed_new(ROOM_ID, _, _, _, _, _),
    TYPE = hallway.

configuration(ROOM_ID, CONFIGURATION_ID) :-
    placed_new(ROOM_ID, _, _, _, _, _),
    CONFIGURATION_ID = @delta(configuration_distribution_shape_0).

% Count the number of new rooms
room_counter(N) :- N = #count{ID : placed_new(ID, _, _, _, _, _)}.

#show room_counter/1.
#show placed_new/6.
#show configuration/2.
#show type/2.