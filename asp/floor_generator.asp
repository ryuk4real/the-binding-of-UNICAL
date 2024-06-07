% room(id,type,x_relative,y_relative)
% door(id,room,door_type,direction)

#const map_size = 9.
#const n_rooms = 10.

#const hallway_configurations = 28.
#const inner_hallway_configurations = 56.

#const up = 1.
#const down = -1.
#const left = 2.
#const right = -2.

% rooms --------------------------------------------------------------------------

% hallway
room(0, "hallway", 0, 0..2).
door(0, room(0, "hallway", 0, 1), "inner_hallway", down).
door(0, room(0, "hallway", 0, 2), "bathroom", up).

room(1, "hallway", 0, 0..2).
door(0, room(0, "hallway", 0, 0), "inner_hallway", down).
door(0, room(0, "hallway", 0, 2), "bathroom", up).

room(2, "hallway", 0, 0..2).
door(0, room(2, "hallway", 0, 0), "bathroom", up).
door(0, room(2, "hallway", 0, 2), "inner_hallway", down).

room(3, "hallway", 0, 0..2).
door(0, room(3, "hallway", 0, 0), "bathroom", up).
door(1, room(3, "hallway", 0, 2), "bathroom", right).
door(0, room(3, "hallway", 0, 1), "inner_hallway", down).

room(4, "hallway", 0, 0..2).
door(0, room(4, "hallway", 0, 0), "inner_hallway", down).
door(1, room(4, "hallway", 0, 2), "inner_hallway", down).
door(0, room(4, "hallway", 0, 2), "bathroom", up).

room(5, "hallway", 0, 0..2).
door(0, room(5, "hallway", 0, 2), "inner_hallway", down).
door(1, room(5, "hallway", 0, 2), "bathroom", up).

room(6, "hallway", 0, 0..2).
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

room(19, "hallway", 0, 0..3).
door(0, room(19, "hallway", 0, 0), "inner_hallway", down).
door(1, room(19, "hallway", 0, 2), "inner_hallway", down).
door(0, room(19, "hallway", 0, 3), "bathroom", up).

room(20, "hallway", 0, 0..3).
door(0, room(20, "hallway", 0, 2), "inner_hallway", down).
door(1, room(20, "hallway", 0, 3), "inner_hallway", up).
door(0, room(20, "hallway", 0, 0), "bathroom", down).

room(21, "hallway", 0, 0..3).
door(0, room(21, "hallway", 0, 1), "inner_hallway", down).
door(1, room(21, "hallway", 0, 3), "inner_hallway", down).
door(0, room(21, "hallway", 0, 2), "bathroom", up).

room(22, "hallway", 0, 0..3).
door(0, room(22, "hallway", 0, 0), "bathroom", up).
door(0, room(22, "hallway", 0, 1), "inner_hallway", down).
door(1, room(22, "hallway", 0, 3), "inner_hallway", down).

room(23, "hallway", 0, 0..3).
door(0, room(23, "hallway", 0, 0), "inner_hallway", up).
door(1, room(23, "hallway", 0, 1), "inner_hallway", down).
door(0, room(23, "hallway", 0, 3), "bathroom", down).

room(24, "hallway", 0, 0..3).
door(0, room(24, "hallway", 0, 0), "bathroom", up).
door(0, room(24, "hallway", 0, 0), "inner_hallway", down).
door(1, room(24, "hallway", 0, 3), "inner_hallway", down).

room(25, "hallway", 0, 0..4).
door(0, room(25, "hallway", 0, 1), "inner_hallway", down).
door(1, room(25, "hallway", 0, 3), "inner_hallway", down).
door(0, room(25, "hallway", 0, 4), "bathroom", up).

room(26, "hallway", 0, 0..4).
door(0, room(26, "hallway", 0, 0), "bathroom", up).
door(0, room(26, "hallway", 0, 1), "inner_hallway", down).
door(1, room(26, "hallway", 0, 3), "inner_hallway", down).

room(27, "hallway", 0, 0..4).
door(0, room(27, "hallway", 0, 1), "inner_hallway", down).
door(1, room(27, "hallway", 0, 4), "inner_hallway", down).
door(0, room(27, "hallway", 0, 4), "bathroom", up).

room(28, "hallway", 0, 0..4).
door(0, room(28, "hallway", 0, 0), "bathroom", up).
door(0, room(28, "hallway", 0, 0), "inner_hallway", down).
door(1, room(28, "hallway", 0, 4), "inner_hallway", down).




% inner hallway

room(0, "inner_hallway", 0..1, 0).
door(0, room(0, "inner_hallway", 0, 0), "hallway", up).
door(0, room(0, "inner_hallway", 1, 0), "office", left).
door(1, room(0, "inner_hallway", 1, 0), "office", down).
door(2, room(0, "inner_hallway", 1, 0), "office", right).

room(1, "inner_hallway", 0..1, 0).
door(0, room(1, "inner_hallway", 0, 0), "hallway", up).
door(0, room(1, "inner_hallway", 1, 0), "office", left).
door(1, room(1, "inner_hallway", 1, 0), "office", down).
door(2, room(1, "inner_hallway", 0, 0), "office", right).

room(2, "inner_hallway", 0..1, 0).
door(0, room(2, "inner_hallway", 0, 0), "hallway", up).
door(0, room(2, "inner_hallway", 1, 0), "office", left).
door(1, room(2, "inner_hallway", 1, 0), "office", right).

room(3, "inner_hallway", 0..1, 0).
door(0, room(3, "inner_hallway", 0, 0), "hallway", up).
door(0, room(3, "inner_hallway", 1, 0), "office", left).
door(1, room(3, "inner_hallway", 0, 0), "office", right).

room(4, "inner_hallway", 0..1, 0).
door(0, room(4, "inner_hallway", 0, 0), "hallway", up).
door(0, room(4, "inner_hallway", 1, 0), "inner_hallway", down).
door(0, room(4, "inner_hallway", 1, 0), "office", left).
door(1, room(4, "inner_hallway", 0, 0), "office", right).

room(5, "inner_hallway", 0..1, 0).
door(0, room(5, "inner_hallway", 0, 0), "hallway", up).
door(0, room(5, "inner_hallway", 1, 0), "inner_hallway", down).
door(0, room(5, "inner_hallway", 0, 0), "office", left).
door(1, room(5, "inner_hallway", 1, 0), "office", right).

room(6, "inner_hallway", 0..1, 0)
room(6, "inner_hallway", 1, 0).
door(0, room(6, "inner_hallway", 0, 0), "hallway", up).
door(0, room(6, "inner_hallway", 1, 0), "inner_hallway", down).
door(0, room(6, "inner_hallway", 1, 0), "office", right).
door(1, room(6, "inner_hallway", 1, 0), "office", left).

room(7, "inner_hallway", 0..1, 0).
door(0, room(7, "inner_hallway", 1, 0), "hallway", down).
door(0, room(7, "inner_hallway", 0, 0), "office", up).
door(1, room(7, "inner_hallway", 0, 0), "office", right).

room(8, "inner_hallway", 0..1, 0).
door(0, room(8, "inner_hallway", 1, 0), "hallway", down).
door(0, room(8, "inner_hallway", 0, 0), "office", up).
door(1, room(8, "inner_hallway", 0, 0), "office", right).

room(9, "inner_hallway", 0..1, 0).
door(0, room(9, "inner_hallway", 1, 0), "hallway", down).
door(0, room(9, "inner_hallway", 0, 0), "office", left).
door(1, room(9, "inner_hallway", 0, 0), "office", right).

room(10, "inner_hallway", 0..1, 0).
door(0, room(10, "inner_hallway", 1, 0), "hallway", down).
door(0, room(10, "inner_hallway", 0, 0), "office", up).
door(1, room(10, "inner_hallway", 1, 0), "office", right).

room(11, "inner_hallway", 0..1, 0).
door(0, room(11, "inner_hallway", 1, 0), "hallway", down).
door(0, room(11, "inner_hallway", 0, 0), "office", up).
door(1, room(11, "inner_hallway", 1, 0), "office", left).

room(12, "inner_hallway", 0..1, 0).
door(0, room(12, "inner_hallway", 1, 0), "hallway", down).
door(0, room(12, "inner_hallway", 0, 0), "office", up).
door(1, room(12, "inner_hallway", 1, 0), "office", right).

room(13, "inner_hallway", 0..1, 0).
door(0, room(13, "inner_hallway", 1, 0), "hallway", down).
door(0, room(13, "inner_hallway", 0, 0), "office", up).

room(14, "inner_hallway", 0..2, 0).
door(0, room(14, "inner_hallway", 0, 0), "hallway", up).
door(0, room(14, "inner_hallway", 0, 0), "office", left).
door(1, room(14, "inner_hallway", 0, 0), "office", right).
door(2, room(14, "inner_hallway", 2, 0), "office", left).
door(3, room(14, "inner_hallway", 2, 0), "office", right).
door(4, room(14, "inner_hallway", 2, 0), "office", down).

room(15, "inner_hallway", 0..2, 0).
door(0, room(14, "inner_hallway", 0, 0), "hallway", up).
door(0, room(14, "inner_hallway", 0, 0), "office", left).
door(1, room(14, "inner_hallway", 2, 0), "office", left).
door(2, room(14, "inner_hallway", 2, 0), "office", right).

room(16, "inner_hallway", 0..2, 0).
door(0, room(14, "inner_hallway", 0, 0), "hallway", up).
door(0, room(14, "inner_hallway", 0, 0), "office", right).
door(1, room(14, "inner_hallway", 2, 0), "office", left).
door(2, room(14, "inner_hallway", 2, 0), "office", right).

room(17, "inner_hallway", 0..2, 0).
door(0, room(14, "inner_hallway", 0, 0), "hallway", up).
door(0, room(14, "inner_hallway", 1, 0), "office", left).
door(1, room(14, "inner_hallway", 1, 0), "office", rigth).

room(18, "inner_hallway", 0..2, 0).
door(0, room(14, "inner_hallway", 0, 0), "hallway", up).
door(0, room(14, "inner_hallway", 0, 0), "office", right).
door(1, room(14, "inner_hallway", 1, 0), "office", left).
door(2, room(14, "inner_hallway", 2, 0), "office", right).

room(19, "inner_hallway", 0..2, 0).
door(0, room(19, "inner_hallway", 0, 0), "hallway", up).
door(0, room(19, "inner_hallway", 0, 0), "office", left).
door(1, room(19, "inner_hallway", 2, 0), "office", left).
door(2, room(19, "inner_hallway", 1, 0), "office", right).

room(20, "inner_hallway", 0..2, 0).
door(0, room(20, "inner_hallway", 0, 0), "hallway", up).
door(0, room(20, "inner_hallway", 1, 0), "office", left).
door(1, room(20, "inner_hallway", 1, 0), "office", right).
door(2, room(20, "inner_hallway", 2, 0), "office", down).

room(21, "inner_hallway", 0..2, 0).
door(0, room(21, "inner_hallway", 2, 0), "hallway", down).
door(0, room(21, "inner_hallway", 0, 0), "office", left).
door(1, room(21, "inner_hallway", 0, 0), "office", right).
door(2, room(21, "inner_hallway", 2, 0), "office", left).
door(3, room(21, "inner_hallway", 2, 0), "office", right).
door(4, room(21, "inner_hallway", 0, 0), "office", up).

room(22, "inner_hallway", 0..2, 0).
door(0, room(22, "inner_hallway", 2, 0), "hallway", down).
door(0, room(22, "inner_hallway", 0, 0), "office", left).
door(1, room(22, "inner_hallway", 2, 0), "office", left).
door(2, room(22, "inner_hallway", 2, 0), "office", right).
door(3, room(22, "inner_hallway", 0, 0), "office", up).

room(23, "inner_hallway", 0..2, 0).
door(0, room(23, "inner_hallway", 2, 0), "hallway", down).
door(0, room(23, "inner_hallway", 0, 0), "office", left).
door(1, room(23, "inner_hallway", 0, 0), "office", right).
door(2, room(23, "inner_hallway", 2, 0), "office", right).
door(3, room(23, "inner_hallway", 0, 0), "office", up).

room(24, "inner_hallway", 0..2, 0).
door(0, room(24, "inner_hallway", 2, 0), "hallway", down).
door(0, room(24, "inner_hallway", 1, 0), "office", left).
door(1, room(24, "inner_hallway", 1, 0), "office", right).
door(2, room(24, "inner_hallway", 2, 0), "office", up).

room(25, "inner_hallway", 0..2, 0).
door(0, room(25, "inner_hallway", 2, 0), "hallway", down).
door(0, room(25, "inner_hallway", 1, 0), "office", left).
door(1, room(25, "inner_hallway", 2, 0), "office", right).
door(2, room(25, "inner_hallway", 0, 0), "office", right).

room(26, "inner_hallway", 0..2, 0).
door(0, room(26, "inner_hallway", 2, 0), "hallway", down).
door(0, room(26, "inner_hallway", 1, 0), "office", right).
door(1, room(26, "inner_hallway", 2, 0), "office", left).
door(2, room(26, "inner_hallway", 0, 0), "office", left).

room(27, "inner_hallway", 0..2, 0).
door(0, room(27, "inner_hallway", 2, 0), "hallway", down).
door(0, room(27, "inner_hallway", 1, 0), "office", right).
door(1, room(27, "inner_hallway", 1, 0), "office", left).

room(28, "inner_hallway", 0..1, 0).
door(0, room(28, "inner_hallway", 0, 0), "hallway", up).
door(0, room(28, "inner_hallway", 1, 0), "classroom", left).
door(1, room(28, "inner_hallway", 1, 0), "classroom", right).
door(2, room(28, "inner_hallway", 1, 0), "classroom", down).

room(29, "inner_hallway", 0..1, 0).
door(0, room(29, "inner_hallway", 0, 0), "hallway", up).
door(0, room(29, "inner_hallway", 1, 0), "classroom", left).
door(1, room(29, "inner_hallway", 1, 0), "classroom", down).
door(2, room(29, "inner_hallway", 0, 0), "classroom", right).

room(30, "inner_hallway", 0..1, 0).
door(0, room(30, "inner_hallway", 0, 0), "hallway", up).
door(0, room(30, "inner_hallway", 1, 0), "classroom", left).
door(1, room(30, "inner_hallway", 1, 0), "classroom", right).

room(31, "inner_hallway", 0..1, 0).
door(0, room(31, "inner_hallway", 0, 0), "hallway", up).
door(0, room(31, "inner_hallway", 1, 0), "classroom", left).
door(1, room(31, "inner_hallway", 0, 0), "classroom", right).

room(32, "inner_hallway", 0..1, 0).
door(0, room(32, "inner_hallway", 0, 0), "hallway", up).
door(0, room(32, "inner_hallway", 1, 0), "classroom", left).
door(1, room(32, "inner_hallway", 0, 0), "classroom", right).
door(0, room(32, "inner_hallway", 1, 0), "inner_hallway", down).

room(33, "inner_hallway", 0..1, 0).
door(0, room(33, "inner_hallway", 0, 0), "hallway", up).
door(0, room(33, "inner_hallway", 1, 0), "inner_hallway", down).
door(0, room(33, "inner_hallway", 0, 0), "classroom", left).
door(1, room(33, "inner_hallway", 1, 0), "classroom", right).

room(34, "inner_hallway", 0..1, 0).
door(0, room(34, "inner_hallway", 0, 0), "hallway", up).
door(0, room(34, "inner_hallway", 1, 0), "inner_hallway", down).
door(0, room(34, "inner_hallway", 1, 0), "classroom", left).
door(1, room(34, "inner_hallway", 1, 0), "classroom", right).

room(35, "inner_hallway", 0..1, 0).
door(0, room(35, "inner_hallway", 1, 0), "hallway", down).
door(0, room(35, "inner_hallway", 0, 0), "classroom", up).
door(1, room(35, "inner_hallway", 0, 0), "classroom", right).

room(36, "inner_hallway", 0..1, 0).
door(0, room(36, "inner_hallway", 1, 0), "hallway", down).
door(0, room(36, "inner_hallway", 0, 0), "classroom", up).
door(1, room(36, "inner_hallway", 0, 0), "classroom", left).

room(37, "inner_hallway", 0..1, 0).
door(0, room(37, "inner_hallway", 1, 0), "hallway", down).
door(0, room(37, "inner_hallway", 0, 0), "classroom", left).
door(1, room(37, "inner_hallway", 0, 0), "classroom", right).

room(38, "inner_hallway", 0..1, 0).
door(0, room(38, "inner_hallway", 1, 0), "hallway", down).
door(0, room(38, "inner_hallway", 0, 0), "classroom", up).
door(1, room(38, "inner_hallway", 1, 0), "classroom", right).

room(39, "inner_hallway", 0..1, 0).
door(0, room(39, "inner_hallway", 1, 0), "hallway", down).
door(0, room(39, "inner_hallway", 1, 0), "classroom", left).
door(1, room(39, "inner_hallway", 0, 0), "classroom", up).

room(40, "inner_hallway", 0..1, 0).
door(0, room(40, "inner_hallway", 1, 0), "hallway", down).
door(0, room(40, "inner_hallway", 0, 0), "classroom", up).
door(1, room(40, "inner_hallway", 1, 0), "classroom", right).

room(41, "inner_hallway", 0..1, 0).
door(0, room(41, "inner_hallway", 1, 0), "hallway", down).
door(0, room(41, "inner_hallway", 0, 0), "classroom", up).

room(42, "inner_hallway", 0..2, 0).
door(0, room(42, "inner_hallway", 0, 0), "hallway", up).
door(0, room(42, "inner_hallway", 0, 0), "classroom", left).
door(1, room(42, "inner_hallway", 2, 0), "classroom", left).
door(2, room(42, "inner_hallway", 2, 0), "classroom", down).
door(3, room(42, "inner_hallway", 2, 0), "classroom", right).
door(4, room(42, "inner_hallway", 0, 0), "classroom", right).

room(43, "inner_hallway", 0..2, 0).
door(0, room(43, "inner_hallway", 0, 0), "hallway", up).
door(0, room(43, "inner_hallway", 0, 0), "classroom", left).
door(1, room(43, "inner_hallway", 2, 0), "classroom", left).
door(2, room(43, "inner_hallway", 2, 0), "classroom", right).

room(44, "inner_hallway", 0..2, 0).
door(0, room(44, "inner_hallway", 0, 0), "hallway", up).
door(0, room(44, "inner_hallway", 2, 0), "classroom", left).
door(1, room(44, "inner_hallway", 0, 0), "classroom", right).
door(2, room(44, "inner_hallway", 2, 0), "classroom", right).

room(45, "inner_hallway", 0..2, 0).
door(0, room(45, "inner_hallway", 0, 0), "hallway", up).
door(0, room(45, "inner_hallway", 1, 0), "classroom", left).
door(1, room(45, "inner_hallway", 2, 0), "classroom", left).

room(46, "inner_hallway", 0..2, 0).
door(0, room(46, "inner_hallway", 0, 0), "hallway", up).
door(0, room(46, "inner_hallway", 0, 0), "classroom", right).
door(1, room(46, "inner_hallway", 1, 0), "classroom", left).
door(2, room(46, "inner_hallway", 2, 0), "classroom", right).

room(47, "inner_hallway", 0..2, 0).
door(0, room(47, "inner_hallway", 0, 0), "hallway", up).
door(0, room(47, "inner_hallway", 0, 0), "classroom", left).
door(1, room(47, "inner_hallway", 2, 0), "classroom", left).
door(2, room(47, "inner_hallway", 1, 0), "classroom", right).

room(48, "inner_hallway", 0..2, 0).
door(0, room(48, "inner_hallway", 0, 0), "hallway", up).
door(0, room(48, "inner_hallway", 1, 0), "classroom", left).
door(1, room(48, "inner_hallway", 1, 0), "classroom", right).
door(2, room(48, "inner_hallway", 2, 0), "classroom", down).

room(49, "inner_hallway", 0..2, 0).
door(0, room(49, "inner_hallway", 2, 0), "hallway", down).
door(0, room(49, "inner_hallway", 0, 0), "classroom", left).
door(1, room(49, "inner_hallway", 0, 0), "classroom", right).
door(2, room(49, "inner_hallway", 2, 0), "classroom", left).
door(3, room(49, "inner_hallway", 2, 0), "classroom", right).
door(4, room(49, "inner_hallway", 0, 0), "classroom", up).

room(50, "inner_hallway", 0..2, 0).
door(0, room(50, "inner_hallway", 2, 0), "hallway", down).
door(0, room(50, "inner_hallway", 0, 0), "classroom", left).
door(1, room(50, "inner_hallway", 2, 0), "classroom", left).
door(2, room(50, "inner_hallway", 2, 0), "classroom", right).
door(3, room(50, "inner_hallway", 0, 0), "classroom", up).

room(51, "inner_hallway", 0..2, 0).
door(0, room(51, "inner_hallway", 2, 0), "hallway", down).
door(0, room(51, "inner_hallway", 0, 0), "classroom", left).
door(1, room(51, "inner_hallway", 0, 0), "classroom", right).
door(2, room(51, "inner_hallway", 2, 0), "classroom", right).
door(3, room(51, "inner_hallway", 0, 0), "classroom", up).

room(52, "inner_hallway", 0..2, 0).
door(0, room(52, "inner_hallway", 2, 0), "hallway", down).
door(0, room(52, "inner_hallway", 1, 0), "classroom", left).
door(1, room(52, "inner_hallway", 1, 0), "classroom", right).
door(2, room(52, "inner_hallway", 0, 0), "classroom", up).

room(53, "inner_hallway", 0..2, 0).
door(0, room(53, "inner_hallway", 2, 0), "hallway", down).
door(0, room(53, "inner_hallway", 1, 0), "classroom", right).
door(1, room(53, "inner_hallway", 2, 0), "classroom", left).
door(2, room(53, "inner_hallway", 0, 0), "classroom", right).

room(54, "inner_hallway", 0..2, 0).
door(0, room(54, "inner_hallway", 2, 0), "hallway", down).
door(0, room(54, "inner_hallway", 1, 0), "classroom", right).
door(1, room(54, "inner_hallway", 2, 0), "classroom", left).
door(2, room(54, "inner_hallway", 0, 0), "classroom", left).

room(55, "inner_hallway", 0..2, 0).
door(0, room(55, "inner_hallway", 2, 0), "hallway", down).
door(0, room(55, "inner_hallway", 1, 0), "classroom", left).
door(1, room(55, "inner_hallway", 1, 0), "classroom", right).




% bathroom

room(0, "bathroom", 0, 0..1).
door(0, room(0, "bathroom", 0, 0), "hallway", down).

room(1, "bathroom", 0, 0..1).
door(0, room(1, "bathroom", 0, 0), "hallway", up).

room(2, "bathroom", 0, 0..1).
door(0, room(2, "bathroom", 0, 1), "hallway", up).

room(3, "bathroom", 0, 0..1).
door(0, room(3, "bathroom", 0, 1), "hallway", down).

room(4, "bathroom", 0, 0..1).
door(0, room(4, "bathroom", 0, 1), "hallway", right).

room(5, "bathroom", 0, 0..1).
door(0, room(5, "bathroom", 0, 0), "hallway", left).

room(6, "bathroom", 0..1, 0..1).
door(0, room(6, "bathroom", 0, 0), "hallway", up).

room(7, "bathroom", 0..1, 0..1).
door(0, room(6, "bathroom", 1, 0), "hallway", down).

room(8, "bathroom", 0, 0..1).
door(0, room(4, "bathroom", 0, 0), "hallway", left).




% office

room(0, "office", 0..1, 0..1).
door(0, room(0, "office", 0, 0), "hallway", left).

room(1, "office", 0..1, 0..1).
door(0, room(1, "office", 1, 0), "hallway", left).

room(2, "office", 0..1, 0..1).
door(0, room(2, "office", 1, 0), "hallway", down).

room(3, "office", 0..1, 0..1).
door(0, room(3, "office", 1, 1), "hallway", down).

room(4, "office", 0..1, 0..1).
door(0, room(4, "office", 1, 1), "hallway", right).

room(5, "office", 0..1, 0..1).
door(0, room(5, "office", 0, 1), "hallway", right).

room(6, "office", 0..1, 0..1).
door(0, room(6, "office", 0, 1), "hallway", up).

room(7, "office", 0..1, 0..1).
door(0, room(7, "office", 0, 0), "hallway", up).



% classroom
% lecture hall

room(0, "classroom", 0..9, 0..7).
door(0, room(0, "classroom", 1, 0), "inner_hallway", left).

room(1, "classroom", 0..9, 0..7).
door(0, room(0, "classroom", 8, 7 ), "inner_hallway", right).

room(2, "classroom", 0..9, 0..7).
door(0, room(0, "classroom", 1, 7), "inner_hallway", right).

room(3, "classroom", 0..9, 0..7).
door(0, room(0, "classroom", 8, 0), "inner_hallway", left).

% classroom
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





