extends Node2D

@onready var tile_map: TileMapLayer = $TileMap
@onready var stars: Node2D = %Stars
const STAR_BP = preload("uid://dm1w6420xd6lo")
const HEX_ID := 0
const HEX_ATLAS_COORDS := Vector2i(0, 0)

func _ready() -> void:
	GameData.new_game()
	draw_hexes()

func draw_hexes() -> void:
	tile_map.clear()
	for hex in GameData.hexes:
		tile_map.set_cell(hex, HEX_ID, HEX_ATLAS_COORDS)
	for key in GameData.stars:
		var star = GameData.stars[key]
		var new_star = STAR_BP.instantiate()
		print(star.hex)
		new_star.global_position = tile_map.map_to_local(star.hex)
		new_star.global_position += Vector2(-15,-16) + star.offset
		stars.add_child(new_star)
