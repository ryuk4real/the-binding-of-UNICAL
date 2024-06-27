% room(id,type,x_relative,y_relative)
% door(id,room,door_type,direction)

#const map_size = 100.
#const n_rooms = 10.

#const hallway_configurations = 28.
#const inner_hallway_configurations = 56.
#const bathroom_configurations = 9.
#const office_configurations = 8.
#const classroom_configurations = 28.

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
door(0, room(1, "hallway", 0, 0), "inner_hallway", down).
door(0, room(1, "hallway", 0, 2), "bathroom", up).

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

room(6, "inner_hallway", 0..1, 0).
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
door(0, room(15, "inner_hallway", 0, 0), "hallway", up).
door(0, room(15, "inner_hallway", 0, 0), "office", left).
door(1, room(15, "inner_hallway", 2, 0), "office", left).
door(2, room(15, "inner_hallway", 2, 0), "office", right).

room(16, "inner_hallway", 0..2, 0).
door(0, room(16, "inner_hallway", 0, 0), "hallway", up).
door(0, room(16, "inner_hallway", 0, 0), "office", right).
door(1, room(16, "inner_hallway", 2, 0), "office", left).
door(2, room(16, "inner_hallway", 2, 0), "office", right).

room(17, "inner_hallway", 0..2, 0).
door(0, room(17, "inner_hallway", 0, 0), "hallway", up).
door(0, room(17, "inner_hallway", 1, 0), "office", left).
door(1, room(17, "inner_hallway", 1, 0), "office", rigth).

room(18, "inner_hallway", 0..2, 0).
door(0, room(18, "inner_hallway", 0, 0), "hallway", up).
door(0, room(18, "inner_hallway", 0, 0), "office", right).
door(1, room(18, "inner_hallway", 1, 0), "office", left).
door(2, room(18, "inner_hallway", 2, 0), "office", right).

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
door(0, room(7, "bathroom", 1, 0), "hallway", down).

room(8, "bathroom", 0, 0..1).
door(0, room(8, "bathroom", 0, 0), "hallway", left).




% office

room(0, "office", 0..1, 0..1).
door(0, room(0, "office", 0, 0), "inner_hallway", left).

room(1, "office", 0..1, 0..1).
door(0, room(1, "office", 1, 0), "inner_hallway", left).

room(2, "office", 0..1, 0..1).
door(0, room(2, "office", 1, 0), "inner_hallway", down).

room(3, "office", 0..1, 0..1).
door(0, room(3, "office", 1, 1), "inner_hallway", down).

room(4, "office", 0..1, 0..1).
door(0, room(4, "office", 1, 1), "inner_hallway", right).

room(5, "office", 0..1, 0..1).
door(0, room(5, "office", 0, 1), "inner_hallway", right).

room(6, "office", 0..1, 0..1).
door(0, room(6, "office", 0, 1), "inner_hallway", up).

room(7, "office", 0..1, 0..1).
door(0, room(7, "office", 0, 0), "inner_hallway", up).



% classroom
% lecture hall

room(0, "classroom", 0..9, 0..7).
door(0, room(0, "classroom", 1, 0), "inner_hallway", left).

room(1, "classroom", 0..9, 0..7).
door(0, room(1, "classroom", 8, 7 ), "inner_hallway", right).

room(2, "classroom", 0..9, 0..7).
door(0, room(2, "classroom", 1, 7), "inner_hallway", right).

room(3, "classroom", 0..9, 0..7).
door(0, room(3, "classroom", 8, 0), "inner_hallway", left).




% classroom
% standard classroom

room(0, "classroom", 0..1, 0..2).
door(0, room(0, "classroom", 0, 1), "inner_hallway", up).

room(1, "classroom", 0..1, 0..1).
door(0, room(1, "classroom", 0, 0), "inner_hallway", left).

room(2, "classroom", 0..1, 0..1).
door(0, room(2, "classroom", 0, 1), "inner_hallway", right).

room(3, "classroom", 0..2, 0..1).
door(0, room(3, "classroom", 1, 1), "inner_hallway", right).

room(4, "classroom", 0..1, 0..2).
door(0, room(4, "classroom", 0, 1), "inner_hallway", up).

room(5, "classroom", 0..1, 0..2).
door(0, room(5, "classroom", 1, 1), "inner_hallway", down).

room(6, "classroom", 0..1, 0..2).
door(0, room(6, "classroom", 1, 1), "inner_hallway", down).

room(7, "classroom", 0..1, 0..1).
door(0, room(7, "classroom", 1, 1), "inner_hallway", right).

room(8, "classroom", 0..1, 0..1).
door(0, room(8, "classroom", 1, 0), "inner_hallway", left).

room(9, "classroom", 0..1, 0..1).
door(0, room(9, "classroom", 0, 1), "inner_hallway", up).

room(10, "classroom", 0..1, 0..1).
door(0, room(10, "classroom", 1, 1), "inner_hallway", down).

room(11, "classroom", 0..1, 0..1).
door(0, room(11, "classroom", 0, 0), "inner_hallway", up).

room(12, "classroom", 0..1, 0..1).
door(0, room(12, "classroom", 1, 0), "inner_hallway", down).

room(13, "classroom", 0..1, 0..2).
door(0, room(13, "classroom", 0, 2), "inner_hallway", up).

room(14, "classroom", 0..1, 0..2).
door(0, room(14, "classroom", 1, 2), "inner_hallway", down).

room(15, "classroom", 0..1, 0..2).
door(0, room(15, "classroom", 0, 0), "inner_hallway", up).

room(16, "classroom", 0..1, 0..2).
door(0, room(16, "classroom", 1, 0), "inner_hallway", down).

room(17, "classroom", 0..2, 0..1).
door(0, room(17, "classroom", 0, 1), "inner_hallway", left).

room(18, "classroom", 0..2, 0..1).
door(0, room(18, "classroom", 0, 0), "inner_hallway", left).

room(19, "classroom", 0..2, 0..1).
door(0, room(19, "classroom", 0, 1), "inner_hallway", right).

room(20, "classroom", 0..2, 0..1).
door(0, room(20, "classroom", 1, 0), "inner_hallway", left).

room(21, "classroom", 0..2, 0..1).
door(0, room(21, "classroom", 1, 1), "inner_hallway", right).

room(22, "classroom", 0..2, 0..1).
door(0, room(22, "classroom", 2, 0), "inner_hallway", left).

room(23, "classroom", 0..2, 0..1).
door(0, room(23, "classroom", 2, 1), "inner_hallway", right).
% ----------------------------------------------------------------------------------


% map
rows(0..map_size).
cols(0..map_size).
map(X,Y) :- rows(X), cols(Y).

% directions
opposite(up, down).
opposite(left, right).
opposite(right, left).
opposite(down, up).

% atoms to single coordinates
x_pos_room(ROOM_ID, ROOM_TYPE, X) :- room(ROOM_ID, ROOM_TYPE, X, Y).
y_pos_room(ROOM_ID, ROOM_TYPE, Y) :- room(ROOM_ID, ROOM_TYPE, X, Y).

x_pos_room_door(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, X) :- door(DOOR_ID, room(ROOM_ID, ROOM_TYPE, X, Y), DOOR_TYPE, DIRECTION).
y_pos_room_door(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Y) :- door(DOOR_ID, room(ROOM_ID, ROOM_TYPE, X, Y), DOOR_TYPE, DIRECTION).

% ----------------------------------------------------------------------------------

% Count the number of old rooms
n_old_rooms(N) :- N = #count { ROOM_ID, ROOM_TYPE : placed_old(ROOM_ID, ROOM_TYPE, _, _, _, _) }.

% Randomly choose hallway room if no other room is already placed
placed_new(ROOM_ID, ROOM_TYPE, X, Y, Xr, Yr) :-
    n_old_rooms(0),
    ROOM_ID = @delta(randint(0, hallway_configurations)),
    ROOM_TYPE = "hallway",
    X = 0,
    Y = 0,
    Xr = map_size/2,
    Yr = map_size/2.


% Place all the tiles if a tile of the same room is already placed
placed_new(ROOM_ID1, ROOM_TYPE1, X1, Y1, Xr1, Yr1) :-
    x_placed_new(ROOM_ID1, ROOM_TYPE1, X2, Xr2),
    y_placed_new(ROOM_ID1, ROOM_TYPE1, Y2, Yr2),
    x_pos_room(ROOM_ID1, ROOM_TYPE1, X2),
    y_pos_room(ROOM_ID1, ROOM_TYPE1, Y2),
    x_pos_room(ROOM_ID1, ROOM_TYPE1, X1),
    y_pos_room(ROOM_ID1, ROOM_TYPE1, Y1),
    Xr1 = Xr2 + X1 - X2,
    Yr1 = Yr2 + Y1 - Y2.


% A room can't be placed outside the map
:- placed_new(ROOM_ID, ROOM_TYPE, X, Y, Xr, Yr), not map(Xr, Yr).

% Two rooms can't be placed in the same map coordinates
:- placed_new(ROOM_ID, ROOM_TYPE, _, _, Xr, Yr),
    placed_new(ROOM_ID2, ROOM_TYPE2, _, _, Xr, Yr),
    ROOM_ID != ROOM_ID2.

% atoms to single coordinates
x_placed_new(ROOM_ID, ROOM_TYPE, X, Xr) :- placed_new(ROOM_ID, ROOM_TYPE, X, _, Xr, _).
y_placed_new(ROOM_ID, ROOM_TYPE, Y, Yr) :- placed_new(ROOM_ID, ROOM_TYPE, _, Y, _, Yr).
x_placed_old(ROOM_ID, ROOM_TYPE, X, Xr) :- placed_old(ROOM_ID, ROOM_TYPE, X, _, Xr, _).
y_placed_old(ROOM_ID, ROOM_TYPE, Y, Yr) :- placed_old(ROOM_ID, ROOM_TYPE, _, Y, _, Yr).

% A new room can't be placed on top of an old room
:- placed_old(ROOM_ID, ROOM_TYPE, _, _, Xr, Yr),
    placed_new(ROOM_ID2, ROOM_TYPE2, _, _, Xr, Yr),
    ROOM_ID != ROOM_ID2.


placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr, Yr):-
    x_placed_old(ROOM_ID, ROOM_TYPE, X, Xr),
    y_placed_old(ROOM_ID, ROOM_TYPE, Y, Yr),
    x_pos_room_door(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, X),
    y_pos_room_door(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Y).

x_placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr):-
    placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr, _).

y_placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Yr):-
    placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, _, Yr).

% Guess connections
{ connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2) :
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Xr1),
    y_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Yr1),
    x_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Xr2),
    y_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Yr2),
    opposite(DIRECTION1, DIRECTION2),
    DOOR_TYPE1 = ROOM_TYPE2,
    DOOR_TYPE2 = ROOM_TYPE1
}.

% Place a new room if exist a valid connection based on door direction
placed_new(ROOM_ID2, ROOM_TYPE2, X2, Y2, Xr2, Yr2) :-
    connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Xr1),
    y_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Yr1),
    x_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, X2),
    y_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Y2),
    not placed_old(ROOM_ID2, ROOM_TYPE2, _, _, _, _),
    DIRECTION1 = up,
    DIRECTION2 = down,
    Xr2 = Xr1 - 1,
    Yr2 = Yr1.

placed_new(ROOM_ID2, ROOM_TYPE2, X2, Y2, Xr2, Yr2) :-
    connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Xr1),
    y_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Yr1),
    x_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, X2),
    y_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Y2),
    not placed_old(ROOM_ID2, ROOM_TYPE2, _, _, _, _),
    DIRECTION1 = down,
    DIRECTION2 = up,
    Xr2 = Xr1 + 1,
    Yr2 = Yr1.

placed_new(ROOM_ID2, ROOM_TYPE2, X2, Y2, Xr2, Yr2) :-
    connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Xr1),
    y_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Yr1),
    x_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, X2),
    y_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Y2),
    not placed_old(ROOM_ID2, ROOM_TYPE2, _, _, _, _),
    DIRECTION1 = left,
    DIRECTION2 = right,
    Xr2 = Xr1,
    Yr2 = Yr1 - 1.

placed_new(ROOM_ID2, ROOM_TYPE2, X2, Y2, Xr2, Yr2) :-
    connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Xr1),
    y_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Yr1),
    x_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, X2),
    y_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Y2),
    not placed_old(ROOM_ID2, ROOM_TYPE2, _, _, _, _),
    DIRECTION1 = right,
    DIRECTION2 = left,
    Xr2 = Xr1,
    Yr2 = Yr1 + 1.

placed_door_new(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr, Yr):-
    x_placed_new(ROOM_ID, ROOM_TYPE, X, Xr),
    y_placed_new(ROOM_ID, ROOM_TYPE, Y, Yr),
    x_pos_room_door(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, X),
    y_pos_room_door(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Y).

x_placed_door_new(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr):-
    placed_door_new(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr, _).

y_placed_door_new(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Yr):-
    placed_door_new(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, _, Yr).

% A door can't be connected to two different doors
:- connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID3, ROOM_TYPE3, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID3, DOOR_TYPE3, DIRECTION3),
    ROOM_ID2 != ROOM_ID3.

% A door of an already placed room must have a connection
:- placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr, Yr),
    not connected(ROOM_ID, ROOM_TYPE, _, _, DOOR_ID, DOOR_TYPE, DIRECTION, _, _, _).

% Connections must be simmetric
connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2) :-
    connected(ROOM_ID2, ROOM_TYPE2, ROOM_ID1, ROOM_TYPE1, DOOR_ID2, DOOR_TYPE2, DIRECTION2, DOOR_ID1, DOOR_TYPE1, DIRECTION1).

#show placed_old/6.
#show placed_door_old/7.
#show placed_door_new/7.
#show connected/10.
#show placed_new/6.