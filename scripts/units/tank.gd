extends "behaviours.gd"

func _init():
	type = 1
	type_name = 'tank'

	life = 15
	max_life = 15
	attack = 12
	max_ap = 6
	limited_ap = 4
	attack_ap = 1
	max_attacks_number = 1
	ap = 6
	attacks_number = 1
	visibility = 3

func can_capture_building(building):
	return false



