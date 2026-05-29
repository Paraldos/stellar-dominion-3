extends Node

func _get_neighbours(cell: Vector2i) -> Array[Vector2i]:
	var neighbours: Array[Vector2i]
	if cell.y % 2 == 0:
		neighbours = [
			cell + Vector2i(1, 0),
			cell + Vector2i(0, 1),
			cell + Vector2i(-1, 1),
			cell + Vector2i(-1, 0),
			cell + Vector2i(-1, -1),
			cell + Vector2i(0, -1),
		]
	else:
		neighbours = [
			cell + Vector2i(1, 0),
			cell + Vector2i(1, 1),
			cell + Vector2i(0, 1),
			cell + Vector2i(-1, 0),
			cell + Vector2i(0, -1),
			cell + Vector2i(1, -1),
		]
	return neighbours

func get_hex_list(size: int) -> Array[Vector2i]:
	var center := Vector2i(0, 0)
	var hexes: Array[Vector2i] = [center]
	var current_ring := [center]
	hexes = [center]
	for distance in range(size - 1):
		var next_ring := []
		for cell in current_ring:
			for neighbour in _get_neighbours(cell):
				if hexes.has(neighbour): continue
				hexes.push_back(neighbour)
				next_ring.append(neighbour)
		current_ring = next_ring
	return hexes
