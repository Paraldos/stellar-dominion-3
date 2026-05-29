extends Node2D

@onready var tile_map: TileMapLayer = $TileMap
const HEX_ID := 0
const HEX_ATLAS_COORDS := Vector2i(0, 0)

func _ready() -> void:
	draw_hex_circle(GameData.map_size)

func draw_hex_circle(size: int) -> void:
	tile_map.clear()

	var center := Vector2i(0, 0)
	var current_ring := [Vector2i(0, 0)]
	var used_cells := {center: true}

	tile_map.set_cell(center, HEX_ID, HEX_ATLAS_COORDS)

	for distance in range(size - 1):
		var next_ring := []

		for cell in current_ring:
			for neighbour in tile_map.get_surrounding_cells(cell):
				if used_cells.has(neighbour): continue
				used_cells[neighbour] = true
				tile_map.set_cell(neighbour, HEX_ID, HEX_ATLAS_COORDS)
				next_ring.append(neighbour)


		current_ring = next_ring