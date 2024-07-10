class_name Utils
extends Node

static func read_file(_path: String, _read_as_string: bool = false) -> String:
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

static func write_file(_path: String, _data: String) -> void:
	var file: FileAccess = null
	
	while file == null:
		file = FileAccess.open(_path, FileAccess.WRITE)
	file.store_line(_data)
	file.close()

static func copy(_file_path: String, _destination_path: String):
	var data = read_file(_file_path)
	write_file(_destination_path, data)

static func write_atoms(_path: String, _atoms: Array, _file_path: String = ""):
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
