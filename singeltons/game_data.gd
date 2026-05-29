extends Node

var map_size = 3
var tile_size = Vector2(31,32)
var hexes = []
var stars = {}
var star_names = [
	"Solara",
	"Auriga",
	"Vega",
	"Altair",
	"Sirius",
	"Rigel",
	"Arcturus",
	"Bellatrix",
	"Capella",
	"Deneb",
	"Fomalhaut",
	"Antares",
	"Aldebaran",
	"Procyon",
	"Polaris",
	"Spica",
	"Castor",
	"Pollux",
	"Mirach",
	"Alcyone",
	"Erebus",
	"Nebulon",
	"Hyperion",
	"Valeria",
	"Xanthos"
]

func new_game(new_map_size = 4):
	map_size = new_map_size
	hexes = MapHelper.get_hex_list(map_size)
	_get_stars()

func _get_stars():
	var amount_of_stars = hexes.size() / 3
	hexes.shuffle()
	star_names.shuffle()
	for star in amount_of_stars:
		var offset = Vector2(randi_range(-2,2), randi_range(-2,2))
		stars[star] = {
			name = star_names[star],
			hex = hexes[star],
			offset = offset
		}
