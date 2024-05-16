% room(id,type,x_relative,y_relative)

#const map_size = 9.
#const n_rooms = 10.

#const hallway_types = 3.

room(1,"hallway",0,0).
room(1,"hallway",1,0).
room(1,"hallway",2,0).
door(1, room(1,"hallway",0,0), 1).

room(2,"hallway",0,0).
room(2,"hallway",1,0).
door(1, room(2,"hallway",1,0), 2).

room(3,"hallway",0,0).
room(3,"hallway",0,1).
door(1, room(3,"hallway",0,0), -2).

room(1, "bathroom", 0, 0).
room(1, "bathroom", 1, 0).
room(1, "bathroom", 0, 1).
room(1, "bathroom", 1, 1).
door(1, room(1, "bathroom", 0, 0), -1).

room(1, "office", 0, 0).
room(1, "office", 1, 0).
room(1, "office", 0, 1).
room(1, "office", 1, 1).
door(1, room(1, "office", 0, 0), 1).


% generate starting room
starting_room_id(@delta(randint(1,hallway_types))).
starting_room(ID, "hallway", X, Y) :- room(ID, "hallway",X,Y), starting_room_id(ID). 
:- starting_room(room(X,_,_,_)), starting_room(room(Y,_,_,_)), X!=Y.


% map
rows(0..map_size).
cols(0..map_size).
map(X,Y) :- rows(X), cols(Y).

connect(ID1, TYPE1, ID2, TYPE2) :- door(X, room(ID1, TYPE1, _, _), Z), door(Y, room(ID2, TYPE2, _, _), W), X=Y, TYPE1!=TYPE2.
:- connect(ID1, TYPE1, ID2, TYPE2), door(X, room(ID1, TYPE1, _, _), Z), door(Y, room(ID2, TYPE2, _, _), W), X=Y, TYPE1="bathroom", TYPE2="office".

#show connect/4.






