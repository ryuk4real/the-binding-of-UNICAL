extends Node2D

var map: Array = []
var map_size = 100

var answer_set: Array = [{ "str": "connected_new(6,1,1,3,0,3,-2,0,1,2)", "predicate": { "name": "connected_new", "arity": 10 }, "arguments": [{ "str": "6", "type": "SymbolType.Number", "number": 6 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "-2", "type": "SymbolType.Number", "number": -2 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }] }, { "str": "connected_old(3,4,5,0,0,0,-1,1,4,1)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "4", "type": "SymbolType.Number", "number": 4 }, { "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "-1", "type": "SymbolType.Number", "number": -1 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "4", "type": "SymbolType.Number", "number": 4 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }] }, { "str": "connected_old(5,0,3,4,1,4,1,0,0,-1)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "4", "type": "SymbolType.Number", "number": 4 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "4", "type": "SymbolType.Number", "number": 4 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "-1", "type": "SymbolType.Number", "number": -1 }] }, { "str": "connected_old(5,0,6,1,0,1,-1,0,0,1)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "6", "type": "SymbolType.Number", "number": 6 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "-1", "type": "SymbolType.Number", "number": -1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }] }, { "str": "connected_old(5,2,104,1,0,1,2,0,2,-2)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "104", "type": "SymbolType.Number", "number": 104 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "-2", "type": "SymbolType.Number", "number": -2 }] }, { "str": "connected_old(5,3,6,1,0,1,-2,1,3,2)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "6", "type": "SymbolType.Number", "number": 6 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "-2", "type": "SymbolType.Number", "number": -2 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }] }, { "str": "connected_old(6,1,5,0,0,0,1,0,1,-1)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "6", "type": "SymbolType.Number", "number": 6 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "-1", "type": "SymbolType.Number", "number": -1 }] }, { "str": "connected_old(6,1,5,3,1,3,2,0,1,-2)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "6", "type": "SymbolType.Number", "number": 6 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "-2", "type": "SymbolType.Number", "number": -2 }] }, { "str": "connected_old(6,1,104,1,0,1,-1,0,1,1)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "6", "type": "SymbolType.Number", "number": 6 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "104", "type": "SymbolType.Number", "number": 104 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "-1", "type": "SymbolType.Number", "number": -1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }] }, { "str": "connected_old(104,1,5,2,0,2,-2,0,1,2)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "104", "type": "SymbolType.Number", "number": 104 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "-2", "type": "SymbolType.Number", "number": -2 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }] }, { "str": "connected_old(104,1,6,1,0,1,1,0,1,-1)", "predicate": { "name": "connected_old", "arity": 10 }, "arguments": [{ "str": "104", "type": "SymbolType.Number", "number": 104 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "6", "type": "SymbolType.Number", "number": 6 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "-1", "type": "SymbolType.Number", "number": -1 }] }, { "str": "n_new_rooms(1)", "predicate": { "name": "n_new_rooms", "arity": 1 }, "arguments": [{ "str": "1", "type": "SymbolType.Number", "number": 1 }] }, { "str": "placed_new(1,3,0,0,51,53)", "predicate": { "name": "placed_new", "arity": 6 }, "arguments": [{ "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "51", "type": "SymbolType.Number", "number": 51 }, { "str": "53", "type": "SymbolType.Number", "number": 53 }] }, { "str": "placed_new(1,3,0,1,51,54)", "predicate": { "name": "placed_new", "arity": 6 }, "arguments": [{ "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "51", "type": "SymbolType.Number", "number": 51 }, { "str": "54", "type": "SymbolType.Number", "number": 54 }] }, { "str": "placed_new(1,3,1,0,52,53)", "predicate": { "name": "placed_new", "arity": 6 }, "arguments": [{ "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }, { "str": "53", "type": "SymbolType.Number", "number": 53 }] }, { "str": "placed_new(1,3,1,1,52,54)", "predicate": { "name": "placed_new", "arity": 6 }, "arguments": [{ "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }, { "str": "54", "type": "SymbolType.Number", "number": 54 }] }, { "str": "placed_old(3,4,0,0,49,51)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "4", "type": "SymbolType.Number", "number": 4 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "49", "type": "SymbolType.Number", "number": 49 }, { "str": "51", "type": "SymbolType.Number", "number": 51 }] }, { "str": "placed_old(3,4,0,1,49,52)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "4", "type": "SymbolType.Number", "number": 4 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "49", "type": "SymbolType.Number", "number": 49 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }] }, { "str": "placed_old(5,0,0,0,50,50)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "50", "type": "SymbolType.Number", "number": 50 }, { "str": "50", "type": "SymbolType.Number", "number": 50 }] }, { "str": "placed_old(5,0,0,1,50,51)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "50", "type": "SymbolType.Number", "number": 50 }, { "str": "51", "type": "SymbolType.Number", "number": 51 }] }, { "str": "placed_old(5,0,0,2,50,52)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "50", "type": "SymbolType.Number", "number": 50 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }] }, { "str": "placed_old(5,2,0,0,53,53)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "53", "type": "SymbolType.Number", "number": 53 }, { "str": "53", "type": "SymbolType.Number", "number": 53 }] }, { "str": "placed_old(5,2,0,1,53,54)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "53", "type": "SymbolType.Number", "number": 53 }, { "str": "54", "type": "SymbolType.Number", "number": 54 }] }, { "str": "placed_old(5,2,1,0,54,53)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "54", "type": "SymbolType.Number", "number": 54 }, { "str": "53", "type": "SymbolType.Number", "number": 53 }] }, { "str": "placed_old(5,2,1,1,54,54)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "2", "type": "SymbolType.Number", "number": 2 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "54", "type": "SymbolType.Number", "number": 54 }, { "str": "54", "type": "SymbolType.Number", "number": 54 }] }, { "str": "placed_old(5,3,0,0,52,50)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }, { "str": "50", "type": "SymbolType.Number", "number": 50 }] }, { "str": "placed_old(5,3,0,1,52,51)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }, { "str": "51", "type": "SymbolType.Number", "number": 51 }] }, { "str": "placed_old(5,3,1,0,53,50)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "53", "type": "SymbolType.Number", "number": 53 }, { "str": "50", "type": "SymbolType.Number", "number": 50 }] }, { "str": "placed_old(5,3,1,1,53,51)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "5", "type": "SymbolType.Number", "number": 5 }, { "str": "3", "type": "SymbolType.Number", "number": 3 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "53", "type": "SymbolType.Number", "number": 53 }, { "str": "51", "type": "SymbolType.Number", "number": 51 }] }, { "str": "placed_old(6,1,0,0,51,52)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "6", "type": "SymbolType.Number", "number": 6 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "51", "type": "SymbolType.Number", "number": 51 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }] }, { "str": "placed_old(6,1,1,0,52,52)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "6", "type": "SymbolType.Number", "number": 6 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }] }, { "str": "placed_old(104,1,0,0,53,52)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "104", "type": "SymbolType.Number", "number": 104 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "53", "type": "SymbolType.Number", "number": 53 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }] }, { "str": "placed_old(104,1,1,0,54,52)", "predicate": { "name": "placed_old", "arity": 6 }, "arguments": [{ "str": "104", "type": "SymbolType.Number", "number": 104 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "1", "type": "SymbolType.Number", "number": 1 }, { "str": "0", "type": "SymbolType.Number", "number": 0 }, { "str": "54", "type": "SymbolType.Number", "number": 54 }, { "str": "52", "type": "SymbolType.Number", "number": 52 }] }]


func _ready():
	_init_map(map, map_size)
	_place_rooms()

func _process(_delta):
	queue_redraw()

func _init_map(_map: Array, _map_size: int):
	for i in range(0, _map_size):
		_map.append([])
		for j in range(0, _map_size):
			_map[i].append([-1,-1])

func _place_rooms():
	for atom in answer_set:
		if atom.get("predicate").get("name") == "placed_old":
			var id = atom.get("arguments")[0].get("number")
			var type = atom.get("arguments")[1].get("number")
			var y = atom.get("arguments")[4].get("number")
			var x = atom.get("arguments")[5].get("number")
			
			print(str(id) +" "+str(type)+" "+str(x)+" "+str(y))
			
			map[x][y][0] = id
			map[x][y][1] = type

func _draw():
	
	if not map.is_empty():
		for i in range(0, map_size):
			for j in range(0, map_size):
				if map[i][j][1] == 0:
					draw_rect(Rect2(i, j, 1.0, 1.0), Color.GREEN, true)
				elif map[i][j][1] == 1:
					draw_rect(Rect2(i, j, 1.0, 1.0), Color.SEA_GREEN, true)
				elif map[i][j][1] == 2:
					draw_rect(Rect2(i, j, 1.0, 1.0), Color.SANDY_BROWN, true)
				elif map[i][j][1] == 3:
					draw_rect(Rect2(i, j, 1.0, 1.0), Color.BISQUE, true)
				elif map[i][j][1] == 4:
					draw_rect(Rect2(i, j, 1.0, 1.0), Color.YELLOW, true)