extends "behaviours.gd"

func _init():
	type = 2
	type_name = 'helicopter'

	life = 10
	max_life = 10
	attack = 3
	max_ap = 8
	limited_ap = 6
	attack_ap = 1
	max_attacks_number = 3
	ap = 8
	attacks_number = 3
	visibility = 4

func can_capture_building(building):
	return false

