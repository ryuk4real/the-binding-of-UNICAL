


placed_new(0, 0, 0, 50, 50).
room(0, 0, 0).
room(0, 0, 1).
room(0, 1, 0).
room(0, 1, 1).

placed_new(ROOM_ID1, X1, Y1, Xr1, Yr1) :-
    placed_new(ROOM_ID1, X2, Y2, Xr2, Yr2),
    room(ROOM_ID1, X2, Y2),
    room(ROOM_ID1, X1, Y1),
    Xr1 = Xr2 + X1 - X2,
    Yr1 = Yr2 + Y1 - Y2.
