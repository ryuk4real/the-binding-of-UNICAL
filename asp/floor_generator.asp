% room(id,type,x_relative,y_relative)
% door(id,room,door_type,direction)

#const map_size = 9.
#const n_rooms = 10.

#const hallway_configurations = 28.

#const up = 1.
#const down = -1.
#const left = 2.
#const right = -2.

% rooms --------------------------------------------------------------------------

% hallway
room(0, "hallway", 0, 0).
room(0, "hallway", 0, 1).
room(0, "hallway", 0, 2).
door(0, room(0, "hallway", 0, 1), "inner_hallway", down).
door(0, room(0, "hallway", 0, 2), "bathroom", up).

room(1, "hallway", 0, 0).
room(1, "hallway", 0, 1).
room(1, "hallway", 0, 2).
door(0, room(0, "hallway", 0, 0), "inner_hallway", down).
door(0, room(0, "hallway", 0, 2), "bathroom", up).

room(2, "hallway", 0, 0).
room(2, "hallway", 0, 1).
room(2, "hallway", 0, 2).
door(0, room(2, "hallway", 0, 0), "bathroom", up).
door(0, room(2, "hallway", 0, 2), "inner_hallway", down).

room(3, "hallway", 0, 0).
room(3, "hallway", 0, 1).
room(3, "hallway", 0, 2).
door(0, room(3, "hallway", 0, 0), "bathroom", up).
door(1, room(3, "hallway", 0, 2), "bathroom", right).
door(0, room(3, "hallway", 0, 1), "inner_hallway", down).

room(4, "hallway", 0, 0).
room(4, "hallway", 0, 1).
room(4, "hallway", 0, 2).
door(0, room(4, "hallway", 0, 0), "inner_hallway", down).
door(1, room(4, "hallway", 0, 2), "inner_hallway", down).
door(0, room(4, "hallway", 0, 2), "bathroom", up).

room(5, "hallway", 0, 0).
room(5, "hallway", 0, 1).
room(5, "hallway", 0, 2).
door(0, room(5, "hallway", 0, 2), "inner_hallway", down).
door(1, room(5, "hallway", 0, 2), "bathroom", up).

room(6, "hallway", 0, 0).
room(6, "hallway", 0, 1).
room(6, "hallway", 0, 2).
door(0, room(6, "hallway", 0, 1), "inner_hallway", down).
door(0, room(6, "hallway", 0, 0), "bathroom", up).

room(7, "hallway", 0, 0).
room(7, "hallway", 0, 2).
room(7, "hallway", 1, 0).
room(7, "hallway", 1, 1).
room(7, "hallway", 1, 2).
door(0, room(7, "hallway", 0, 2), "inner_hallway", up).
door(0, room(7, "hallway", 1, 2), "inner_hallway", down).

room(8, "hallway", 0, 0).
room(8, "hallway", 0, 2).
room(8, "hallway", 1, 0).
room(8, "hallway", 1, 1).
room(8, "hallway", 1, 2).
door(0, room(8, "hallway", 0, 0), "bathroom", up).
door(0, room(8, "hallway", 1, 0), "inner_hallway", down).

room(9, "hallway", 0, 0).
room(9, "hallway", 0, 2).
room(9, "hallway", 1, 0).
room(9, "hallway", 1, 1).
room(9, "hallway", 1, 2).
door(0, room(9, "hallway", 0, 0), "bathroom", up).
door(0, room(9, "hallway", 1, 1), "inner_hallway", down).

room(10, "hallway", 0, 0).
room(10, "hallway", 0, 2).
room(10, "hallway", 1, 0).
room(10, "hallway", 1, 1).
room(10, "hallway", 1, 2).
door(0, room(10, "hallway", 0, 0), "bathroom", up).
door(1, room(10, "hallway", 0, 2), "bathroom", right).
door(0, room(10, "hallway", 1, 0), "inner_hallway", down).
door(1, room(10, "hallway", 1, 2), "inner_hallway", down).

room(11, "hallway", 0, 0).
room(11, "hallway", 0, 2).
room(11, "hallway", 1, 0).
room(11, "hallway", 1, 1).
room(11, "hallway", 1, 2).
door(0, room(11, "hallway", 0, 0), "inner_hallway", up).
door(1, room(11, "hallway", 1, 2), "inner_hallway", down).
door(0, room(11, "hallway", 1, 0), "bathroom", left).    

room(12, "hallway", 0, 0).
room(12, "hallway", 0, 2).
room(12, "hallway", 1, 0).
room(12, "hallway", 1, 1).
room(12, "hallway", 1, 2).
door(0, room(12, "hallway", 1, 0), "inner_hallway", down).
door(0, room(12, "hallway", 0, 2), "bathroom", up).

room(13, "hallway", 0, 0).
room(13, "hallway", 0, 2).
room(13, "hallway", 1, 0).
room(13, "hallway", 1, 1).
room(13, "hallway", 1, 2).
door(0, room(13, "hallway", 0, 0), "inner_hallway", up).
door(1, room(13, "hallway", 1, 1), "inner_hallway", down).
door(0, room(13, "hallway", 1, 2), "bathroom", right).

room(14, "hallway", 0, 0).
room(14, "hallway", 0, 2).
room(14, "hallway", 1, 0).
room(14, "hallway", 1, 1).
room(14, "hallway", 1, 2).
door(0, room(14, "hallway", 0, 0), "inner_hallway", up).
door(1, room(14, "hallway", 1, 0), "inner_hallway", down).
door(2, room(14, "hallway", 1, 2), "inner_hallway", down).
door(0, room(14, "hallway", 0, 2), "bathroom", right).

room(15, "hallway", 0, 0).
room(15, "hallway", 1, 0).
room(15, "hallway", 1, 1).
room(15, "hallway", 1, 2).
door(0, room(15, "hallway", 1, 0), "inner_hallway", down).
door(1, room(15, "hallway", 1, 2), "inner_hallway", down).
door(0, room(15, "hallway", 1, 2), "bathroom", up).

room(16, "hallway", 0, 0).
room(16, "hallway", 1, 0).
room(16, "hallway", 1, 1).
room(16, "hallway", 1, 2).
door(0, room(16, "hallway", 1, 1), "inner_hallway", down).
door(0, room(16, "hallway", 1, 2), "bathroom", right).

room(17, "hallway", 0, 2).
room(17, "hallway", 1, 0).
room(17, "hallway", 1, 1).
room(17, "hallway", 1, 2).
door(0, room(17, "hallway", 1, 1), "inner_hallway", down).
door(0, room(17, "hallway", 1, 0), "bathroom", up).

room(18, "hallway", 0, 2).
room(18, "hallway", 1, 0).
room(18, "hallway", 1, 1).
room(18, "hallway", 1, 2).
door(0, room(18, "hallway", 1, 0), "inner_hallway", down).
door(1, room(18, "hallway", 1, 2), "bathroom", down).
door(0, room(18, "hallway", 1, 0), "bathroom", up).

room(19, "hallway", 0, 0).
room(19, "hallway", 0, 1).
room(19, "hallway", 0, 2).
room(19, "hallway", 0, 3).
door(0, room(19, "hallway", 0, 0), "inner_hallway", down).
door(1, room(19, "hallway", 0, 2), "inner_hallway", down).
door(0, room(19, "hallway", 0, 3), "bathroom", up).

room(20, "hallway", 0, 0).
room(20, "hallway", 0, 1).
room(20, "hallway", 0, 2).
room(20, "hallway", 0, 3).
door(0, room(20, "hallway", 0, 2), "inner_hallway", down).
door(1, room(20, "hallway", 0, 3), "inner_hallway", up).
door(0, room(20, "hallway", 0, 0), "bathroom", down).

room(21, "hallway", 0, 0).
room(21, "hallway", 0, 1).
room(21, "hallway", 0, 2).
room(21, "hallway", 0, 3).
door(0, room(21, "hallway", 0, 1), "inner_hallway", down).
door(1, room(21, "hallway", 0, 3), "inner_hallway", down).
door(0, room(21, "hallway", 0, 2), "bathroom", up).

room(22, "hallway", 0, 0).
room(22, "hallway", 0, 1).
room(22, "hallway", 0, 2).
room(22, "hallway", 0, 3).
door(0, room(22, "hallway", 0, 0), "bathroom", up).
door(0, room(22, "hallway", 0, 1), "inner_hallway", down).
door(1, room(22, "hallway", 0, 3), "inner_hallway", down).

room(23, "hallway", 0, 0).
room(23, "hallway", 0, 1).
room(23, "hallway", 0, 2).
room(23, "hallway", 0, 3).
door(0, room(23, "hallway", 0, 0), "inner_hallway", up).
door(1, room(23, "hallway", 0, 1), "inner_hallway", down).
door(0, room(23, "hallway", 0, 3), "bathroom", down).

room(24, "hallway", 0, 0).
room(24, "hallway", 0, 1).
room(24, "hallway", 0, 2).
room(24, "hallway", 0, 3).
door(0, room(24, "hallway", 0, 0), "bathroom", up).
door(0, room(24, "hallway", 0, 0), "inner_hallway", down).
door(1, room(24, "hallway", 0, 3), "inner_hallway", down).

room(25, "hallway", 0, 0).
room(25, "hallway", 0, 1).
room(25, "hallway", 0, 2).
room(25, "hallway", 0, 3).
room(25, "hallway", 0, 4).
door(0, room(25, "hallway", 0, 1), "inner_hallway", down).
door(1, room(25, "hallway", 0, 3), "inner_hallway", down).
door(0, room(25, "hallway", 0, 4), "bathroom", up).

room(26, "hallway", 0, 0).
room(26, "hallway", 0, 1).
room(26, "hallway", 0, 2).
room(26, "hallway", 0, 3).
room(26, "hallway", 0, 4).
door(0, room(26, "hallway", 0, 0), "bathroom", up).
door(0, room(26, "hallway", 0, 1), "inner_hallway", down).
door(1, room(26, "hallway", 0, 3), "inner_hallway", down).

room(27, "hallway", 0, 0).
room(27, "hallway", 0, 1).
room(27, "hallway", 0, 2).
room(27, "hallway", 0, 3).
room(27, "hallway", 0, 4).
door(0, room(27, "hallway", 0, 1), "inner_hallway", down).
door(1, room(27, "hallway", 0, 4), "inner_hallway", down).
door(0, room(27, "hallway", 0, 4), "bathroom", up).

room(28, "hallway", 0, 0).
room(28, "hallway", 0, 1).
room(28, "hallway", 0, 2).
room(28, "hallway", 0, 3).
room(28, "hallway", 0, 4).
door(0, room(28, "hallway", 0, 0), "bathroom", up).
door(0, room(28, "hallway", 0, 0), "inner_hallway", down).
door(1, room(28, "hallway", 0, 4), "inner_hallway", down).

% inner hallway
% bathroom
% office
% lecture hall
% standard classroom



% ----------------------------------------------------------------------------------

% map
rows(0..map_size).
cols(0..map_size).
map(X,Y) :- rows(X), cols(Y).

% generate starting hallway room
starting_room_id(@delta(randint(0, hallway_configurations - 1))).
starting_room(ID, "hallway", X, Y) :- room(ID, "hallway", X, Y), starting_room_id(ID).

placed(room(ID, "hallway", 0, 0), X_r, Y_r) :- starting_room(ID, "hallway", 0, 0), X_r = map_size/2, Y_r = map_size/2.
placed(room(ID, "hallway", X, Y), X_r, Y_r) :- starting_room(ID, "hallway", X, Y), X_r = map_size/2 + X, Y_r = map_size/2 + Y.

:- placed(room(ID, "hallway", X, Y), X_r, Y_r), not map(X_r, Y_r).
:- placed(room(ID, ROOM_TYPE, X1, Y1), X_r1, Y_r1), placed(room(ID2, ROOM_TYPE, X2, Y2), X_r2, Y_r2), ID != ID2, X_r1 = X_r2, Y_r1 = Y_r2.


#show placed/3.





