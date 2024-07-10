% room(id,type,x_relative,y_relative)
% door(id,room,door_type,direction)

#const map_size = 100.
#const n_rooms = 4.

#const hallway_configurations = 28.
#const inner_hallway_configurations = 56.
#const bathroom_configurations = 9.
#const office_configurations = 8.
#const classroom_configurations = 28.

#const up = 1.
#const down = -1.
#const left = 2.
#const right = -2.

#const type_hallway = 0.
#const type_inner_hallway = 1.
#const type_classroom = 2.
#const type_office = 3.
#const type_bathroom = 4.

%#const type_hallway = "hallway".
%#const type_inner_hallway = "i_hallway".
%#const type_classroom = "class".
%#const type_office = "off".
%#const type_bathroom = "bath".

% rooms --------------------------------------------------------------------------

% hallway
room(0, type_hallway, 0, 0..2).
door(0, room(0, type_hallway, 0, 1), type_inner_hallway, down).
door(0, room(0, type_hallway, 0, 2), type_bathroom, up).

room(1, type_hallway, 0, 0..2).
door(0, room(1, type_hallway, 0, 0), type_inner_hallway, down).
door(0, room(1, type_hallway, 0, 2), type_bathroom, up).

room(2, type_hallway, 0, 0..2).
door(0, room(2, type_hallway, 0, 0), type_bathroom, up).
door(0, room(2, type_hallway, 0, 2), type_inner_hallway, down).

room(3, type_hallway, 0, 0..2).
door(0, room(3, type_hallway, 0, 0), type_bathroom, up).
door(1, room(3, type_hallway, 0, 2), type_bathroom, right).
door(0, room(3, type_hallway, 0, 1), type_inner_hallway, down).

room(4, type_hallway, 0, 0..2).
door(0, room(4, type_hallway, 0, 0), type_inner_hallway, down).
door(1, room(4, type_hallway, 0, 2), type_inner_hallway, down).
door(0, room(4, type_hallway, 0, 2), type_bathroom, up).

room(5, type_hallway, 0, 0..2).
door(0, room(5, type_hallway, 0, 2), type_inner_hallway, down).
door(1, room(5, type_hallway, 0, 2), type_bathroom, up).

room(6, type_hallway, 0, 0..2).
door(0, room(6, type_hallway, 0, 1), type_inner_hallway, down).
door(0, room(6, type_hallway, 0, 0), type_bathroom, up).

room(7, type_hallway, 0, 0).
room(7, type_hallway, 0, 2).
room(7, type_hallway, 1, 0).
room(7, type_hallway, 1, 1).
room(7, type_hallway, 1, 2).
door(0, room(7, type_hallway, 0, 2), type_inner_hallway, up).
door(0, room(7, type_hallway, 1, 2), type_inner_hallway, down).

room(8, type_hallway, 0, 0).
room(8, type_hallway, 0, 2).
room(8, type_hallway, 1, 0).
room(8, type_hallway, 1, 1).
room(8, type_hallway, 1, 2).
door(0, room(8, type_hallway, 0, 0), type_bathroom, up).
door(0, room(8, type_hallway, 1, 0), type_inner_hallway, down).

room(9, type_hallway, 0, 0).
room(9, type_hallway, 0, 2).
room(9, type_hallway, 1, 0).
room(9, type_hallway, 1, 1).
room(9, type_hallway, 1, 2).
door(0, room(9, type_hallway, 0, 0), type_bathroom, up).
door(0, room(9, type_hallway, 1, 1), type_inner_hallway, down).

room(10, type_hallway, 0, 0).
room(10, type_hallway, 0, 2).
room(10, type_hallway, 1, 0).
room(10, type_hallway, 1, 1).
room(10, type_hallway, 1, 2).
door(0, room(10, type_hallway, 0, 0), type_bathroom, up).
door(1, room(10, type_hallway, 0, 2), type_bathroom, right).
door(0, room(10, type_hallway, 1, 0), type_inner_hallway, down).
door(1, room(10, type_hallway, 1, 2), type_inner_hallway, down).

room(11, type_hallway, 0, 0).
room(11, type_hallway, 0, 2).
room(11, type_hallway, 1, 0).
room(11, type_hallway, 1, 1).
room(11, type_hallway, 1, 2).
door(0, room(11, type_hallway, 0, 0), type_inner_hallway, up).
door(1, room(11, type_hallway, 1, 2), type_inner_hallway, down).
door(0, room(11, type_hallway, 1, 0), type_bathroom, left).    

room(12, type_hallway, 0, 0).
room(12, type_hallway, 0, 2).
room(12, type_hallway, 1, 0).
room(12, type_hallway, 1, 1).
room(12, type_hallway, 1, 2).
door(0, room(12, type_hallway, 1, 0), type_inner_hallway, down).
door(0, room(12, type_hallway, 0, 2), type_bathroom, up).

room(13, type_hallway, 0, 0).
room(13, type_hallway, 0, 2).
room(13, type_hallway, 1, 0).
room(13, type_hallway, 1, 1).
room(13, type_hallway, 1, 2).
door(0, room(13, type_hallway, 0, 0), type_inner_hallway, up).
door(1, room(13, type_hallway, 1, 1), type_inner_hallway, down).
door(0, room(13, type_hallway, 1, 2), type_bathroom, right).

room(14, type_hallway, 0, 0).
room(14, type_hallway, 0, 2).
room(14, type_hallway, 1, 0).
room(14, type_hallway, 1, 1).
room(14, type_hallway, 1, 2).
door(0, room(14, type_hallway, 0, 0), type_inner_hallway, up).
door(1, room(14, type_hallway, 1, 0), type_inner_hallway, down).
door(2, room(14, type_hallway, 1, 2), type_inner_hallway, down).
door(0, room(14, type_hallway, 0, 2), type_bathroom, right).

room(15, type_hallway, 0, 0).
room(15, type_hallway, 1, 0).
room(15, type_hallway, 1, 1).
room(15, type_hallway, 1, 2).
door(0, room(15, type_hallway, 1, 0), type_inner_hallway, down).
door(1, room(15, type_hallway, 1, 2), type_inner_hallway, down).
door(0, room(15, type_hallway, 1, 2), type_bathroom, up).

room(16, type_hallway, 0, 0).
room(16, type_hallway, 1, 0).
room(16, type_hallway, 1, 1).
room(16, type_hallway, 1, 2).
door(0, room(16, type_hallway, 1, 1), type_inner_hallway, down).
door(0, room(16, type_hallway, 1, 2), type_bathroom, right).

room(17, type_hallway, 0, 2).
room(17, type_hallway, 1, 0).
room(17, type_hallway, 1, 1).
room(17, type_hallway, 1, 2).
door(0, room(17, type_hallway, 1, 1), type_inner_hallway, down).
door(0, room(17, type_hallway, 1, 0), type_bathroom, up).

room(18, type_hallway, 0, 2).
room(18, type_hallway, 1, 0).
room(18, type_hallway, 1, 1).
room(18, type_hallway, 1, 2).
door(0, room(18, type_hallway, 1, 0), type_inner_hallway, down).
door(1, room(18, type_hallway, 1, 2), type_bathroom, down).
door(0, room(18, type_hallway, 1, 0), type_bathroom, up).

room(19, type_hallway, 0, 0..3).
door(0, room(19, type_hallway, 0, 0), type_inner_hallway, down).
door(1, room(19, type_hallway, 0, 2), type_inner_hallway, down).
door(0, room(19, type_hallway, 0, 3), type_bathroom, up).

room(20, type_hallway, 0, 0..3).
door(0, room(20, type_hallway, 0, 2), type_inner_hallway, down).
door(1, room(20, type_hallway, 0, 3), type_inner_hallway, up).
door(0, room(20, type_hallway, 0, 0), type_bathroom, down).

room(21, type_hallway, 0, 0..3).
door(0, room(21, type_hallway, 0, 1), type_inner_hallway, down).
door(1, room(21, type_hallway, 0, 3), type_inner_hallway, down).
door(0, room(21, type_hallway, 0, 2), type_bathroom, up).

room(22, type_hallway, 0, 0..3).
door(0, room(22, type_hallway, 0, 0), type_bathroom, up).
door(0, room(22, type_hallway, 0, 1), type_inner_hallway, down).
door(1, room(22, type_hallway, 0, 3), type_inner_hallway, down).

room(23, type_hallway, 0, 0..3).
door(0, room(23, type_hallway, 0, 0), type_inner_hallway, up).
door(1, room(23, type_hallway, 0, 1), type_inner_hallway, down).
door(0, room(23, type_hallway, 0, 3), type_bathroom, down).

room(24, type_hallway, 0, 0..3).
door(0, room(24, type_hallway, 0, 0), type_bathroom, up).
door(0, room(24, type_hallway, 0, 0), type_inner_hallway, down).
door(1, room(24, type_hallway, 0, 3), type_inner_hallway, down).

room(25, type_hallway, 0, 0..4).
door(0, room(25, type_hallway, 0, 1), type_inner_hallway, down).
door(1, room(25, type_hallway, 0, 3), type_inner_hallway, down).
door(0, room(25, type_hallway, 0, 4), type_bathroom, up).

room(26, type_hallway, 0, 0..4).
door(0, room(26, type_hallway, 0, 0), type_bathroom, up).
door(0, room(26, type_hallway, 0, 1), type_inner_hallway, down).
door(1, room(26, type_hallway, 0, 3), type_inner_hallway, down).

room(27, type_hallway, 0, 0..4).
door(0, room(27, type_hallway, 0, 1), type_inner_hallway, down).
door(1, room(27, type_hallway, 0, 4), type_inner_hallway, down).
door(0, room(27, type_hallway, 0, 4), type_bathroom, up).

room(28, type_hallway, 0, 0..4).
door(0, room(28, type_hallway, 0, 0), type_bathroom, up).
door(0, room(28, type_hallway, 0, 0), type_inner_hallway, down).
door(1, room(28, type_hallway, 0, 4), type_inner_hallway, down).

% inner hallway

room(0, type_inner_hallway, 0..1, 0).
door(0, room(0, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(0, type_inner_hallway, 1, 0), type_office, left).
door(1, room(0, type_inner_hallway, 1, 0), type_office, down).
door(2, room(0, type_inner_hallway, 1, 0), type_office, right).

room(1, type_inner_hallway, 0..1, 0).
door(0, room(1, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(1, type_inner_hallway, 1, 0), type_office, left).
door(1, room(1, type_inner_hallway, 1, 0), type_office, down).
door(2, room(1, type_inner_hallway, 0, 0), type_office, right).

room(2, type_inner_hallway, 0..1, 0).
door(0, room(2, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(2, type_inner_hallway, 1, 0), type_office, left).
door(1, room(2, type_inner_hallway, 1, 0), type_office, right).

room(3, type_inner_hallway, 0..1, 0).
door(0, room(3, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(3, type_inner_hallway, 1, 0), type_office, left).
door(1, room(3, type_inner_hallway, 0, 0), type_office, right).

room(4, type_inner_hallway, 0..1, 0).
door(0, room(4, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(4, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(4, type_inner_hallway, 1, 0), type_office, left).
door(1, room(4, type_inner_hallway, 0, 0), type_office, right).

room(5, type_inner_hallway, 0..1, 0).
door(0, room(5, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(5, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(5, type_inner_hallway, 0, 0), type_office, left).
door(1, room(5, type_inner_hallway, 1, 0), type_office, right).

room(6, type_inner_hallway, 0..1, 0).
room(6, type_inner_hallway, 1, 0).
door(0, room(6, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(6, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(6, type_inner_hallway, 1, 0), type_office, right).
door(1, room(6, type_inner_hallway, 1, 0), type_office, left).

room(7, type_inner_hallway, 0..1, 0).
door(0, room(7, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(7, type_inner_hallway, 0, 0), type_office, up).
door(1, room(7, type_inner_hallway, 0, 0), type_office, right).
empty_wall(7, type_inner_hallway, left).

room(8, type_inner_hallway, 0..1, 0).
door(0, room(8, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(8, type_inner_hallway, 0, 0), type_office, up).
door(1, room(8, type_inner_hallway, 0, 0), type_office, right).
empty_wall(8, type_inner_hallway, left).

room(9, type_inner_hallway, 0..1, 0).
door(0, room(9, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(9, type_inner_hallway, 0, 0), type_office, left).
door(1, room(9, type_inner_hallway, 0, 0), type_office, right).

room(10, type_inner_hallway, 0..1, 0).
door(0, room(10, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(10, type_inner_hallway, 0, 0), type_office, up).
door(1, room(10, type_inner_hallway, 1, 0), type_office, right).
empty_wall(10, type_inner_hallway, left).

room(11, type_inner_hallway, 0..1, 0).
door(0, room(11, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(11, type_inner_hallway, 0, 0), type_office, up).
door(1, room(11, type_inner_hallway, 1, 0), type_office, left).
empty_wall(11, type_inner_hallway, right).

room(12, type_inner_hallway, 0..1, 0).
door(0, room(12, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(12, type_inner_hallway, 0, 0), type_office, up).
door(1, room(12, type_inner_hallway, 1, 0), type_office, right).
empty_wall(12, type_inner_hallway, left).

room(13, type_inner_hallway, 0..1, 0).
door(0, room(13, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(13, type_inner_hallway, 0, 0), type_office, up).
empty_wall(13, type_inner_hallway, left).
empty_wall(13, type_inner_hallway, right).


room(14, type_inner_hallway, 0..2, 0).
door(0, room(14, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(14, type_inner_hallway, 0, 0), type_office, left).
door(1, room(14, type_inner_hallway, 0, 0), type_office, right).
door(2, room(14, type_inner_hallway, 2, 0), type_office, left).
door(3, room(14, type_inner_hallway, 2, 0), type_office, right).
door(4, room(14, type_inner_hallway, 2, 0), type_office, down).

room(15, type_inner_hallway, 0..2, 0).
door(0, room(15, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(15, type_inner_hallway, 0, 0), type_office, left).
door(1, room(15, type_inner_hallway, 2, 0), type_office, left).
door(2, room(15, type_inner_hallway, 2, 0), type_office, right).

room(16, type_inner_hallway, 0..2, 0).
door(0, room(16, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(16, type_inner_hallway, 0, 0), type_office, right).
door(1, room(16, type_inner_hallway, 2, 0), type_office, left).
door(2, room(16, type_inner_hallway, 2, 0), type_office, right).

room(17, type_inner_hallway, 0..2, 0).
door(0, room(17, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(17, type_inner_hallway, 1, 0), type_office, left).
door(1, room(17, type_inner_hallway, 1, 0), type_office, rigth).

room(18, type_inner_hallway, 0..2, 0).
door(0, room(18, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(18, type_inner_hallway, 0, 0), type_office, right).
door(1, room(18, type_inner_hallway, 1, 0), type_office, left).
door(2, room(18, type_inner_hallway, 2, 0), type_office, right).

room(19, type_inner_hallway, 0..2, 0).
door(0, room(19, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(19, type_inner_hallway, 0, 0), type_office, left).
door(1, room(19, type_inner_hallway, 2, 0), type_office, left).
door(2, room(19, type_inner_hallway, 1, 0), type_office, right).

room(20, type_inner_hallway, 0..2, 0).
door(0, room(20, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(20, type_inner_hallway, 1, 0), type_office, left).
door(1, room(20, type_inner_hallway, 1, 0), type_office, right).
door(2, room(20, type_inner_hallway, 2, 0), type_office, down).

room(21, type_inner_hallway, 0..2, 0).
door(0, room(21, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(21, type_inner_hallway, 0, 0), type_office, left).
door(1, room(21, type_inner_hallway, 0, 0), type_office, right).
door(2, room(21, type_inner_hallway, 2, 0), type_office, left).
door(3, room(21, type_inner_hallway, 2, 0), type_office, right).
door(4, room(21, type_inner_hallway, 0, 0), type_office, up).

room(22, type_inner_hallway, 0..2, 0).
door(0, room(22, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(22, type_inner_hallway, 0, 0), type_office, left).
door(1, room(22, type_inner_hallway, 2, 0), type_office, left).
door(2, room(22, type_inner_hallway, 2, 0), type_office, right).
door(3, room(22, type_inner_hallway, 0, 0), type_office, up).

room(23, type_inner_hallway, 0..2, 0).
door(0, room(23, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(23, type_inner_hallway, 0, 0), type_office, left).
door(1, room(23, type_inner_hallway, 0, 0), type_office, right).
door(2, room(23, type_inner_hallway, 2, 0), type_office, right).
door(3, room(23, type_inner_hallway, 0, 0), type_office, up).

room(24, type_inner_hallway, 0..2, 0).
door(0, room(24, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(24, type_inner_hallway, 1, 0), type_office, left).
door(1, room(24, type_inner_hallway, 1, 0), type_office, right).
door(2, room(24, type_inner_hallway, 2, 0), type_office, up).

room(25, type_inner_hallway, 0..2, 0).
door(0, room(25, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(25, type_inner_hallway, 1, 0), type_office, left).
door(1, room(25, type_inner_hallway, 2, 0), type_office, right).
door(2, room(25, type_inner_hallway, 0, 0), type_office, right).

room(26, type_inner_hallway, 0..2, 0).
door(0, room(26, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(26, type_inner_hallway, 1, 0), type_office, right).
door(1, room(26, type_inner_hallway, 2, 0), type_office, left).
door(2, room(26, type_inner_hallway, 0, 0), type_office, left).

room(27, type_inner_hallway, 0..2, 0).
door(0, room(27, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(27, type_inner_hallway, 1, 0), type_office, right).
door(1, room(27, type_inner_hallway, 1, 0), type_office, left).

room(28, type_inner_hallway, 0..1, 0).
door(0, room(28, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(28, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(28, type_inner_hallway, 1, 0), type_classroom, right).
door(2, room(28, type_inner_hallway, 1, 0), type_classroom, down).

room(29, type_inner_hallway, 0..1, 0).
door(0, room(29, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(29, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(29, type_inner_hallway, 1, 0), type_classroom, down).
door(2, room(29, type_inner_hallway, 0, 0), type_classroom, right).

room(30, type_inner_hallway, 0..1, 0).
door(0, room(30, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(30, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(30, type_inner_hallway, 1, 0), type_classroom, right).

room(31, type_inner_hallway, 0..1, 0).
door(0, room(31, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(31, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(31, type_inner_hallway, 0, 0), type_classroom, right).

room(32, type_inner_hallway, 0..1, 0).
door(0, room(32, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(32, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(32, type_inner_hallway, 0, 0), type_classroom, right).
door(0, room(32, type_inner_hallway, 1, 0), type_inner_hallway, down).

room(33, type_inner_hallway, 0..1, 0).
door(0, room(33, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(33, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(33, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(33, type_inner_hallway, 1, 0), type_classroom, right).

room(34, type_inner_hallway, 0..1, 0).
door(0, room(34, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(34, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(34, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(34, type_inner_hallway, 1, 0), type_classroom, right).

room(35, type_inner_hallway, 0..1, 0).
door(0, room(35, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(35, type_inner_hallway, 0, 0), type_classroom, up).
door(1, room(35, type_inner_hallway, 0, 0), type_classroom, right).
empty_wall(35, type_inner_hallway, left).

room(36, type_inner_hallway, 0..1, 0).
door(0, room(36, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(36, type_inner_hallway, 0, 0), type_classroom, up).
door(1, room(36, type_inner_hallway, 0, 0), type_classroom, left).
empty_wall(36, type_inner_hallway, right).

room(37, type_inner_hallway, 0..1, 0).
door(0, room(37, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(37, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(37, type_inner_hallway, 0, 0), type_classroom, right).

room(38, type_inner_hallway, 0..1, 0).
door(0, room(38, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(38, type_inner_hallway, 0, 0), type_classroom, up).
door(1, room(38, type_inner_hallway, 1, 0), type_classroom, right).
empty_wall(38, type_inner_hallway, left).

room(39, type_inner_hallway, 0..1, 0).
door(0, room(39, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(39, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(39, type_inner_hallway, 0, 0), type_classroom, up).
empty_wall(7, type_inner_hallway, right).

room(40, type_inner_hallway, 0..1, 0).
door(0, room(40, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(40, type_inner_hallway, 0, 0), type_classroom, up).
door(1, room(40, type_inner_hallway, 1, 0), type_classroom, right).
empty_wall(40, type_inner_hallway, left).

room(41, type_inner_hallway, 0..1, 0).
door(0, room(41, type_inner_hallway, 1, 0), type_hallway, down).
door(0, room(41, type_inner_hallway, 0, 0), type_classroom, up).
empty_wall(41, type_inner_hallway, left).
empty_wall(41, type_inner_hallway, right).

room(42, type_inner_hallway, 0..2, 0).
door(0, room(42, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(42, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(42, type_inner_hallway, 2, 0), type_classroom, left).
door(2, room(42, type_inner_hallway, 2, 0), type_classroom, down).
door(3, room(42, type_inner_hallway, 2, 0), type_classroom, right).
door(4, room(42, type_inner_hallway, 0, 0), type_classroom, right).

room(43, type_inner_hallway, 0..2, 0).
door(0, room(43, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(43, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(43, type_inner_hallway, 2, 0), type_classroom, left).
door(2, room(43, type_inner_hallway, 2, 0), type_classroom, right).

room(44, type_inner_hallway, 0..2, 0).
door(0, room(44, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(44, type_inner_hallway, 2, 0), type_classroom, left).
door(1, room(44, type_inner_hallway, 0, 0), type_classroom, right).
door(2, room(44, type_inner_hallway, 2, 0), type_classroom, right).

room(45, type_inner_hallway, 0..2, 0).
door(0, room(45, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(45, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(45, type_inner_hallway, 2, 0), type_classroom, left).

room(46, type_inner_hallway, 0..2, 0).
door(0, room(46, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(46, type_inner_hallway, 0, 0), type_classroom, right).
door(1, room(46, type_inner_hallway, 1, 0), type_classroom, left).
door(2, room(46, type_inner_hallway, 2, 0), type_classroom, right).

room(47, type_inner_hallway, 0..2, 0).
door(0, room(47, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(47, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(47, type_inner_hallway, 2, 0), type_classroom, left).
door(2, room(47, type_inner_hallway, 1, 0), type_classroom, right).

room(48, type_inner_hallway, 0..2, 0).
door(0, room(48, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(48, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(48, type_inner_hallway, 1, 0), type_classroom, right).
door(2, room(48, type_inner_hallway, 2, 0), type_classroom, down).

room(49, type_inner_hallway, 0..2, 0).
door(0, room(49, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(49, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(49, type_inner_hallway, 0, 0), type_classroom, right).
door(2, room(49, type_inner_hallway, 2, 0), type_classroom, left).
door(3, room(49, type_inner_hallway, 2, 0), type_classroom, right).
door(4, room(49, type_inner_hallway, 0, 0), type_classroom, up).

room(50, type_inner_hallway, 0..2, 0).
door(0, room(50, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(50, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(50, type_inner_hallway, 2, 0), type_classroom, left).
door(2, room(50, type_inner_hallway, 2, 0), type_classroom, right).
door(3, room(50, type_inner_hallway, 0, 0), type_classroom, up).

room(51, type_inner_hallway, 0..2, 0).
door(0, room(51, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(51, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(51, type_inner_hallway, 0, 0), type_classroom, right).
door(2, room(51, type_inner_hallway, 2, 0), type_classroom, right).
door(3, room(51, type_inner_hallway, 0, 0), type_classroom, up).

room(52, type_inner_hallway, 0..2, 0).
door(0, room(52, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(52, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(52, type_inner_hallway, 1, 0), type_classroom, right).
door(2, room(52, type_inner_hallway, 0, 0), type_classroom, up).

room(53, type_inner_hallway, 0..2, 0).
door(0, room(53, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(53, type_inner_hallway, 1, 0), type_classroom, right).
door(1, room(53, type_inner_hallway, 2, 0), type_classroom, left).
door(2, room(53, type_inner_hallway, 0, 0), type_classroom, right).

room(54, type_inner_hallway, 0..2, 0).
door(0, room(54, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(54, type_inner_hallway, 1, 0), type_classroom, right).
door(1, room(54, type_inner_hallway, 2, 0), type_classroom, left).
door(2, room(54, type_inner_hallway, 0, 0), type_classroom, left).

room(55, type_inner_hallway, 0..2, 0).
door(0, room(55, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(55, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(55, type_inner_hallway, 1, 0), type_classroom, right).

room(56, type_inner_hallway, 0..2, 0).
door(0, room(56, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(56, type_inner_hallway, 1, 0), type_classroom, left).
empty_wall(56, type_inner_hallway, right).

room(57, type_inner_hallway, 0..2, 0).
door(0, room(57, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(57, type_inner_hallway, 1, 0), type_classroom, right).
empty_wall(57, type_inner_hallway, left).

room(58, type_inner_hallway, 0..2, 0).
door(0, room(58, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(58, type_inner_hallway, 1, 0), type_classroom, right).
empty_wall(58, type_inner_hallway, left).

room(59, type_inner_hallway, 0..2, 0).
door(0, room(59, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(59, type_inner_hallway, 1, 0), type_classroom, left).
empty_wall(59, type_inner_hallway, right).

room(60, type_inner_hallway, 0..2, 0).
door(0, room(60, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(60, type_inner_hallway, 1, 0), type_classroom, left).
empty_wall(60, type_inner_hallway, right).

room(61, type_inner_hallway, 0..2, 0).
door(0, room(61, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(61, type_inner_hallway, 1, 0), type_classroom, right).
empty_wall(61, type_inner_hallway, left).

room(62, type_inner_hallway, 0..2, 0).
door(0, room(62, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(62, type_inner_hallway, 1, 0), type_classroom, right).
empty_wall(62, type_inner_hallway, left).

room(63, type_inner_hallway, 0..2, 0).
door(0, room(63, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(63, type_inner_hallway, 1, 0), type_classroom, left).
empty_wall(63, type_inner_hallway, right).

% bathroom

room(0, type_bathroom, 0, 0..1).
door(0, room(0, type_bathroom, 0, 0), type_hallway, down).

room(1, type_bathroom, 0, 0..1).
door(0, room(1, type_bathroom, 0, 0), type_hallway, up).

room(2, type_bathroom, 0, 0..1).
door(0, room(2, type_bathroom, 0, 1), type_hallway, up).

room(3, type_bathroom, 0, 0..1).
door(0, room(3, type_bathroom, 0, 1), type_hallway, down).

room(4, type_bathroom, 0, 0..1).
door(0, room(4, type_bathroom, 0, 1), type_hallway, right).

room(5, type_bathroom, 0, 0..1).
door(0, room(5, type_bathroom, 0, 0), type_hallway, left).

room(6, type_bathroom, 0..1, 0..1).
door(0, room(6, type_bathroom, 0, 0), type_hallway, up).

room(7, type_bathroom, 0..1, 0..1).
door(0, room(7, type_bathroom, 1, 0), type_hallway, down).

room(8, type_bathroom, 0, 0..1).
door(0, room(8, type_bathroom, 0, 0), type_hallway, left).




% office

room(0, type_office, 0..1, 0..1).
door(0, room(0, type_office, 0, 0), type_inner_hallway, left).

room(1, type_office, 0..1, 0..1).
door(0, room(1, type_office, 1, 0), type_inner_hallway, left).

room(2, type_office, 0..1, 0..1).
door(0, room(2, type_office, 1, 0), type_inner_hallway, down).

room(3, type_office, 0..1, 0..1).
door(0, room(3, type_office, 1, 1), type_inner_hallway, down).

room(4, type_office, 0..1, 0..1).
door(0, room(4, type_office, 1, 1), type_inner_hallway, right).

room(5, type_office, 0..1, 0..1).
door(0, room(5, type_office, 0, 1), type_inner_hallway, right).

room(6, type_office, 0..1, 0..1).
door(0, room(6, type_office, 0, 1), type_inner_hallway, up).

room(7, type_office, 0..1, 0..1).
door(0, room(7, type_office, 0, 0), type_inner_hallway, up).


% classroom
% lecture hall

room(0, type_classroom, 0..9, 0..7).
door(0, room(0, type_classroom, 1, 0), type_inner_hallway, left).

room(1, type_classroom, 0..9, 0..7).
door(0, room(1, type_classroom, 8, 7 ), type_inner_hallway, right).

room(2, type_classroom, 0..9, 0..7).
door(0, room(2, type_classroom, 1, 7), type_inner_hallway, right).

room(3, type_classroom, 0..9, 0..7).
door(0, room(3, type_classroom, 8, 0), type_inner_hallway, left).


% standard classroom

room(4, type_classroom, 0..1, 0..2).
door(0, room(4, type_classroom, 0, 1), type_inner_hallway, up).

room(5, type_classroom, 0..1, 0..1).
door(0, room(5, type_classroom, 0, 0), type_inner_hallway, left).

room(6, type_classroom, 0..1, 0..1).
door(0, room(6, type_classroom, 0, 1), type_inner_hallway, right).

room(7, type_classroom, 0..2, 0..1).
door(0, room(7, type_classroom, 1, 1), type_inner_hallway, right).

room(8, type_classroom, 0..1, 0..2).
door(0, room(8, type_classroom, 0, 1), type_inner_hallway, up).

room(9, type_classroom, 0..1, 0..2).
door(0, room(9, type_classroom, 1, 1), type_inner_hallway, down).

room(10, type_classroom, 0..1, 0..2).
door(0, room(10, type_classroom, 1, 1), type_inner_hallway, down).

room(11, type_classroom, 0..1, 0..1).
door(0, room(11, type_classroom, 1, 1), type_inner_hallway, right).

room(12, type_classroom, 0..1, 0..1).
door(0, room(12, type_classroom, 1, 0), type_inner_hallway, left).

room(13, type_classroom, 0..1, 0..1).
door(0, room(13, type_classroom, 0, 1), type_inner_hallway, up).

room(14, type_classroom, 0..1, 0..1).
door(0, room(14, type_classroom, 1, 1), type_inner_hallway, down).

room(15, type_classroom, 0..1, 0..1).
door(0, room(15, type_classroom, 0, 0), type_inner_hallway, up).

room(16, type_classroom, 0..1, 0..1).
door(0, room(16, type_classroom, 1, 0), type_inner_hallway, down).

room(17, type_classroom, 0..1, 0..2).
door(0, room(17, type_classroom, 0, 2), type_inner_hallway, up).

room(18, type_classroom, 0..1, 0..2).
door(0, room(18, type_classroom, 1, 2), type_inner_hallway, down).

room(19, type_classroom, 0..1, 0..2).
door(0, room(19, type_classroom, 0, 0), type_inner_hallway, up).

room(20, type_classroom, 0..1, 0..2).
door(0, room(20, type_classroom, 1, 0), type_inner_hallway, down).

room(21, type_classroom, 0..2, 0..1).
door(0, room(21, type_classroom, 0, 1), type_inner_hallway, left).

room(22, type_classroom, 0..2, 0..1).
door(0, room(22, type_classroom, 0, 0), type_inner_hallway, left).

room(23, type_classroom, 0..2, 0..1).
door(0, room(23, type_classroom, 0, 1), type_inner_hallway, right).

room(24, type_classroom, 0..2, 0..1).
door(0, room(24, type_classroom, 1, 0), type_inner_hallway, left).

room(25, type_classroom, 0..2, 0..1).
door(0, room(25, type_classroom, 1, 1), type_inner_hallway, right).

room(26, type_classroom, 0..2, 0..1).
door(0, room(26, type_classroom, 2, 0), type_inner_hallway, left).

room(27, type_classroom, 0..2, 0..1).
door(0, room(27, type_classroom, 2, 1), type_inner_hallway, right).
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

% Count the number of new placed rooms
n_new_rooms(N) :- N = #count { ROOM_ID, ROOM_TYPE : placed_new(ROOM_ID, ROOM_TYPE, _, _, _, _) }.

% Randomly choose hallway room if no other room is already placed
placed_new(ROOM_ID, ROOM_TYPE, X, Y, Xr, Yr) :-
    n_old_rooms(0),
    ROOM_ID = @delta(randint(0, hallway_configurations)),
    ROOM_TYPE = type_hallway,
    X = 0,
    Y = 0,
    Xr = map_size/2,
    Yr = map_size/2.

placed_new(ROOM_ID1, ROOM_TYPE1, X1, Y1, Xr1, Yr1) :-
    placed_new(ROOM_ID1, ROOM_TYPE1, X2, Y2, Xr2, Yr2),
    room(ROOM_ID1, ROOM_TYPE1, X2, Y2),
    room(ROOM_ID1, ROOM_TYPE1, X1, Y1),
    Xr1 = Xr2 + X1 - X2,
    Yr1 = Yr2 + Y1 - Y2.

placed_old(ROOM_ID, ROOM_TYPE, X1, Y1, Xr1, Yr1) :- 
    placed_old(ROOM_ID, ROOM_TYPE, X2, Y2, Xr2, Yr2),
    room(ROOM_ID, ROOM_TYPE, X2, Y2),
    room(ROOM_ID, ROOM_TYPE, X1, Y1),
    Xr1 = Xr2 + X1 - X2,
    Yr1 = Yr2 + Y1 - Y2.

% A room can't be placed outside the map
:- placed_new(ROOM_ID, ROOM_TYPE, X, Y, Xr, Yr), not map(Xr, Yr).

% Two rooms can't be placed in the same map coordinates
:- placed_new(ROOM_ID, ROOM_TYPE, _, _, Xr, Yr),
    placed_new(ROOM_ID2, ROOM_TYPE2, _, _, Xr, Yr),
    ROOM_ID != ROOM_ID2.

% A new room can't be placed on top of an old room
:- placed_new(ROOM_ID, ROOM_TYPE, _, _, Xr, Yr),
    placed_old(ROOM_ID2, ROOM_TYPE2, _, _, Xr, Yr).

% An old room can't be placed on top of an old room
:- placed_old(ROOM_ID, ROOM_TYPE, _, _, Xr, Yr),
    placed_old(ROOM_ID2, ROOM_TYPE2, _, _, Xr, Yr),
    ROOM_ID != ROOM_ID2.

% atoms to single coordinates
x_placed_new(ROOM_ID, ROOM_TYPE, X, Xr) :- placed_new(ROOM_ID, ROOM_TYPE, X, _, Xr, _).
y_placed_new(ROOM_ID, ROOM_TYPE, Y, Yr) :- placed_new(ROOM_ID, ROOM_TYPE, _, Y, _, Yr).
x_placed_old(ROOM_ID, ROOM_TYPE, X, Xr) :- placed_old(ROOM_ID, ROOM_TYPE, X, _, Xr, _).
y_placed_old(ROOM_ID, ROOM_TYPE, Y, Yr) :- placed_old(ROOM_ID, ROOM_TYPE, _, Y, _, Yr).

placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr, Yr):-
    x_placed_old(ROOM_ID, ROOM_TYPE, X, Xr),
    y_placed_old(ROOM_ID, ROOM_TYPE, Y, Yr),
    x_pos_room_door(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, X),
    y_pos_room_door(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Y).

x_placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr):-
    placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Xr, _).

y_placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, Yr):-
    placed_door_old(DOOR_ID, ROOM_ID, ROOM_TYPE, DOOR_TYPE, DIRECTION, _, Yr).

% Guess one connection from an already placed door to a possible room
{ connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2) :
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Xr1),
    y_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Yr1),
    x_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Xr2),
    y_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Yr2),
    opposite(DIRECTION1, DIRECTION2),
    DOOR_TYPE1 = ROOM_TYPE2,
    DOOR_TYPE2 = ROOM_TYPE1
}1.

connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DOOR_ID2, DOOR_TYPE2) :-
    connected(ROOM_ID2, ROOM_TYPE2, ROOM_ID1, ROOM_TYPE1, DOOR_ID2, DOOR_TYPE2, DIRECTION2, DOOR_ID1, DOOR_TYPE1, DIRECTION1).

% The last iteration has no new connections, to be able to get a valid answer set a fake connection is generated,
%   so the program know when to stop
connected(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1) :- n_old_rooms(N), N >= min_rooms, n_new_rooms(0).

% The first iteration is a special case, the first room is placed, so i don't need a connection
:- not connected(_, _, _, _, _, _, _, _, _, _), n_old_rooms(N), N != 0.

:- connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, _),
    x_placed_door_old(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, _).

% Place a new room if exist a valid connection based on door direction
placed_new(ROOM_ID2, ROOM_TYPE2, X2, Y2, Xr2, Yr2) :-
    connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Xr1),
    y_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Yr1),
    x_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, X2),
    y_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Y2),
    not x_placed_old(ROOM_ID2, ROOM_TYPE2, _, _),
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
    not x_placed_old(ROOM_ID2, ROOM_TYPE2, _, _),
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
    not x_placed_old(ROOM_ID2, ROOM_TYPE2, _, _),
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
    not x_placed_old(ROOM_ID2, ROOM_TYPE2, _, _),
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

% This generates the door's id which are placed on the same x-coordinate in an hallway,
%  by design inner_hallways doors can't be more than 2 in the same x-coordinate
parallel_inner_hallways(DOOR_ID1, DOOR_ID2) :-
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, type_inner_hallway, DIRECTION, Xr1),
    x_placed_door_old(DOOR_ID2, ROOM_ID2, ROOM_TYPE1, type_inner_hallway, DIRECTION, Xr2),
    DOOR_ID1 < DOOR_ID2,
    Xr1 == Xr2.

% If there are two doors in the same x-coordinate in an hallway, then the inner_hallways must have two empty walls facing each other
:- connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    parallel_inner_hallways(DOOR_ID1, _),
    not empty_wall(ROOM_ID2, type_inner_hallway, right).

:- connected(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    parallel_inner_hallways(_, DOOR_ID1),
    not empty_wall(ROOM_ID2, type_inner_hallway, left).

#show placed_old/6.
#show placed_new/6.
#show n_new_rooms/1.
#show connected/8.
