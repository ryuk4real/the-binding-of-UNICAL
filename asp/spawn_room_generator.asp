
#const map_size = 10.
#const hallway_size_distribution = (5,3,3,3,2,2).
#const id = 0.

placed_new(ID, X, Y, Xr, Yr, SHAPE) :-
    ID = id,
    X = 0,
    Y = 0,
    Xr = map_size / 2,
    Yr = map_size / 2.
    SHAPE = @delta(hallway_size_distribution),

