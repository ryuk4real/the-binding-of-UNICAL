extends Node

var regex: RegEx = RegEx.new()

func _ready() -> void:
	regex.compile("new")

func read_file(_path: String, _read_as_string: bool = false) -> String:
	var file_content: String
	
	if _read_as_string:
		file_content = FileAccess.get_file_as_string(_path)
	else:
		var file: FileAccess = null
		while file == null:
			file = FileAccess.open(_path, FileAccess.READ)
			file_content = file.get_as_text()
		file.close()
	return file_content

func write_file(_path: String, _data: String) -> void:
	var file: FileAccess = null
	
	while file == null:
		file = FileAccess.open(_path, FileAccess.WRITE)
	file.store_line(_data)
	file.close()

func copy(_file_path: String, _destination_path: String) -> void:
	var data: String = read_file(_file_path)
	write_file(_destination_path, data)

func write_atoms(_path: String, _atoms: Array, _file_path: String = "") -> void:
	var file: FileAccess = null
	
	while file == null:
		file = FileAccess.open(_path, FileAccess.WRITE)
	
	if not _file_path.is_empty():
		file.store_line(_file_path)
	
	for atom: String in _atoms:
		var a: String = atom
		a.erase(atom.length() - 1)
		a += "."
		file.store_line(a)
	file.close()

func get_atoms(_answerset: Array) -> Array:
	
	if _answerset.is_empty():
		return []
	
	var atoms: Array = []
	
	for atom: Dictionary in _answerset:
		atoms.append(atom.get("str"))
	
	return atoms

func build_atom(_predicate_name: String, _arguments: Array) -> String:
	var atom: String = _predicate_name
	
	atom += "("
	
	for i in range(_arguments.size()):
		atom += str(_arguments[i])
		if i < _arguments.size() - 1:
			atom += ","
	
	atom += ")"
	
	return atom
