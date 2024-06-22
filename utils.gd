class_name Utils
extends Node

static func read_file(_path: String, _read_as_string: bool = false) -> String:
	var program: String
	
	# TODO: get string with or without escape
	if _read_as_string:
		program = FileAccess.get_file_as_string(_path)
	else:
		var file: FileAccess = null
		while file == null:
			file = FileAccess.open(_path, FileAccess.READ)
			program = file.get_as_text()
		file.close()
	return program

static func write_file(_path: String, _data: String) -> void:
	var file: FileAccess = null
	
	while file == null:
		file = FileAccess.open(_path, FileAccess.WRITE)
	file.store_line(_data)
	file.close()
	
	
