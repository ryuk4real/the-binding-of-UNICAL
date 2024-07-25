#const map_size = 100.

#const hallway_configurations = 28.
#const inner_hallway_configurations = 56.
#const bathroom_configurations = 9.
#const office_configurations = 8.
#const classroom_configurations = 28.

#const max_hallways = 1.
#const max_inner_hallways = 4.

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

room(17, type_hallway, 0, 0).
room(17, type_hallway, 0, 1).
room(17, type_hallway, 0, 2).
room(17, type_hallway, -1, 2).
door(0, room(17, type_hallway, 0, 1), type_inner_hallway, down).
door(0, room(17, type_hallway, 0, 0), type_bathroom, up).

room(18, type_hallway, 0, 0).
room(18, type_hallway, 0, 1).
room(18, type_hallway, 0, 2).
room(18, type_hallway, -1, 2).
door(0, room(18, type_hallway, 0, 0), type_inner_hallway, down).
door(1, room(18, type_hallway, 0, 2), type_bathroom, down).
door(0, room(18, type_hallway, 0, 0), type_bathroom, up).

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
door(0, room(62, type_inner_hallway, 1, 0), type_office, right).
empty_wall(62, type_inner_hallway, left).

room(63, type_inner_hallway, 0..2, 0).
door(0, room(63, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(63, type_inner_hallway, 1, 0), type_office, left).
empty_wall(63, type_inner_hallway, right).

room(64, type_inner_hallway, 0..2, 0).
door(0, room(64, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(64, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(64, type_inner_hallway, 2, 0), type_classroom, left).
empty_wall(64, type_inner_hallway, right).

room(65, type_inner_hallway, 0..2, 0).
door(0, room(65, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(65, type_inner_hallway, 0, 0), type_classroom, right).
door(1, room(65, type_inner_hallway, 2, 0), type_classroom, right).
empty_wall(65, type_inner_hallway, left).

room(66, type_inner_hallway, 0..2, 0).
door(0, room(66, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(66, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(66, type_inner_hallway, 2, 0), type_classroom, left).
empty_wall(66, type_inner_hallway, right).

room(67, type_inner_hallway, 0..2, 0).
door(0, room(67, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(67, type_inner_hallway, 0, 0), type_classroom, right).
door(1, room(67, type_inner_hallway, 2, 0), type_classroom, right).
empty_wall(67, type_inner_hallway, left).

room(68, type_inner_hallway, 0..2, 0).
door(0, room(68, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(68, type_inner_hallway, 1, 0), type_classroom, left).
door(1, room(68, type_inner_hallway, 2, 0), type_classroom, left).
empty_wall(68, type_inner_hallway, right).

room(69, type_inner_hallway, 0..2, 0).
door(0, room(69, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(69, type_inner_hallway, 1, 0), type_classroom, right).
door(1, room(69, type_inner_hallway, 2, 0), type_classroom, right).
empty_wall(69, type_inner_hallway, left).

room(70, type_inner_hallway, 0..2, 0).
door(0, room(70, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(70, type_inner_hallway, 0, 0), type_office, left).
door(1, room(70, type_inner_hallway, 2, 0), type_office, left).
empty_wall(70, type_inner_hallway, right).

room(71, type_inner_hallway, 0..2, 0).
door(0, room(71, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(71, type_inner_hallway, 0, 0), type_office, right).
door(1, room(71, type_inner_hallway, 2, 0), type_office, right).
empty_wall(71, type_inner_hallway, left).

room(72, type_inner_hallway, 0..2, 0).
door(0, room(72, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(72, type_inner_hallway, 0, 0), type_office, left).
door(1, room(72, type_inner_hallway, 2, 0), type_office, left).
empty_wall(72, type_inner_hallway, right).

room(73, type_inner_hallway, 0..2, 0).
door(0, room(73, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(73, type_inner_hallway, 0, 0), type_office, right).
door(1, room(73, type_inner_hallway, 2, 0), type_office, right).
empty_wall(73, type_inner_hallway, left).

room(74, type_inner_hallway, 0..2, 0).
door(0, room(74, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(74, type_inner_hallway, 0, 0), type_office, up).
door(1, room(74, type_inner_hallway, 2, 0), type_office, left).
empty_wall(74, type_inner_hallway, right).

room(75, type_inner_hallway, 0..2, 0).
door(0, room(75, type_inner_hallway, 2, 0), type_hallway, down).
door(0, room(75, type_inner_hallway, 0, 0), type_office, up).
door(1, room(75, type_inner_hallway, 2, 0), type_office, right).
empty_wall(75, type_inner_hallway, left).

room(76, type_inner_hallway, 0..2, 0).
door(0, room(76, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(76, type_inner_hallway, 0, 0), type_office, left).
door(1, room(76, type_inner_hallway, 2, 0), type_office, down).
empty_wall(76, type_inner_hallway, right).

room(77, type_inner_hallway, 0..2, 0).
door(0, room(77, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(77, type_inner_hallway, 0, 0), type_office, right).
door(1, room(77, type_inner_hallway, 2, 0), type_office, down).
empty_wall(77, type_inner_hallway, left).

room(78, type_inner_hallway, 0..2, 0).
door(0, room(78, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(78, type_inner_hallway, 0, 0), type_classroom, left).
door(1, room(78, type_inner_hallway, 2, 0), type_classroom, down).
empty_wall(78, type_inner_hallway, right).

room(79, type_inner_hallway, 0..2, 0).
door(0, room(79, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(79, type_inner_hallway, 0, 0), type_classroom, right).
door(1, room(79, type_inner_hallway, 2, 0), type_classroom, down).
empty_wall(79, type_inner_hallway, left).

room(80, type_inner_hallway, 0..1, 0).
door(0, room(80, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(80, type_inner_hallway, 1, 0), type_office, left).
door(0, room(80, type_inner_hallway, 1, 0), type_type_inner_hallway, down).
empty_wall(80, type_inner_hallway, right).

room(81, type_inner_hallway, 0..1, 0).
door(0, room(81, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(81, type_inner_hallway, 0, 0), type_office, right).
door(0, room(81, type_inner_hallway, 1, 0), type_type_inner_hallway, down).
empty_wall(81, type_inner_hallway, left).

room(82, type_inner_hallway, 0..1, 0).
door(0, room(82, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(82, type_inner_hallway, 1, 0), type_office, right).
door(0, room(82, type_inner_hallway, 1, 0), type_type_inner_hallway, down).
empty_wall(82, type_inner_hallway, left).

room(83, type_inner_hallway, 0..1, 0).
door(0, room(83, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(83, type_inner_hallway, 0, 0), type_office, left).
door(0, room(83, type_inner_hallway, 1, 0), type_type_inner_hallway, down).
empty_wall(83, type_inner_hallway, right).

room(84, type_inner_hallway, 0..1, 0).
door(0, room(84, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(84, type_inner_hallway, 1, 0), type_classroom, left).
door(0, room(84, type_inner_hallway, 1, 0), type_inner_hallway, down).
empty_wall(84, type_inner_hallway, right).

room(85, type_inner_hallway, 0..1, 0).
door(0, room(85, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(85, type_inner_hallway, 0, 0), type_classroom, right).
door(0, room(85, type_inner_hallway, 1, 0), type_inner_hallway, down).
empty_wall(85, type_inner_hallway, left).

room(86, type_inner_hallway, 0..1, 0).
door(0, room(86, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(86, type_inner_hallway, 1, 0), type_classroom, left).
door(0, room(86, type_inner_hallway, 1, 0), type_inner_hallway, down).
empty_wall(86, type_inner_hallway, left).

room(87, type_inner_hallway, 0..1, 0).
door(0, room(87, type_inner_hallway, 0, 0), type_hallway, up).
door(0, room(87, type_inner_hallway, 0, 0), type_classroom, right).
door(0, room(87, type_inner_hallway, 1, 0), type_inner_hallway, down).

room(88, type_inner_hallway, 0..1, 0).
door(0, room(88, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(1, room(88, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(88, type_inner_hallway, 1, 0), type_office, left).
empty_wall(88, type_inner_hallway, right).
continuous(88, type_inner_hallway).

room(89, type_inner_hallway, 0..1, 0).
door(0, room(89, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(1, room(89, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(89, type_inner_hallway, 1, 0), type_office, right).
empty_wall(89, type_inner_hallway, left).
continuous(89, type_inner_hallway).

room(90, type_inner_hallway, 0..1, 0).
door(0, room(90, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(1, room(90, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(90, type_inner_hallway, 1, 0), type_office, right).
empty_wall(90, type_inner_hallway, left).
continuous(90, type_inner_hallway).

room(91, type_inner_hallway, 0..1, 0).
door(0, room(91, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(1, room(91, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(91, type_inner_hallway, 0, 0), type_office, left).
empty_wall(91, type_inner_hallway, right).
continuous(91, type_inner_hallway).

room(92, type_inner_hallway, 0..1, 0).
door(0, room(92, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(1, room(92, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(92, type_inner_hallway, 1, 0), type_classroom, left).
empty_wall(92, type_inner_hallway, right).
continuous(92, type_inner_hallway).

room(93, type_inner_hallway, 0..1, 0).
door(0, room(93, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(1, room(93, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(93, type_inner_hallway, 0, 0), type_classroom, right).
empty_wall(93, type_inner_hallway, left).
continuous(93, type_inner_hallway).

room(94, type_inner_hallway, 0..1, 0).
door(0, room(94, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(1, room(94, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(94, type_inner_hallway, 1, 0), type_classroom, right).
empty_wall(94, type_inner_hallway, left).
continuous(94, type_inner_hallway).

room(95, type_inner_hallway, 0..1, 0).
door(0, room(95, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(1, room(95, type_inner_hallway, 1, 0), type_inner_hallway, down).
door(0, room(95, type_inner_hallway, 0, 0), type_classroom, left).
empty_wall(95, type_inner_hallway, right).
continuous(95, type_inner_hallway).

room(96, type_inner_hallway, 0, 0).
door(0, room(96, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(1, room(96, type_inner_hallway, 0, 0), type_inner_hallway, down).
continuous(96, type_inner_hallway).
empty_wall(96, type_inner_hallway, left).
empty_wall(96, type_inner_hallway, right).

room(97, type_inner_hallway, 0..1, 0).
door(0, room(97, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(0, room(97, type_inner_hallway, 0, 1), type_classroom, down).
continuous(97, type_inner_hallway).
empty_wall(97, type_inner_hallway, left).
empty_wall(97, type_inner_hallway, right).

room(98, type_inner_hallway, 0..1, 0).
door(0, room(98, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(0, room(98, type_inner_hallway, 0, 1), type_office, down).
continuous(98, type_inner_hallway).
empty_wall(98, type_inner_hallway, left).
empty_wall(98, type_inner_hallway, right).

room(99, type_inner_hallway, 0..1, 0).
door(0, room(99, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(0, room(99, type_inner_hallway, 1, 0), type_office, left).
empty_wall(99, type_inner_hallway, right).

room(100, type_inner_hallway, 0..1, 0).
door(0, room(100, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(0, room(100, type_inner_hallway, 1, 0), type_office, right).
empty_wall(100, type_inner_hallway, left).

room(101, type_inner_hallway, 0..1, 0).
door(0, room(101, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(0, room(101, type_inner_hallway, 1, 0), type_office, right).
empty_wall(101, type_inner_hallway, left).

room(102, type_inner_hallway, 0..1, 0).
door(0, room(102, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(0, room(102, type_inner_hallway, 0, 0), type_office, left).
empty_wall(102, type_inner_hallway, right).

room(103, type_inner_hallway, 0..1, 0).
door(0, room(103, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(0, room(103, type_inner_hallway, 1, 0), type_classroom, left).
empty_wall(103, type_inner_hallway, right).

room(104, type_inner_hallway, 0..1, 0).
door(0, room(104, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(0, room(104, type_inner_hallway, 0, 0), type_classroom, right).
empty_wall(104, type_inner_hallway, left).

room(105, type_inner_hallway, 0..1, 0).
door(0, room(105, type_inner_hallway, 0, 0), type_inner_hallway, up).
door(0, room(105, type_inner_hallway, 1, 0), type_classroom, right).
empty_wall(105, type_inner_hallway, left).

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

%room(0, type_classroom, 0..9, 0..7).
%door(0, room(0, type_classroom, 1, 0), type_inner_hallway, left).
%
%room(1, type_classroom, 0..9, 0..7).
%door(0, room(1, type_classroom, 8, 7 ), type_inner_hallway, right).
%
%room(2, type_classroom, 0..9, 0..7).
%door(0, room(2, type_classroom, 1, 7), type_inner_hallway, right).
%
%room(3, type_classroom, 0..9, 0..7).
%door(0, room(3, type_classroom, 8, 0), type_inner_hallway, left).




% classroom
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

% classroom
% lab

room(28, type_classroom, 0..1, 0..1).
door(0, room(28, type_classroom, 0, 0), type_inner_hallway, left).

room(29, type_classroom, 0..1, 0..1).
door(0, room(29, type_classroom, 0, 1), type_inner_hallway, right).

room(30, type_classroom, 0..1, 0..1).
door(0, room(30, type_classroom, 1, 1), type_inner_hallway, right).

room(31, type_classroom, 0..1, 0..1).
door(0, room(31, type_classroom, 1, 0), type_inner_hallway, left).

room(32, type_classroom, 0..1, 0..1).
door(0, room(32, type_classroom, 0, 0), type_inner_hallway, up).

room(33, type_classroom, 0..1, 0..1).
door(0, room(33, type_classroom, 1, 0), type_inner_hallway, down).

room(34, type_classroom, 0..2, 0..1).
door(0, room(34, type_classroom, 0, 0), type_inner_hallway, left).

room(35, type_classroom, 0..2, 0..1).
door(0, room(35, type_classroom, 2, 1), type_inner_hallway, right).

room(36, type_classroom, 0..2, 0..1).
door(0, room(36, type_classroom, 0, 1), type_inner_hallway, right).

room(37, type_classroom, 0..2, 0..1).
door(0, room(37, type_classroom, 2, 0), type_inner_hallway, left).

room(38, type_classroom, 0..2, 0..1).
door(0, room(38, type_classroom, 1, 0), type_inner_hallway, left).

room(39, type_classroom, 0..2, 0..1).
door(0, room(39, type_classroom, 1, 1), type_inner_hallway, right).

room(40, type_classroom, 0..2, 0..1).
door(0, room(40, type_classroom, 1, 1), type_inner_hallway, right).

room(41, type_classroom, 0..2, 0..1).
door(0, room(41, type_classroom, 1, 0), type_inner_hallway, left).

room(42, type_classroom, 0..1, 0..2).
door(0, room(42, type_classroom, 0, 2), type_inner_hallway, up).

room(43, type_classroom, 0..1, 0..2).
door(0, room(43, type_classroom, 1, 0), type_inner_hallway, down).

room(44, type_classroom, 0..1, 0..2).
door(0, room(44, type_classroom, 1, 2), type_inner_hallway, down).

room(45, type_classroom, 0..1, 0..2).
door(0, room(45, type_classroom, 0, 0), type_inner_hallway, up).

room(46, type_classroom, 0..1, 0..2).
door(0, room(46, type_classroom, 0, 1), type_inner_hallway, up).

room(47, type_classroom, 0..1, 0..2).
door(0, room(47, type_classroom, 0, 1), type_inner_hallway, up).

room(48, type_classroom, 0..1, 0..2).
door(0, room(48, type_classroom, 1, 1), type_inner_hallway, down).

room(49, type_classroom, 0..1, 0..2).
door(0, room(49, type_classroom, 1, 1), type_inner_hallway, down).

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

% Count the doors of each placed room
n_doors_placed(ROOM_ID, ROOM_TYPE, N) :- N = #count { DOOR_ID, DOOR_TYPE, DIRECTION : door(DOOR_ID, room(ROOM_ID, ROOM_TYPE, _, _), DOOR_TYPE, DIRECTION) }, placed_old(ROOM_ID, ROOM_TYPE, _, _, _, _).

n_hallways(N) :-
    N = #count { ROOM_ID, ROOM_TYPE : placed_old(ROOM_ID, ROOM_TYPE, _, _, _, _), ROOM_TYPE = type_hallway }.

:- n_hallways(N), N > max_hallways.

% Count the number of connections for each room
n_connections_old(ROOM_ID1, ROOM_TYPE1, N) :- N = #count { ROOM_ID2, ROOM_TYPE2, DOOR_ID2, DOOR_TYPE2 : connected_old(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2) }, placed_old(ROOM_ID1, ROOM_TYPE1, _, _, _, _).

% count the number of continuous inner_hallways connected
n_continuous_inner_hallways(N) :-
    N = #count { ROOM_ID, ROOM_TYPE : continuous(ROOM_ID, ROOM_TYPE), placed_old(ROOM_ID, ROOM_TYPE, _, _, _, _) }.

:- n_continuous_inner_hallways(N), N > max_continuous_inner_hallways,
    connected_new(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    not continuous(ROOM_ID1, ROOM_TYPE1),
    continuous(ROOM_ID2, ROOM_TYPE2).

% Randomly choose hallway room if no other room is already placed
placed_new(ROOM_ID, ROOM_TYPE, X, Y, Xr, Yr) :-
    n_old_rooms(0),
    ROOM_ID = @delta(randint(0, hallway_configurations)),
    %ROOM_ID = 26,
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
{ connected_new(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2) :
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Xr1),
    y_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, Yr1),
    x_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Xr2),
    y_pos_room_door(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, Yr2),
    opposite(DIRECTION1, DIRECTION2),
    DOOR_TYPE1 = ROOM_TYPE2,
    DOOR_TYPE2 = ROOM_TYPE1
} 1.

:- n_new_rooms(0), n_doors_placed(ROOM_ID, ROOM_TYPE, N), n_connections_old(ROOM_ID, ROOM_TYPE, M), N != M.

:- connected_new(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    x_placed_door_old(DOOR_ID1, ROOM_ID1, ROOM_TYPE1, DOOR_TYPE1, DIRECTION1, _),
    x_placed_door_old(DOOR_ID2, ROOM_ID2, ROOM_TYPE2, DOOR_TYPE2, DIRECTION2, _).

connected_old(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2) :-
    connected_old(ROOM_ID2, ROOM_TYPE2, ROOM_ID1, ROOM_TYPE1, DOOR_ID2, DOOR_TYPE2, DIRECTION2, DOOR_ID1, DOOR_TYPE1, DIRECTION1).

% Place a new room if exist a valid connection based on door direction
placed_new(ROOM_ID2, ROOM_TYPE2, X2, Y2, Xr2, Yr2) :-
    connected_new(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
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
    connected_new(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
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
    connected_new(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
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
    connected_new(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, ROOM_TYPE2, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
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
:- connected_new(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, type_inner_hallway, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    parallel_inner_hallways(DOOR_ID1, _),
    not empty_wall(ROOM_ID2, type_inner_hallway, right).

:- connected_new(ROOM_ID1, ROOM_TYPE1, ROOM_ID2, type_inner_hallway, DOOR_ID1, DOOR_TYPE1, DIRECTION1, DOOR_ID2, DOOR_TYPE2, DIRECTION2),
    parallel_inner_hallways(_, DOOR_ID1),
    not empty_wall(ROOM_ID2, type_inner_hallway, left).

#show n_new_rooms/1.
#show placed_old/6.
#show placed_new/6.
#show connected_new/10.
#show connected_old/10.